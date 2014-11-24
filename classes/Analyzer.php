<?php

@session_start();

require_once("BodyThreat.php");
require_once("AddressThreat.php");
require_once("SubjectThreat.php");
require_once("sql.php");

class Analyzer {

    protected $attachment;

	protected $threshold;
	
    protected $sCount;
	    
	protected $nsCount;
	    
	protected $spamPercent;
	    
	protected $hamPercent;
    
	protected $bodyThreat;
	
	protected $subjectThreat;
	
	protected $addressThreat;

	protected $overallThreat;

	protected $result;

	protected $body;

	protected $subject;

	protected $address;

	protected $check;

	function __construct() { //constructor

		$this->threshold = 1;
	
	}
		
	public function analyze($email, $threshold = 1, $eID = 0) {

		$this->check = $eID;

		error_reporting(E_ALL);
		ini_set('display_errors', '1');

		global $mysql;

		$this->setThreshold($threshold);

		$sth = $mysql->prepare("SELECT DISTINCT Keywords.*, (SELECT COUNT(*) FROM `KeywordCount` WHERE KeywordCount.Keyword_ID = Keywords.Keyword_ID AND Emails.SpamFlag = 0) AS nsCount, (SELECT COUNT(*) FROM `KeywordCount` WHERE KeywordCount.Keyword_ID = Keywords.Keyword_ID AND Emails.SpamFlag = 1) AS sCount FROM `Keywords` LEFT JOIN `KeywordCount` on KeywordCount.Keyword_ID = Keywords.Keyword_ID LEFT JOIN `Emails` ON Emails.Email_ID = KeywordCount.Email_ID");

		//$sth = $mysql->prepare("SELECT *,  COUNT(KeywordCount.Keyword_ID) AS `WordCount` FROM `Keywords`");

		$sth->setFetchMode(PDO::FETCH_OBJ);

		$sth->execute();

		$keywords = $sth->fetchAll();
		
		/*foreach($keywords as $kw){
		
			$stmt = $mysql->prepare("SELECT COUNT(KeywordCount.Keyword_ID) AS `WordCount` FROM `KeywordCount` LEFT JOIN `Emails` ON (Emails.Email_ID = KeywordCount.Email_ID) WHERE `Keyword_ID` = :kwID AND Emails.SpamFlag = 1");
			$stmt->setFetchMode(PDO::FETCH_OBJ);
			$stmt->execute(array(':kwID' => $kw->Keyword_ID));
			$result = $stmt->fetch();
			$kw->sCount = $result->WordCount;
			
			$stmt = $mysql->prepare("SELECT COUNT(KeywordCount.Keyword_ID) AS `WordCount` FROM `KeywordCount` LEFT JOIN `Emails` ON (Emails.Email_ID = KeywordCount.Email_ID) WHERE `Keyword_ID` = :kwID AND Emails.SpamFlag = 0");
			$stmt->setFetchMode(PDO::FETCH_OBJ);
			$stmt->execute(array(':kwID' => $kw->Keyword_ID));
			$result = $stmt->fetch();
			$kw->nsCount = $result->WordCount;
		}*/	

		$id = 0;

		if($this->check == 0) {		// If new email, insert into database

			$sth_email = $mysql->prepare("INSERT INTO `Emails` (`ThresholdID`, `Body`, `Subject`, `EmailTo`, `EmailFrom`, `PercentageSpamFound`, `DateFound`, `DateReceived`) VALUES (:ThresholdID, :body, :subject, :emailTo, :emailFrom, :percentageSpamFound, :dateFound, :dateReceived)");

			$date = date('Y-m-d H:i:s', time());

			$sth_email->execute(array(':ThresholdID' => $this->threshold, ':body' => $email->body, ':subject' => $email->subject, ':emailTo' => "", ':emailFrom' => $email->address, ':percentageSpamFound' => '0', ':dateFound' => $date, ':dateReceived' => $date));
		
			//$new = $keywords;

			$id = $mysql->lastInsertId();

		} else {

					$id = $this->check;

		}

		if($id != 0) {

			foreach($keywords as $kwObj) {		// Get the count of spam/not spam count for all keywords

			    $this->sCount += $kwObj->sCount;
			    $this->nsCount += $kwObj->nsCount;

			}

			$sql = "SELECT count(*) FROM `Keywords`"; 
			$result = $mysql->prepare($sql); 
			$result->execute(); 
			$number_of_rows = $result->fetchColumn();

			// Spam percentage of all emails in database
			// NonSpam percentage of all emails in database
			$this->spamPercent += log(($number_of_rows + $this->sCount)/(($number_of_rows * 2) + $this->sCount + $this->nsCount));
			$this->hamPercent += log(($number_of_rows + $this->nsCount)/(($number_of_rows * 2) + $this->sCount + $this->nsCount));

			$body = new BodyThread($keywords, $id, $this->sCount, $this->nsCount, $email->body, $number_of_rows);

			$subject = new SubjectThread($keywords, $id, $this->sCount, $this->nsCount, $email->body, $number_of_rows);

			$address = new AddressThread($keywords, $id, $this->sCount, $this->nsCount, $email->body, $number_of_rows);
            
            $attachment = new BodyThread($keywords, $id, $this->sCount, $this->nsCount, $email->body, $number_of_rows);
            
            if(strlen($email->attachment) > 0){	
                $attachment->run();				// Attachments are passed to the API as strings
            }

			$body->run();

			$subject->run();

			$address->run();
			

			$total = $this->calcOverall($body->data, $subject->data, $address->data, $attachment->data);

			print_r($total);
			
			// Old Code
			// --------------------------------------------------------------------------------------
				/*//OBJECTS
				$bodyobject = new BodyThreat($keywords, $id, $this->sCount, $this->nsCount);

				$subjectobject = new SubjectThreat($keywords, $id, $this->sCount, $this->nsCount);

				$addressobject = new AddressThreat($keywords, $id, $this->sCount, $this->nsCount);

				//pass the Keword Count to parseContent

				$subjectobject->parseContent($new, $id, $email->subject, $number_of_rows);


				$addressobject->parseContent($new, $id, $email->address, $number_of_rows);

				$bodyobject->parseContent($new, $id, $email->body, $number_of_rows);*/

				/*if($spam == 0) {

					$sth = $mysql->prepare("UPDATE `Emails` SET `SpamFlag` = '1' WHERE `Email_ID` = :EmailID");

					$sth->execute(array(":EmailID" => $id));

				}*/
			// ------------------------------------------------------------------------------------------	

				if($total->spam == "true" && $this->check == 0) {
				
					// Update spamFlag in database

					$sth = $mysql->prepare("UPDATE `Emails` SET `SpamFlag` = '1' WHERE `Email_ID` = :EmailID");

					$sth->execute(array(":EmailID" => $id));

				}


				return $total;

			}

		return 0;

	}

