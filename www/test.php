<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

require_once("../classes/Email.php");
require_once("../classes/Analyzer.php");

	$e = new Email();

	$analyzer = new Analyzer();

	$e->address = "prince@ttu.edu";

	$e->subject = "This is a string, with keywords money and love";

	$e->body = "This is a string, with keywords free and love with a link www.google.com";

	$analyzer->analyze($e);


?>
