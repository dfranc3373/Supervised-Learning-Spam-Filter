<?php

if(!isset($_GET["id"])) {

	header("Location: index.php");

}

include("header.php");

require_once("../classes/sql.php");

require_once("../classes/Email.php");

$sth = $mysql->prepare("SELECT * FROM `Emails` WHERE `Email_ID` = :Email_ID");

$sth->execute(array(":Email_ID" => $_GET["id"]));

$sth->setFetchMode(PDO::FETCH_OBJ);

$email = $sth->fetch();


?>

<div class="list-group">
				 <a class="list-group-item active">Email

	<button type="button" class="btn btn-warning btn-sm" style="float: right;">Spam Toggle</button>

</a>
			
<div align="center">

<div class="list-group-item">
					<span class="badge" style="float: left;"><?php echo $email->Email_ID; ?></span><div>From: <?php echo $email->EmailFrom; ?></div>

<div> <strong><?php

echo $email->Subject;

?></strong></div>

<div>

<?php

echo $email->Body;

?>

</div>

				</div>

</div>

<a class="list-group-item active" href="inbox.php?page=inbox"><span class="badge"></span></a>
</div>

<?php

include("footer.php");

?>
