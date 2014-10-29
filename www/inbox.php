<?php

include("header.php");

require_once("../classes/sql.php");

require_once("../classes/Email.php");

$page = (isset($_GET['page']) ? $_GET['page'] : "inbox");

$count;

$emails;

if($page == "inbox") {

	$sth = $mysql->query("SELECT * FROM `Emails` WHERE `SpamFlag` = 0");

	$sth->setFetchMode(PDO::FETCH_OBJ);

	$count = $sth->rowCount();

	$emails = $sth->fetchAll();

} else {

	$sth = $mysql->query("SELECT * FROM `Emails` WHERE `SpamFlag` = 1");

	$sth->setFetchMode(PDO::FETCH_OBJ);

	$count = $sth->rowCount();

	$emails = $sth->fetchAll();

}

?>

<div class="list-group">
				 <a class="list-group-item active"><?php echo strtoupper($page); ?>
<?php if($page == "inbox") { ?>

	<button type="button" class="btn btn-warning btn-sm" style="float: right;">Spam</button>

<?php } ?>

</a>
			
<?php

if($count == 0) {

?>

<div class="list-group-item">

Sorry You Have No Mail

</div>

<?php

}

?>

<?php

foreach($emails as $email) {

	$e = new Email();

	$e->address = $email->EmailFrom;

	$e->subject = $email->Subject;

	$e->body = $email->Body;

?>

<div align="center">

<a href="email.php?id=<?php echo $email->Email_ID; ?>">

<div class="list-group-item">
					From: <?php echo $email->EmailFrom; ?> <strong><?php if(strlen($email->Subject) >= 10) {

echo substr($email->Subject, 0, 10);

} else {

echo $email->Subject;

}

?></strong>

<span class="badge" style="float: left;"><?php echo $email->Email_ID; ?></span>

<input type="checkbox" style="float: right;">

				</div>

</a>

</div>

<?php 

}

?>

<a class="list-group-item active" href="inbox.php?page=inbox"><span class="badge"></span></a>
</div>

<?php

include("footer.php");

?>
