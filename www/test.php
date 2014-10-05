<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
require_once("../classes/BodyThreat.php");
//require_once("../classes/SubjectThreat.php");




$shittyobject = new BodyThreat();

$shittyobject->parseContent("This is a string, with keywords free and love with a link www.google.com");
?>