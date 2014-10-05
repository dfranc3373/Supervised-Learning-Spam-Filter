<?php

require_once("CalculateThreat.php")

class addressThreat extends CalculateThreat{

	protected $Threshold;
	
	protected $SpamPercent;
		
	protected $KeywordPercent;

	protected $SimilarityPercent;

	private $keywords = Array("money", "prince", "love", "nigeria");

	private $parsedData = array();
	
	private $keywordsContained = array();
	
	function __constructor($s){  // Constructor
		
	}
	
	public function ParseContent($s){
		$beforeAT = substr($s, 0, strpos('@') - 1);
		$afterAT = substr($s, strpos('@') + 1);
		
		array_push($parsedData, $beforeAT);
		
		$holdArr = explode('.', $afterAT);
		foreach($holdArr as $word){
			array_push($parsedData, $word);
		}
	}
	
	private function ScanKeywords($parsed){
		foreach($parsed as $word){
			if(in_array($word, $keywords) && !in_array($word, $keywordsContained)){
				array_push($keywordsContained, $word);
			}
		}
	}
}

?>