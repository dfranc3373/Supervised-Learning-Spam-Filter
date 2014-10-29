<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

require_once("../classes/Email.php");
require_once("../classes/Analyzer.php");

	$analyzer = new Analyzer();

	$e = new Email();

	$e->address = "prince@ttu.edu";

	$e->subject = "This is a string, with keywords ass and bitch";

	$e->body = "This is a string, with keywords porn ass and bitch with a link www.google.com";

	$analyzer->analyze($e);


?>
