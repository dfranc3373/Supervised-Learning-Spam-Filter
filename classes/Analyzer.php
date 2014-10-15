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

		$mysql = new PDO("mysql:host=localhost;dbname=Learning_Database", 'root', '');

		$this->setThreshold($threshold);

		$sth = $mysql->prepare("SELECT `keyword` FROM `Keywords`");

		$keywords = $sth->fetchAll();

		//OBJECTS
			$bodyobject = new BodyThreat($keywords);

			$subjectobject = new SubjectThreat($keywords);

			$addressobject = new AddressThreat($keywords);

		$subjectobject->parseContent($email->subject);

		$addressobject->parseContent($email->address);

		$bodyobject->parseContent($email->body);

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
