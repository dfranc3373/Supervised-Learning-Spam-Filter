<?php

include("header.php");

require_once("../classes/sql.php");

require_once("../classes/Email.php");

$page = (isset($_GET['page']) ? $_GET['page'] : "inbox");

$count;

$emails;

if($page == "inbox") {

	$sth = $mysql->query("SELECT * FROM `Emails` WHERE `SpamFlag` = 0 ORDER BY `Email_ID` DESC");

	$sth->setFetchMode(PDO::FETCH_OBJ);

	$count = $sth->rowCount();

	$emails = $sth->fetchAll();

} else {

	$sth = $mysql->query("SELECT * FROM `Emails` WHERE `SpamFlag` = 1 ORDER BY `Email_ID` DESC");

	$sth->setFetchMode(PDO::FETCH_OBJ);

	$count = $sth->rowCount();

	$emails = $sth->fetchAll();

}

?>

<div class="list-group">
				 <a class="list-group-item active"><?php echo strtoupper($page); ?>
<?php if($page == "inbox") { ?>

<script type="text/javascript">

function markAsSpam() {

var id = [];

var i = 0;

$('input:checkbox').each(function () {
       var sThisVal = (this.checked ? $(this).val() : "");

	if(sThisVal == "on") {

		id[i] = $(this).attr("id");

		i++;

	}

  });

if(id.length != 0) {

	var data = {
		
		ids: id,
		spam: 1

		};

	$.ajax({
		type: "POST",
		url: "toggleSpam.php",
		data: data,
		success: (function(info) {

		alert(info);

		location.reload();

		})
	});

}

}

</script>

	<button type="button" class="btn btn-warning btn-sm" style="float: right;" onclick="markAsSpam();">Spam</button>

<?php } ?>

<?php if($page == "spam") { ?>

	<script type="text/javascript">

function markAsNotSpam() {

var id = [];

var i = 0;

$('input:checkbox').each(function () {
       var sThisVal = (this.checked ? $(this).val() : "");

	if(sThisVal == "on") {

		id[i] = $(this).attr("id");

		i++;

	}

  });

if(id.length != 0) {

	var data = {
		
		ids: id,
		spam: 0

		};

	$.ajax({
		type: "POST",
		url: "toggleSpam.php",
		data: data,
		success: (function(info) {

		alert(info);

		location.reload();

		})
	});

}

}

</script>

	<button type="button" class="btn btn-warning btn-sm" style="float: right;" onclick="markAsNotSpam();">Not Spam</button>

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

<div class="list-group-item">
					<a href="email.php?id=<?php echo $email->Email_ID; ?>">
From: <?php echo $email->EmailFrom; ?> <strong><?php if(strlen($email->Subject) >= 10) {

echo substr($email->Subject, 0, 10);

} else {

echo $email->Subject;

}

?></strong></a>

<span class="badge" style="float: left;"><?php echo $email->Email_ID; ?></span>

<input type="checkbox" style="float: right;" class="checkbox" id="<?php echo $email->Email_ID; ?>">

				</div>

</div>

<?php 

}

?>

<a class="list-group-item active" href="inbox.php?page=inbox"><span class="badge"></span></a>
</div>

<?php

include("footer.php");

?>
