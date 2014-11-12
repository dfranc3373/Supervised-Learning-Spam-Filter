<?php

include("header.php");

require_once("../classes/sql.php");

$sth = $mysql->query("SELECT COUNT(*) FROM `Emails` WHERE `SpamFlag` = 0");

$inbox = $sth->fetchColumn();

$sth = $mysql->query("SELECT COUNT(*) FROM `Emails` WHERE `SpamFlag` = 1");

$spam = $sth->fetchColumn();

?>

<div class="jumbotron" style="background: url('http://i.dailymail.co.uk/i/pix/2012/10/17/article-2219188-158CE597000005DC-42_964x507.jpg') repeat fixed 0 0 rgba(0, 0, 0, 0); text-shadow: 0 0 15px rgba(0, 0, 0, 11), 0 -1px 0 rgba(0, 0, 0, 2);">
      <div class="container" style="color: #FFFFFF;">
        <h1>Email Client</h1>
        <p style="width: 80%;">Welcome to the Learning Spam Filter API Example</p>
        <p><a role="button" class="btn btn-primary btn-lg">Learn more »</a></p>
      </div>
    </div>

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
