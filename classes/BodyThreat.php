<?php

require_once("sql.php");

require_once("CalculateThreat.php");

class BodyThreat extends CalculateThreat{

	protected $threshold;
	
	protected $spamPercent;
	
	protected $keywordPercent;

	protected $similarityPercent;

	protected $parsedData;

    protected $linkPercent;
    protected $keywords = Array();
    protected $linkArr = Array();
    protected $foundKw = Array();
    
    function __constructor($keywordArr){  // Constructor
		$this->keywords = $keywordArr;
	}
    
    public function parseContent($Content) {

        $this->ParsedData = explode(' ', $Content);
        
        $this->scanKeywords();

    }
    
    public function scanKeywords() {
		
		global $mysql;
		
        $arrLen = count($this->ParsedData);

        foreach($this->keywords as $this->kw){

            if(in_array($this->kw, $this->ParsedData)) {

                array_push($this->foundKw, strtolower($this->kw));

            }

        }

        for($i = 0; $i < $arrLen; $i++) {

            if(strpos($this->ParsedData[$i], 'www.') !== FALSE) {

                array_push($this->linkArr, $this->ParsedData[$i]);

            }

        }
        
        print_r($this->ParsedData);
        
        print_r($this->linkArr);
        
        print_r($this->foundKw);

    }
    
    public function checkSimilarity() {
	
		//made in new object class
		
	}
    
}
?>