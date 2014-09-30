<?php

$file="../";//for css and images and include

include($file . "include.php");

$mysql = new Sql();

$email = $mysql->sanitizeString($_GET['email']);

$email1 = "SELECT `email` FROM `members` WHERE `email` = '".$email."'";

$row = $mysql->sqlCount($email1);

$ttu_check = substr($email, -8);

if($row >= '1') {
	
	echo "<font color='#FF0000'>Email Unavailable</font>";

} else if($ttu_check != "@ttu.edu"){
	
	echo "<font color='#FF0000'>You must have a @ttu.edu Email to register.</font>";

} else { 

echo "Email Available"; 

}

?>