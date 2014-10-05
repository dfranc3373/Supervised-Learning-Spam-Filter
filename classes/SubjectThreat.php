<?php

require_once("CalculateThreat.php");

class SubjectThreat extends CalculateThreat{

	protected $parsedData;
		
	protected $keywords = Array("money", "prince", "love", "nigeria");
	
	protected $keywordsContained = Array();
	
	function __constructor(){  // Constructor
		
	}
	
	public function parseContent($s){
		$this->parsedData = explode(' ', $s);
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