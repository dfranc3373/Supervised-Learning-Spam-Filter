<?php

require_once("CalculateThreat.php");

class Body extends CalculateThreat{

    protected $linkPercent;
    protected $keywords = ["nigeria", "free", "rolex", "viagra", "prince", "love", "enlargement", "techannnounce"];
    protected $linkArr = array();
    protected $foundKw = array();
    
    public function __construct() {

        //constructor content goes here

    }
    
    public function parseContent($Content) {

        $ParsedData = explode(' ', $parseString);

    }
    
    private function scanKeywords($ParsedData) {

        $arrLen = count($ParsedData);

        foreach($keywords as $kw){

            if(in_array($ParsedData, $kw)) {

                array_push($foundKw, $kw);

            }

        }

        for($i = 0; $i < $arrLen; $i++) {

            if(strpos($ParsedData[$i], 'www.') !== FALSE) {

                array_push($linkArr, $ParsedData[$i]);

            }

        }

    }

?>
