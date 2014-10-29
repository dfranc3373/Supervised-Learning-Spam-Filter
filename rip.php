<?php

	$mysql = new PDO("mysql:host=localhost;dbname=Learning_Database", 'root', '');

	$handle = @fopen("keywordList.txt", "r"); //read line one by one
	$values='';

	$test = array();

	while (!feof($handle)) // Loop til end of file.
	{
	    $buffer = fgets($handle, 4096); // Read a line.

	    array_push($test, $buffer);

	}

	foreach($test as $word) {

	$sth = $mysql->prepare("INSERT INTO `Keywords` (`Keyword`, `BasePercentage`, `ActualPercentage`, `LastRunTime`) VALUES (:keyword, :base, :actual, :time)");

	$sth->execute(array(':keyword' => $word, ':base' => 50, ':actual' => 50, ':time' => time()));

	}

	echo "Done";

?>
