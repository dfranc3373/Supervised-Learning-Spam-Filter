<?php

	@session_start();

error_reporting(E_ALL);
ini_set('display_errors', '1');

require_once("../classes/Email.php");
require_once("../classes/Analyzer.php");

	$analyzer = new Analyzer();
    
    	$e = new Email();

	$e->address = "techannounce@aschool.com";

	$e->subject = "Free xanax for the 100ths caller!";

	$e->body = "The fresh prince of belair!";

	$level = (isset($_SESSION['level']) && $_SESSION['level'] != "" ? $_SESSION['level'] : 1);

	$analyzer->analyze($e, $level);
    
	/*$e = new Email();

	$e->address = "funk@music.com";

	$e->subject = "test1";

	$e->body = "free";

	$analyzer->analyze($e);
    
    //------------------------------
    $e1 = new Email();

	$e1->address = "funk@music.com";

	$e1->subject = "test2";

	$e1->body = "free";

	$analyzer->analyze($e1);
    
    //------------------------------
    $e2 = new Email();

	$e2->address = "funk@music.com";

	$e2->subject = "test3";

	$e2->body = "free";

	$analyzer->analyze($e2);
    
    //------------------------------
    $e3 = new Email();

	$e3->address = "soul@music.com";

	$e3->subject = "test1";

	$e3->body = "free";

	$analyzer->analyze($e3);
    
    //------------------------------
    $e4 = new Email();

	$e4->address = "soul@music.com";

	$e4->subject = "test2";

	$e4->body = "free";

	$analyzer->analyze($e4);
    
    //------------------------------
    $e5 = new Email();

	$e5->address = "soul@music.com";

	$e5->subject = "test3";

	$e5->body = "free";

	$analyzer->analyze($e5);
    
    //------------------------------
    $e6 = new Email();

	$e6->address = "rnb@music.com";

	$e6->subject = "test1";

	$e6->body = "free";

	$analyzer->analyze($e6);
    
    //------------------------------
    $e7 = new Email();

	$e7->address = "rnb@music.com";

	$e7->subject = "test2";

	$e7->body = "free";

	$analyzer->analyze($e7);
    
    //------------------------------
    $e8 = new Email();

	$e8->address = "rnb@music.com";

	$e8->subject = "test3";

	$e8->body = "free";

	$analyzer->analyze($e8);
    
    //------------------------------
    $e9 = new Email();

	$e9->address = "rnb@music.com";

	$e9->subject = "test1";

	$e9->body = "free nigerian";

	$analyzer->analyze($e9);
    
    //------------------------------
    $e10 = new Email();

	$e10->address = "rnb@music.com";

	$e10->subject = "test2";

	$e10->body = "free nigerian";

	$analyzer->analyze($e10);
    
    //------------------------------
    $e11 = new Email();

	$e11->address = "rnb@music.com";

	$e11->subject = "test3";

	$e11->body = "free nigerian";

	$analyzer->analyze($e11);
    
    //------------------------------
    $e12 = new Email();

	$e12->address = "soul@music.com";

	$e12->subject = "test1";

	$e12->body = "free nigerian";

	$analyzer->analyze($e12);
    
    //------------------------------
    $e13 = new Email();

	$e13->address = "soul@music.com";

	$e13->subject = "test2";

	$e13->body = "free nigerian";

	$analyzer->analyze($e13);
    
    //------------------------------
    $e14 = new Email();

	$e14->address = "soul@music.com";

	$e14->subject = "test3";

	$e14->body = "free nigerian";

	$analyzer->analyze($e14);
    
    //------------------------------
    $e15 = new Email();

	$e15->address = "funk@music.com";

	$e15->subject = "test1";

	$e15->body = "free nigerian";

	$analyzer->analyze($e15);
    
    //------------------------------
    $e16 = new Email();

	$e16->address = "funk@music.com";

	$e16->subject = "test2";

	$e16->body = "free nigerian";

	$analyzer->analyze($e16);
    
    //------------------------------
    $e17 = new Email();

	$e17->address = "funk@music.com";

	$e17->subject = "test3";

	$e17->body = "free nigerian";

	$analyzer->analyze($e17);*/
?>
