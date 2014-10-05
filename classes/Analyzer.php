<?php

class Analyzer {

	protected $Threshold;
	
	protected $BodyThreat;
	
	protected $SubjectThreat;
	
	protected $AddressThreat;

	protected $OverallThreat;

	protected $Result;

	protected $Body;

	protected $Subject;

	protected $Address;
	
	function __construct() { //constructor
	
		$this->Threshold = 1;
	
	}
		
	public function Analyze($email) {
	}

	public function Analyze($email, $threshold) {

		$this->setThreshold($threshold);

		$this->Analyze($email);

	}

	private function GetThreshold() {
	
		return $this->Threshold;
		
	}

	private function SetThreshold($t) {
	
		$this->Threshold = $t;
		
	}

	private function CalcOverall($body, $subject, $address) {

	}

}

?>
