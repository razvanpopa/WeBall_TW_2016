<?php
	include "includes/connect.php";
	include "includes/functions.php";
?>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href='http://fonts.googleapis.com/css?family=Roboto:200,300,400' rel='stylesheet' type='text/css'>
</head>
<body>
<?php
	$logged=is_logged();
	if($logged==0){?>
		<div id="loginc">
			<h1>LOG IN</h1>
			<?php if(isset($_GET['msg'])) echo '<h2>'.$_GET['msg'].'</h2>'?>
			<form action="includes/login.php" method="post">
				<input type="text" name="user" placeholder="E-mail"/>
				<input type="password" name="pass" placeholder="Password"/>
				<input type="submit" style="background-color:#0B5656;color:#fff;cursor:pointer;" value="Log in"/>
				<p>or</p>
				<a href = 'includes/registernow.php'>REGISTER</a>
			</form>
		</div>
	<?php
	}else{
		?>
		<script>window.location.replace("dashboard.php");</script>
	<?php
	}
?>
</body>
</html>
