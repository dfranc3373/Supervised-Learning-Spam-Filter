<?php

abstract class CalculateThreat {

	protected $threshold;
	
	protected $spamPercent;
	
	protected $keywordPercent;

	protected $similarityPercent;

	protected $parsedData;
	
	protected $sCount;
	
	protected $nsCount;
	
	protected $keywords;
	
	protected $emailID;
	
	protected $foundKW;
		
	public function parseContent($keywordArr, $emailID, $s, $keywordCount) {
	
		//made in new object class
		
	}
	
	public function checkThreat($keywordCount){
	
		//made in new object class
	
	}

	public function scanKeywords() {
	
		//made in new object class
		
	}

	public function checkSimilarity() {
	
		//made in new object class
		
	}
	
	public function getSpamCount() {
	
		//made in new object class
		
	}
	
	public function getHamCount() {
	
		//made in new object class
		
	}
	
	public function checkKeywordObject($word) {
	
		//made in new object class
		
	}

}

?>
