<?php

@session_start();

require_once("../classes/sql.php");

$_SESSION['level'] = $_POST['level'];

echo "Level set to " . $_POST['level'];

?>

