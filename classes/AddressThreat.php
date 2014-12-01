<?php

require_once("sql.php");

require_once("CalculateThreat.php");

class addressThreat extends CalculateThreat{

	protected $threshold;
	
	protected $spamPercent;
	
    protected $hamPercent;
    
    protected $nsCount;
    
    protected $sCount;
    
	protected $keywordPercent;

	protected $similarityPercent;

	protected $keywords = Array();

	protected $parsedData = Array();
	
	protected $foundKw = Array();
	
	protected $emailID;
	
	function __constructor($keywordArr, $emailID, $sCount, $nsCount){  // Constructor
		$this->keywords = $keywordArr;
        $this->emailID = $emailID;
        $this->sCount = $sCount;
        $this->nsCount = $nsCount;
	}
	
	public function parseContent($keywordArr, $emailID, $s, $kwCount){
	
		$this->keywords = $keywordArr;
		$this->emailID = $emailID;
	
		$beforeAT = substr($s, 0, strpos($s, '@'));
		$afterAT = substr($s, strpos($s, '@') + 1);
		
		array_push($this->parsedData, $beforeAT);
		
		$holdArr = explode('.', $afterAT);

		// Old Code
        // -------------------------------------------------------------
		/*foreach($holdArr as $word){
			$word = str_replace(' ', '', $word);	// Eliminate spaces
			array_push($this->parsedData, strtolower($word));
		}
		
		foreach($this->keywords as $kwObj){
			$kwObj->Keyword = preg_replace('/\s+/', '', $kwObj->Keyword);	// Eliminate white spaces
			$kwObj->Keyword = strtolower($kwObj->Keyword);
			//echo "Address kw: " . $kwObj->Keyword;
		} */
		// -------------------------------------------------------------
				
		$this->scanKeywords();
        
        return $this->checkThreat($kwCount);
	}
	
	public function scanKeywords(){
	
		global $mysql;
	
		foreach($this->parsedData as $word){
			
			$holdID = $this->checkKeywordObject($word);
			
			if($holdID != -1 && !in_array($word, $this->foundKw)){
				array_push($this->foundKw, $word);
				
				// Old Code
				// -------------------------------------------------------------
				//$stmt = $mysql->prepare("SELECT `Keyword` FROM `KeywordCount` WHERE `Keyword_ID` = :keywordID");
				//$stmt->execute(array(':keywordID' => $holdID));
				//$result = $stmt->fetchAll();
				//if($result != null){
				//}
				//echo "Address ID: " . $holdID;
				// -------------------------------------------------------------
				$stmt = $mysql->prepare("INSERT INTO `KeywordCount` (Email_ID, Keyword_ID, Runtime) VALUES(:emailID, :keywordID, :runtime)");
				$stmt->execute(array(':emailID' => $this->emailID, ':keywordID' => $holdID, ':runtime' => date('Y-m-d H:i:s', time())));
			}
		}
		
		//print_r($this->foundKw);
	}
	
	public function checkKeywordObject($word){
		
		$keywordID = -1;
		
		// $word = str_replace(' ', '', $word);
		
		foreach($this->keywords as $kwObj){
			//$kWord = preg_replace('/\s+/', '', $kwObj->Keyword);  // Eliminate white spaces
			//echo $k . " and " . $word . " : " . strlen($k) . " = " . strlen($word) . " -------";  // Debugging code
			$word = str_replace(' ', '', $word); 		// Eliminate spaces
			$word = strtolower($word);
			$kwObj->Keyword = preg_replace('/\s+/', '', $kwObj->Keyword);	// Eliminate white spaces
			$kwObj->Keyword = strtolower($kwObj->Keyword);
			
			if(strcmp((string)$kwObj->Keyword, (string)$word) == 0){
				$keywordID = $kwObj->Keyword_ID;
				return $keywordID;
			}
		}
		return $keywordID;
	}
	
	public function checkThreat($kwCount){
        $this->hamPercent= 0;
        $this->spamPercent = 0;
        
        //calculate P(D|S) and P(D|H)
        foreach($this->keywords as $kwObj){
            if(in_array($kwObj->Keyword, $this->foundKw)){
                $this->spamPercent += log(($kwObj->sCount+1)/($kwCount+$this->sCount));
                $this->hamPercent += log(($kwObj->nsCount+1)/($kwCount+$this->nsCount));
            }
        }
        
        return ($this->hamPercent - $this->spamPercent);
    }
    
    public function getSpamCount(){
        return $this->sCount;
    }
    
    public function getHamCount(){
        return $this->nsCount;
    }
    
    public function getSpamPercent(){
        return $this->spamPercent;
    }
    
    public function getHamPercent(){
        return $this->hamPercent;
    }
	
	public function checkSimilarity() {
	
		//made in new object class
		
	}
}

?>
