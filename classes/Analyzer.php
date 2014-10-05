<?php

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
		
	public function analyze($email) {
	}

	public function analyze($email, $threshold) {

		$this->setThreshold($threshold);

		$this->analyze($email);

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
