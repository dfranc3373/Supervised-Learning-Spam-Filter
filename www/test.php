<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
require_once("../classes/AddressThreat.php");
require_once("../classes/SubjectThreat.php");




$shittyobject = new SubjectThreat();

$shittyobject->parseContent("This is a string, with keywords money and love");

$shittyobject2 = new AddressThreat();

$shittyobject2->parseContent("prince@ttu.edu");

?>