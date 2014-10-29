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
			//echo "Subject kw: " . $kwObj->Keyword;
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
				
				//$stmt = $mysql->prepare("SELECT `Keyword` FROM `KeywordCount` WHERE `Keyword_ID` = :keywordID");
				//$stmt->execute(array(':keywordID' => $holdID));
				//$result = $stmt->fetchAll();
				//if($result != null){
					$stmt = $mysql->prepare("INSERT INTO `KeywordCount` (Email_ID, Keyword_ID, Runtime) VALUES(:emailID, :keywordID, :runtime)");
					$stmt->execute(array(':emailID' => $this->emailID, ':keywordID' => $holdID, ':runtime' => date('Y-m-d H:i:s', time())));
				//}
				//echo "Subject ID: " . $holdID;
			}
		}
		//print_r($this->keywordsContained);
	
	}
	
	public function checkKeywordObject($word){
		
		$keywordID = -1;
		
		// $word = str_replace(' ', '', $word);
		
		foreach($this->keywords as $kwObj){
			//$kWord = preg_replace('/\s+/', '', $kwObj->Keyword);  // Eliminate white spaces
			//echo $k . " and " . $word . " : " . strlen($k) . " = " . strlen($word) . " -------";  // Debugging code
			if(strcmp((string)$kwObj->Keyword, (string)$word) == 0){
				$keywordID = $kwObj->Keyword_ID;
				return $keywordID;
			}
		}
		return $keywordID;
	}
	
	public function checkThreat(){
        $this->sCount = 0;
        $this->nsCount = 0;
        $this->hamPercent= 0;
        $this->spamPercent = 0;
        
        foreach($this->keywords as $kwObj){
            $this->sCount += $kwObj->sCount;
            $this->nsCount += $kwObj->nsCount;
        }
        
        foreach($this->keywords as $kwObj){
            if(in_array($kwObj->Keyword, $this->foundKw)){
            	if($this->sCount != 0){
                	$this->spamPercent += log(($kwObj->sCount/$this->sCount));
                }
                if($this->nsCount != 0){
                	$this->hamPercent += log(($kwObj->nsCount/$this->nsCount));
                }
            }
        }
        //echo "Body scount: " . $this->sCount;
        //echo "Body nscount: " . $this->nsCount;
        //echo "Subject hamP: " . $this->hamPercent;
        //echo "Subject spamP: " . $this->spamPercent;
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