	private function getThreshold() {
	
		return $this->Threshold;
		
	}

	private function setThreshold($t) {
	
		$this->Threshold = $t;
		
	}

	private function calcOverall($body, $subject, $address, $attachment) {

    	// Old Code
    	// --------
        //$this->spamPercent += log(($number_of_rows + $this->sCount)/(($number_of_rows * 2) + $this->sCount + $this->nsCount));
        //$this->hamPercent += log(($number_of_rows + $this->nsCount)/(($number_of_rows * 2) + $this->sCount + $this->nsCount));
    
        $HSRatio = $this->hamPercent - $this->spamPercent;
        
        $threatLevel = $HSRatio + $subject + $address + $body + $attachment;
        
		$obj = new stdClass;

		if ($threatLevel < log($this->Threshold)) {

			$obj->spam = "true";

			$obj->spamPercentage = (1/(exp($threatLevel))) - .001;

			return $obj;

		} else {

			$obj->spam = "false";

			$obj->spamPercentage = ((exp($threatLevel))) - .001;

			return $obj;

		}

	}

}//end of Analyzer

class BodyThread {

    public $keywords;
    public $id;
    public $sCount;
    public $nsCount;
    public $email;
    public $number_of_rows;
    public $data;
     
    public function __construct($k, $i, $s, $ns, $e, $n) {
        $this->keywords = $k;
		$this->id = $i;
		$this->sCount = $s;
		$this->nsCount = $ns;
		$this->email = $e;
		$this->number_of_rows = $n;
    }
     
    public function run() {

	$bodyobject = new BodyThreat($this->keywords, $this->id, $this->sCount, $this->nsCount);

	$test = $bodyobject->parseContent($this->keywords, $this->id, $this->email, $this->number_of_rows);

	$this->data = $test;

    }
}

class AddressThread {

    public $keywords;
    public $id;
    public $sCount;
    public $nsCount;
    public $email;
    public $number_of_rows;
    public $data = null;
     
    public function __construct($k, $i, $s, $ns, $e, $n) {
        $this->keywords = $k;
	$this->id = $i;
	$this->sCount = $s;
	$this->nsCount = $ns;
	$this->email = $e;
	$this->number_of_rows = $n;
    }
     
    public function run() {

	$object = new AddressThreat($this->keywords, $this->id, $this->sCount, $this->nsCount);

	$this->data = $object->parseContent($this->keywords, $this->id, $this->email, $this->number_of_rows);

    }
}

class SubjectThread {

    public $keywords;
    public $id;
    public $sCount;
    public $nsCount;
    public $email;
    public $number_of_rows;
    public $data = null;
     
    public function __construct($k, $i, $s, $ns, $e, $n) {
        $this->keywords = $k;
	$this->id = $i;
	$this->sCount = $s;
	$this->nsCount = $ns;
	$this->email = $e;
	$this->number_of_rows = $n;
    }
     
    public function run() {

	$object = new SubjectThreat($this->keywords, $this->id, $this->sCount, $this->nsCount);

	$this->data = $object->parseContent($this->keywords, $this->id, $this->email, $this->number_of_rows);

    }
}

?>
