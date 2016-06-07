<?php
	setcookie("id", $rez['id'], time()-3600, "/");
	setcookie("security", $randstring, time()-3600, "/");
	header('Location: ../index.php');
?>
