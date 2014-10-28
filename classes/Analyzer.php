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
		
			$stmt = "SELECT COUNT(KeywordCount.Keyword_ID) AS `WordCount`FROM `KeywordCount` LEFT JOIN `Emails` ON (Emails.Email_ID = KeywordCount.Email_ID) WHERE `Keyword_ID` = `" . $kw->Keyword_ID . "` AND Emails.SpamFlag = 1";
			$kw->sCount = $stmt->WordCount;
			
			$stmt = "SELECT COUNT(KeywordCount.Keyword_ID) AS `WordCount`FROM `KeywordCount` LEFT JOIN `Emails` ON (Emails.Email_ID = KeywordCount.Email_ID) WHERE `Keyword_ID` = `" . $kw->Keyword_ID . "` AND Emails.SpamFlag = 0";
			$kw->nsCount = $stmt->WordCount;
		}
		
		
		
		$sth_email = $mysql->prepare("INSERT INTO `Emails` (`ThresholdID`, `Body`, `Subject`, `EmailTo`, `EmailFrom`, `PercentageSpamFound`, `DateFound`, `DateReceived`) VALUES (:ThresholdID, :body, :subject, :emailTo, :emailFrom, :percentageSpamFound, :dateFound, :dateReceived)");

		$date = date('Y-m-d H:i:s', time());

		$sth_email->execute(array(':ThresholdID' => $this->threshold, ':body' => $email->body, ':subject' => $email->subject, ':emailTo' => "", ':emailFrom' => "", ':percentageSpamFound' => '0', ':dateFound' => $date, ':dateReceived' => $date));
		
		$new = $keywords;
				
		//OBJECTS
			//$bodyobject = new BodyThreat($keywords, 1);

			$subjectobject = new SubjectThreat();

			//$addressobject = new AddressThreat($keywords, 1);

		$subjectobject->parseContent($new, 1, $email->subject);

		//$addressobject->parseContent($email->address);

		//$bodyobject->parseContent($email->body);

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
