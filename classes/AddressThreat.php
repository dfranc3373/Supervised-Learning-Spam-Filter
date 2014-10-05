<?php

require_once("CalculateThreat.php");

class addressThreat extends CalculateThreat{

	protected $keywords = Array("money", "prince", "love", "nigeria");

	protected $parsedData = array();
	
	protected $keywordsContained = array();
	
	function __constructor(){  // Constructor
		
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
				array_push($this->keywordsContained, $word);
			}
		}
		
		print_r($this->keywordsContained);
	}
}

?>