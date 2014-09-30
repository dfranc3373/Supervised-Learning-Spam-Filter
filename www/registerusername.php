<?php

$file="../";//for css and images and include

include($file . "include.php");

$mysql = new Sql();

$name = $mysql->sanitizeString($_GET['username']);

$user = "SELECT `username` FROM `members` WHERE `username` = '".$name."'";

$row = $mysql->sqlCount($user);

if($row >= '1') { ?>

<font color="#FF0000">Username Unavailable</font>

<?php } else { 

echo "Username Available"; 

}

?>