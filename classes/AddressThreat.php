<?php

require_once("CalculateThreat.php");

class addressThreat extends CalculateThreat{

	protected $threshold;
	
	protected $spamPercent;
	
	protected $keywordPercent;

	protected $similarityPercent;

	protected $keywords = Array();

	protected $parsedData = Array();
	
	protected $keywordsContained = Array();
	
	function __constructor($keywordArr){  // Constructor
		$this->keywords = $keywordArr;
	}
	
	public function parseContent($s){
		$beforeAT = substr($s, 0, strpos($s, '@'));
		$afterAT = substr($s, strpos($s, '@') + 1);
		
		array_push($this->parsedData, $beforeAT);
		
		$holdArr = explode('.', $afterAT);
		foreach($holdArr as $word){
			array_push($this->parsedData, $word);
		}
		
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