<?php
	include "connect.php";
	$user = $_POST["user"];
	$pass = $_POST["pass"];

	$user = filter_var($user, FILTER_SANITIZE_EMAIL);
	$pass = filter_var($pass, FILTER_SANITIZE_STRING);
	$pass=md5($pass);
	$result=mysqli_query($mysqli,'SELECT * FROM Users WHERE EMAIL="'.$user.'" AND PASS="'.$pass.'" AND active=1');
	if($rez=mysqli_fetch_array($result)){
		$characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		$randstring = '';
		for ($i = 0; $i < 50; $i++) {
			$randstring .= $characters[rand(0, strlen($characters))];
		}
		setcookie("id", $rez['id'], time()+3600, "/");
		setcookie("security", $randstring, time()+3600, "/");
		mysqli_query($mysqli,"UPDATE Users SET security='".$randstring."' WHERE id=".$rez['id']);
		header('Location: ../dashboard.php');
	}else{
		header('Location: ../index.php?msg=Wrong username or password.');
	}
?>
