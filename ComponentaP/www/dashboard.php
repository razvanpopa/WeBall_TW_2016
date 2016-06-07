<?php
	include_once "includes/connect.php";
	include_once "includes/functions.php";

	$logged=is_logged();
	if($logged){
?>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" href="css/dashboard.css">
<link href='http://fonts.googleapis.com/css?family=Roboto:100,200,300,400' rel='stylesheet' type='text/css'>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/main.js"></script>
</head>
<body>
<?php if($admin) include_once "menu_admin.php"; else include_once "menu_user.php"; ?>
<div id="droppoint"></div>
<div id="dropoutside"></div>

</body>
</html>
	<?php
	}else{
    header('Location: index.php');
	}
?>
