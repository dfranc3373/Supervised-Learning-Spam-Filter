<?php

require_once("CalculateThreat.php");

class addressThreat extends CalculateThreat{

	protected $threshold;
	
	protected $spamPercent;
		
	protected $keywordPercent;

	protected $similarityPercent;

	private $keywords = Array("money", "prince", "love", "nigeria");

	private $parsedData = array();
	
	private $keywordsContained = array();
	
	function __constructor(){  // Constructor
		
	}
	
	public function parseContent($s){
		$beforeAT = substr($s, 0, strpos('@') - 1);
		$afterAT = substr($s, strpos('@') + 1);
		
		array_push($parsedData, $beforeAT);
		
		$holdArr = explode('.', $afterAT);
		foreach($holdArr as $word){
			array_push($parsedData, $word);
		}
	}
	
	private function scanKeywords($parsed){
		foreach($parsed as $word){
			if(in_array($word, $keywords) && !in_array($word, $keywordsContained)){
				array_push($keywordsContained, $word);
			}
		}
	}
}

?>