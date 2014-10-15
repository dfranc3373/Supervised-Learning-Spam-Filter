<?php

require_once("CalculateThreat.php");

class SubjectThreat extends CalculateThreat{

	protected $threshold;
	
	protected $spamPercent;
	
	protected $keywordPercent;

	protected $similarityPercent;

	protected $parsedData;
		
	protected $keywords = Array();
	
	protected $keywordsContained = Array();
	

	function __constructor($keywordArr) {  // Constructor
		
		$this->keywords = $keywordArr;

	}
	
	public function parseContent($s){
		$this->parsedData = explode(' ', $s);
		print_r($this->parsedData);

		$this->scanKeywords();
	}
	
	public function scanKeywords(){
		
		foreach($this->parsedData as $word){
			if(in_array($word, $this->keywords) && !in_array($word, $this->keywordsContained)){
				array_push($this->keywordsContained, strtolower($word));
			}
		}
		print_r($this->keywordsContained);
	}
	
	public function checkSimilarity() {
	
		//made in new object class
		
	}
}
?>
