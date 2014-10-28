<?php

require_once("BodyThreat.php");
require_once("AddressThreat.php");
require_once("SubjectThreat.php");
require_once("sql.php");

class Analyzer {

	protected $threshold;
	
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

		$sth = $mysql->prepare("SELECT * FROM `Keywords`");

		$sth->setFetchMode(PDO::FETCH_OBJ);

		$sth->execute();

		$keywords = $sth->fetchAll();
		
		foreach($keywords as $kw){
		
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
		}
		
		
		
		$sth_email = $mysql->prepare("INSERT INTO `Emails` (`ThresholdID`, `Body`, `Subject`, `EmailTo`, `EmailFrom`, `PercentageSpamFound`, `DateFound`, `DateReceived`) VALUES (:ThresholdID, :body, :subject, :emailTo, :emailFrom, :percentageSpamFound, :dateFound, :dateReceived)");

		$date = date('Y-m-d H:i:s', time());

		$sth_email->execute(array(':ThresholdID' => $this->threshold, ':body' => $email->body, ':subject' => $email->subject, ':emailTo' => "", ':emailFrom' => $email->address, ':percentageSpamFound' => '0', ':dateFound' => $date, ':dateReceived' => $date));
		
		$new = $keywords;
		
		$id = $mysql->lastInsertId();
		
		//OBJECTS
		$bodyobject = new BodyThreat($keywords, $id);

		$subjectobject = new SubjectThreat($keywords, $id);

		$addressobject = new AddressThreat($keywords, $id);

		$subjectobject->parseContent($new, $id, $email->subject);

		$addressobject->parseContent($new, $id, $email->address);

		$bodyobject->parseContent($new, $id, $email->body);
		
		
		
		$bodyobject->checkThreat();
		
		

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
