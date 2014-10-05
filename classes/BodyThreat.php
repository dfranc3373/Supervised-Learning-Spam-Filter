<?php

require_once("CalculateThreat.php");

class BodyThreat extends CalculateThreat{

    protected $linkPercent;
    protected $keywords = ["nigeria", "free", "rolex", "viagra", "prince", "love", "enlargement", "techannnounce"];
    protected $linkArr = array();
    protected $foundKw = array();
    
    public function __construct() {

        //constructor content goes here

    }
    
    public function parseContent($Content) {

        $this->ParsedData = explode(' ', $Content);
        
        $this->scanKeywords();

    }
    
    public function scanKeywords() {

        $arrLen = count($this->ParsedData);

        foreach($this->keywords as $this->kw){

            if(in_array($this->kw, $this->ParsedData)) {

                array_push($this->foundKw, $this->kw);

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
    
}
?>