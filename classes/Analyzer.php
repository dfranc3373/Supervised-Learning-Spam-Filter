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
        //210 = Number of KW 
        $this->spamPercent += log((210 + $this->sCount)/(420 + $this->sCount + $this->nsCount));
        $this->hamPercent += log((210 + $this->nsCount)/(420 + $this->sCount + $this->nsCount));
        
		//OBJECTS
		$bodyobject = new BodyThreat($keywords, $id, $this->sCount, $this->nsCount);

		$subjectobject = new SubjectThreat($keywords, $id, $this->sCount, $this->nsCount);

		$addressobject = new AddressThreat($keywords, $id, $this->sCount, $this->nsCount);

		$subjectobject->parseContent($new, $id, $email->subject);

		$addressobject->parseContent($new, $id, $email->address);

		$bodyobject->parseContent($new, $id, $email->body);

		$spam = $bodyobject->checkThreat();

		if($spam == 0) {

			$sth = $mysql->prepare("UPDATE `Emails` SET `SpamFlag` = '1' WHERE `Email_ID` = :EmailID");

			$sth->execute(array(":EmailID" => $id));

		}

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

	}

}

?>
