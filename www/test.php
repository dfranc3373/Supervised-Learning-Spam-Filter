<?php

require_once("../classes/BodyThreat.php");
require_once("../classes/SubjectThreat.php");
require_once("../classes/AddressThreat.php");

$bodyobject = new BodyThreat();

$subjectobject = new SubjectThreat();

$subjectobject->parseContent("This is a string, with keywords money and love");

$addressobject2 = new AddressThreat();

$addressobject2->parseContent("prince@ttu.edu");

$bodyobject->parseContent("This is a string, with keywords free and love with a link www.google.com");

?>
