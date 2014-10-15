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
	
		//print_r($keywordArr);
		$this->keywords = $keywordArr;
		//$this->emailID = $emailID;
		$this->emailID = 1;
		//print_r($this->keywords);
		
		$this->parsedData = explode(' ', $s);
		
		foreach($this->parsedData as $w) {
		
			$w = str_replace(' ', '', $w);
			
		}
		
		$this->scanKeywords();
	}
	
	public function scanKeywords(){
		
		global $mysql;
		
		foreach($this->parsedData as $word){
		
			$holdID = $this->checkKeywordObject(strtolower($word));
			
			if($holdID != -1 && !in_array($word, $this->keywordsContained)){
				echo $holdID;
				array_push($this->keywordsContained, strtolower($word));
				$stmt = $mysql->prepare("INSERT INTO `KeywordCount` (Email_ID, Keyword_ID, Runtime) VALUES(:emailID, :keywordID, :runtime)");
				$stmt->execute(array(':emailID' => $this->emailID, ':keywordID' => $holdID, ':runtime' => date('Y-m-d H:i:s', time())));
			}
		}
		print_r($this->keywordsContained);
	
	}
	
	public function checkKeywordObject($word){
		
		$keywordID = -1;
		
		$word = str_replace(' ', '', $word);
		
		foreach($this->keywords as $kwObj){
			$k = preg_replace('/\s+/', '', $kwObj->Keyword);
			
			//echo $k . " and " . $word . " : " . strlen($k) . " = " . strlen($word) . " -------";
			
			if(strcmp((string)$k, (string)$word) == 0){
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
