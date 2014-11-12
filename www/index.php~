<?php

include("header.php");

require_once("../classes/sql.php");

$sth = $mysql->query("SELECT COUNT(*) FROM `Emails` WHERE `SpamFlag` = 0");

$inbox = $sth->fetchColumn();

$sth = $mysql->query("SELECT COUNT(*) FROM `Emails` WHERE `SpamFlag` = 1");

$spam = $sth->fetchColumn();

?>

<div class="list-group">
				 <a href="#" class="list-group-item active">Email Client</a>
				<a href="inbox.php?page=inbox">
<div class="list-group-item">
					Inbox<span class="badge"><?php echo $inbox; ?></span>
				</div>

</a>
				<a href="inbox.php?page=spam">

<div class="list-group-item">
					<span class="badge"><?php echo$spam; ?></span>Spam
				</div>

</a>

<a class="list-group-item active" href="inbox.php?page=inbox"><span class="badge"></span></a>
</div>

<?php

include("footer.php");

?>
