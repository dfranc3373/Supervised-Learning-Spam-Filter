<?php

require_once("BodyThreat.php");
require_once("AddressThreat.php");
require_once("SubjectThreat.php");

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

		$this->threshold = 1;

		$bodyobject = new BodyThreat();

		$subjectobject = new SubjectThreat();

		$addressobject = new AddressThreat();

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
