<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
require_once("../classes/AddressThreat.php");
require_once("../classes/SubjectThreat.php");




$shittyobject = new subjectThreat();

$shittyobject->parseContent("This is a string");


?>