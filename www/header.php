<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Supervised Learning System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

	<!--link rel="stylesheet/less" href="less/bootstrap.less" type="text/css" /-->
	<!--link rel="stylesheet/less" href="less/responsive.less" type="text/css" /-->
	<!--script src="js/less-1.3.3.min.js"></script-->
	<!--append ‘#!watch’ to the browser URL, then refresh the page. -->
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="img/favicon.png">
  
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
</head>

<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index.php">Email Client</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="index.php">Home</a>
						</li>
						<li>
							<a href="inbox.php?page=inbox">Inbox</a>
						</li>
						<li>
							 <a href="inbox.php?page=spam">Spam</a>
						</li>
					</ul>
					<!--<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input class="form-control" type="text">
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>-->
				</div>
				
			</nav>

<?php
if (strpos($_SERVER["REQUEST_URI"], "index.php") !== false) {

?>

<div class="jumbotron" style="background: url('http://i.dailymail.co.uk/i/pix/2012/10/17/article-2219188-158CE597000005DC-42_964x507.jpg') repeat fixed 0 0 rgba(0, 0, 0, 0); text-shadow: 0 0 15px rgba(0, 0, 0, 11), 0 -1px 0 rgba(0, 0, 0, 2);">
      <div class="container" style="color: #FFFFFF;">
        <h1>Email Client</h1>
        <p style="width: 80%;">Welcome to the Learning Spam Filter API Example</p>
        <p><a role="button" class="btn btn-primary btn-lg">Learn more »</a></p>
      </div>
    </div>

<?php

}?>