<?php
$admin=0;
	function is_logged(){
    global $mysqli,$admin;
		if(isset($_COOKIE["id"]) && isset($_COOKIE["security"])){
			$id = $_COOKIE["id"];
			$security = $_COOKIE["security"];
		}else{
			return 0;
		}
		$id = filter_var($id, FILTER_SANITIZE_STRING);
		$security = filter_var($security, FILTER_SANITIZE_STRING);
		$result=mysqli_query($mysqli,"SELECT * FROM Users WHERE id=".$id." AND security='".$security."'");
		if($rez=mysqli_fetch_array($result)){
      $admin=$rez['admin'];
      return 1;
    }
		return 0;
	}
function dateEn($data){
	$zi=strtok($data,'/');
	$luna=strtok('/');
	$an=strtok(' ');
	$ora=strtok(':');
	$minut=strtok(':');
	if(!$zi || !$luna || !$an || !$ora || !$minut){
		return 0;
	}
	return $an.'-'.$luna.'-'.$zi.' '.$ora.':'.$minut.':00';
}
function dateDec($data){
	$an=strtok($data,'-');
	$luna=strtok('-');
	$zi=strtok(' ');
	$ora=strtok(':');
	$minut=strtok(':');
	return $zi.'/'.$luna.'/'.$an.' '.$ora.':'.$minut;
}
?>
