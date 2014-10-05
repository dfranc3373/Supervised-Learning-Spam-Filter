<?php

require_once("CalculateThreat.php");

class subject extends CalculateThreat{
	protected $Threshold;
	
	protected $SpamPercent;
		
	protected $KeywordPercent;

	protected $SimilarityPercent;

	private $parsedData = array();
	
	private $keywords = Array("money", "prince", "love", "nigeria");
	
	private $keywordsContained = Array();
	
	function __constructor($s){  // Constructor
		
	}
	
	public function parseContent($s){
		$parsedData = explode(' ', $s);
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