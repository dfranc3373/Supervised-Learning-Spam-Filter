<?php

require_once("../classes/sql.php");

foreach($_POST['ids'] as $id) {

$sth = $mysql->prepare("UPDATE `Emails` SET `SpamFlag` = " . ($_POST['spam']) . " WHERE `Email_ID` = :Email_ID");

$sth->execute(array(":Email_ID" => $id));

}

echo "Updated!";

?>

