<?php

require_once("BodyThreat.php");
require_once("AddressThreat.php");
require_once("SubjectThreat.php");
require_once("sql.php");

class Analyzer {

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

	function __construct() { //constructor

		$this->threshold = 1;
	
	}
		
	public function analyze($email, $threshold = 1) {

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
		
		$sth_email = $mysql->prepare("INSERT INTO `Emails` (`ThresholdID`, `Body`, `Subject`, `EmailTo`, `EmailFrom`, `PercentageSpamFound`, `DateFound`, `DateReceived`) VALUES (:ThresholdID, :body, :subject, :emailTo, :emailFrom, :percentageSpamFound, :dateFound, :dateReceived)");

		$date = date('Y-m-d H:i:s', time());

		$sth_email->execute(array(':ThresholdID' => $this->threshold, ':body' => $email->body, ':subject' => $email->subject, ':emailTo' => "", ':emailFrom' => $email->address, ':percentageSpamFound' => '0', ':dateFound' => $date, ':dateReceived' => $date));
		
		$new = $keywords;
		
		$id = $mysql->lastInsertId();
		
        foreach($keywords as $kwObj){
            $this->sCount += $kwObj->sCount;
            $this->nsCount += $kwObj->nsCount;
        }
	$sql = "SELECT count(*) FROM `Keywords`"; 
	$result = $con->prepare($sql); 
	$result->execute(); 
	$number_of_rows = $result->fetchColumn();

        // Spam percentage of all emails in database
        // NonSpam percentage of all emails in database
        $this->spamPercent += log(($number_of_rows + $this->sCount)/(($number_of_rows * 2) + $this->sCount + $this->nsCount));
        $this->hamPercent += log(($number_of_rows + $this->nsCount)/(($number_of_rows * 2) + $this->sCount + $this->nsCount));

$body = new BodyThread($keywords, $id, $this->sCount, $this->nsCount, $email->body, $number_of_rows);

$subject = new SubjectThread($keywords, $id, $this->sCount, $this->nsCount, $email->body, $number_of_rows);

$address = new AddressThread($keywords, $id, $this->sCount, $this->nsCount, $email->body, $number_of_rows);

$body->start();

$subject->start();

$address->start();

while($body->data == null || $subject->data == null || $address->data == null) {

	sleep(1);

}

//$total = calcThreat

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

		echo $spam;

		return 1;

	}

	private function getThreshold() {
	
		return $this->Threshold;
		
	}

	private function setThreshold($t) {
	
		$this->Threshold = $t;
		
	}

	private function calcOverall($body, $subject, $address) {
    /*
    
        $this->spamPercent += log(($number_of_rows + $this->sCount)/(($number_of_rows * 2) + $this->sCount + $this->nsCount));
        $this->hamPercent += log(($number_of_rows + $this->nsCount)/(($number_of_rows * 2) + $this->sCount + $this->nsCount));
        
        $HSRatio = $this->hamPerent - $this->spamPercent;
        
        $threatLevel = $HSRation + $subjectobject->parseContent($new, $id, $email->subject) + $addressobject->parseContent($new, $id, $email->address) + $bodyobject->parseContent($new, $id, $email->body);
        
        if ($threatLevel < log(threshold))
            spam
        else
            not spam
     */
	}

}

class BodyThread extends Thread {

    public $keywords;
    public $id;
    public $sCount;
    public $nsCount;
    public $email;
    public $number_of_rows;
    public $data = null;
     
    public function __construct($k, $i, $s, $ns, $e, $n) {
        $this->keywords = $k;
	$this->id $i;
	$this->sCount = $s;
	$this->nsCount = $ns;
	$this->email = $e;
	$this->number_of_rows = $n;
    }
     
    public function run() {

	$bodyobject = new BodyThreat($this->keywords, $this->id, $this->sCount, $this->nsCount);

	$this->data = $bodyobject->parseContent($this->keywords, $this->id, $this->email->body, $this->number_of_rows);

    }
}

class AddressThread extends Thread {

    public $keywords;
    public $id;
    public $sCount;
    public $nsCount;
    public $email;
    public $number_of_rows;
    public $data = null;
     
    public function __construct($k, $i, $s, $ns, $e, $n) {
        $this->keywords = $k;
	$this->id $i;
	$this->sCount = $s;
	$this->nsCount = $ns;
	$this->email = $e;
	$this->number_of_rows = $n;
    }
     
    public function run() {

	$object = new AddressThreat($this->keywords, $this->id, $this->sCount, $this->nsCount);

	$this->data = $object->parseContent($this->keywords, $this->id, $this->email->body, $this->number_of_rows);

    }
}

class SubjectThread extends Thread {

    public $keywords;
    public $id;
    public $sCount;
    public $nsCount;
    public $email;
    public $number_of_rows;
    public $data = null;
     
    public function __construct($k, $i, $s, $ns, $e, $n) {
        $this->keywords = $k;
	$this->id $i;
	$this->sCount = $s;
	$this->nsCount = $ns;
	$this->email = $e;
	$this->number_of_rows = $n;
    }
     
    public function run() {

	$object = new SubjectThreat($this->keywords, $this->id, $this->sCount, $this->nsCount);

	$this->data = $object->parseContent($this->keywords, $this->id, $this->email->body, $this->number_of_rows);

    }
}

?>
