<?php
	$mysqli=mysqli_connect('localhost','root','','weball');
	if(!$mysqli)
	{
		die('Nu s-a putut conecta: '.mysqli_connect_error());
	}
	mysqli_query($mysqli,"SET NAMES utf8");
	define('ABSPATH', dirname(__FILE__));
?>
