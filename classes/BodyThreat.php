<?php

require_once("sql.php");

require_once("CalculateThreat.php");

class BodyThreat extends CalculateThreat{

	protected $threshold;
	
	protected $spamPercent;
    
    protected $hamPercent;
	
	protected $keywordPercent;

	protected $similarityPercent;

	protected $parsedData;
    
    protected $sCount;
    
    protected $nsCount;

    protected $linkPercent;
    
    protected $keywords = Array();
    
    protected $linkArr = Array();
    
    protected $foundKw = Array();
    
    protected $emailID;
    
    function __constructor($keywordArr){  // Constructor
		$this->keywords = $keywordArr;
	}
    
    public function parseContent($keywordArr, $emailID, $s) {

		$this->keywords = $keywordArr;
		$this->emailID = 1;

        $this->parsedData = explode(' ', $s);
        
        /*foreach($this->parsedData as $w){
        	$w = str_replace(' ', '', $w);		// Eliminate spaces
        	$w = strtolower($w);
        }
        
        foreach($this->keywords as $kwObj){
        	$kwObj->Keyword = preg_replace('/\s+/', '', $kwObj->Keyword);	// Eliminate white spaces
        	$kwObj->Keyword = strtolower($kwObj->Keyword);
        	//echo "Body kw: " . $kwObj->Keyword;
        } */
        
        $this->scanKeywords();

    }
    
    public function scanKeywords() {
		
		global $mysql;
		
        $arrLen = count($this->parsedData);

        //foreach($this->keywords as $kw){		// Left old code
		foreach($this->parsedData as $word){
            //if(in_array($kw, $this->ParsedData)) {		// Left old code
            $holdID = $this->checkKeywordObject($word);
            
            if($holdID != -1 && !in_array($word, $this->foundKw)){
                array_push($this->foundKw, $word);
                
                //$stmt = $mysql->prepare("SELECT `Keyword` FROM `KeywordCount` WHERE `Keyword_ID` = :keywordID");
				//$stmt->execute(array(':keywordID' => $holdID));
				//$result = $stmt->fetchAll();
				//if($result != null){
					$stmt = $mysql->prepare("INSERT INTO `KeywordCount` (Email_ID, Keyword_ID, Runtime) VALUES(:emailID, :keywordID, :runtime)");
					$stmt->execute(array(':emailID' => $this->emailID, ':keywordID' => $holdID, ':runtime' => date('Y-m-d H:i:s', time())));
				//}
				//echo "Body ID: " . $holdID;
            }

        }

        for($i = 0; $i < $arrLen; $i++) {

            if(strpos($this->parsedData[$i], 'www.') != FALSE) {
                array_push($this->linkArr, $this->parsedData[$i]);
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
    
    public function checkSimilarity() {
	
		//made in new object class
		
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
        
        foreach($this->foundKw as $kw){
            echo "Keyword: " . $kw . nl2br("\n");
        }
        
        foreach($this->keywords as $kwObj){
            echo "Keyword: " . $kwObj->Keyword . " sCount: " . $kwObj->sCount . nl2br("\n");
            echo "Keyword: " . $kwObj->Keyword . " nsCount: " . $kwObj->nsCount . nl2br("\n");
        }
        
        foreach($this->keywords as $kwObj){
            if(in_array($kwObj->Keyword, $this->foundKw)){
                $this->spamPercent += log(($kwObj->sCount+1)/(210+$this->sCount));
                //echo $kwObj->Keyword . " has occured " . $kwObj->nsCount . nl2br(" times\n");
                $this->hamPercent += log(($kwObj->nsCount+1)/(210+$this->nsCount));
            }
        }
        
        echo "Body scount: " . $this->sCount . nl2br("\n"); 
        echo "Body nscount: " . $this->nsCount . nl2br("\n");
        echo "Body hamP: " . $this->hamPercent . nl2br("\n");
        echo "Body spamP: " . $this->spamPercent . nl2br("\n");
        
        foreach($this->keywords as $kwObj){
            if(in_array($kwObj->Keyword, $this->foundKw))
                return true;
        }
        return false;
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
}
?>