<?php
	include "connect.php";
	$user = $_POST["user"];
	$email = $_POST["email"];
	$pass = $_POST["pass"];
	$email = filter_var($email, FILTER_SANITIZE_EMAIL);
	$user= filter_var($user, FILTER_SANITIZE_STRING);
	$pass = filter_var($pass, FILTER_SANITIZE_STRING);
	$pass=md5($pass);
	$result=mysqli_query($mysqli,"SELECT * FROM users WHERE email='".$email."'");
	if($rez=mysqli_fetch_array($result)){
		header('Location: ../includes/registernow.php?msg=Exista un cont cu aceasta adresa de e-mail.');
	}else{
		$characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		$randstring = '';
		for ($i = 0; $i < 50; $i++) {
			$randstring .= $characters[rand(0, strlen($characters))];
		}
		mysqli_query($mysqli,"INSERT INTO users (email,pass,user,security,active) VALUES ('".$email."','".$pass."','".$user."','".$randstring."',1)");
		$rez=mysqli_fetch_array(mysqli_query($mysqli,"SELECT id FROM users WHERE email='".$email."'"));
		if($rez){
		header('Location: ../index.php?msg=Inregistrare reusita');
		}else{
			header('Location: ../index.php?msg=Inregistrare nereusita');
			}	
	}
?>
