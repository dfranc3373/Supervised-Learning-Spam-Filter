<?php

require_once("sql.php");

require_once("CalculateThreat.php");

class SubjectThreat extends CalculateThreat{

	protected $threshold;
	
	protected $spamPercent;
	
	protected $keywordPercent;

	protected $similarityPercent;

	protected $parsedData;
		
	protected $keywords = Array();
	
	protected $keywordsContained = Array();
	
	protected $emailID;
	

	function __constructor($keywordArr, $emailID) {  // Constructor
		
		
	}
	
	public function parseContent($keywordArr, $emailID, $s){
	
		$this->keywords = $keywordArr;
		$this->emailID = 1;		
		$this->parsedData = explode(' ', $s);
		
		foreach($this->parsedData as $w) {
			$w = str_replace(' ', '', $w); 		// Eliminate spaces
			$w = strtolower($w);
		}
		
		foreach($this->keywords as $kwObj){
			$kwObj->Keyword = preg_replace('/\s+/', '', $kwObj->Keyword);	// Eliminate white spaces
			$kwObj->Keyword = strtolower($kwObj->Keyword);
		}
		
		$this->scanKeywords();
	}
	
	public function scanKeywords(){
		
		global $mysql;
		
		foreach($this->parsedData as $word){
		
			$holdID = $this->checkKeywordObject($word);
			
			if($holdID != -1 && !in_array($word, $this->keywordsContained)){
				// echo $holdID;    // Debugging code
				array_push($this->keywordsContained, $word);
				$stmt = $mysql->prepare("INSERT INTO `KeywordCount` (Email_ID, Keyword_ID, Runtime) VALUES(:emailID, :keywordID, :runtime)");
				$stmt->execute(array(':emailID' => $this->emailID, ':keywordID' => $holdID, ':runtime' => date('Y-m-d H:i:s', time())));
			}
		}
		print_r($this->keywordsContained);
	
	}
	
	public function checkKeywordObject($word){
		
		$keywordID = -1;
		
		// $word = str_replace(' ', '', $word);
		
		foreach($this->keywords as $kwObj){
			//$kWord = preg_replace('/\s+/', '', $kwObj->Keyword);  // Eliminate white spaces
			//echo $k . " and " . $word . " : " . strlen($k) . " = " . strlen($word) . " -------";  // Debugging code
			if(strcmp((string)$kWord, (string)$word) == 0){
				$keywordID = $kwObj->Keyword_ID;
				return $keywordID;
			}
		}
		return $keywordID;
	}
	
	
	public function checkSimilarity() {
	
		//made in new object class
		
	}
}
?>
