<?php
include $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
	$id=$_COOKIE["id"];
	$id_echipa=isset($_POST['id_edit']) ? $_POST['id_edit'] : '';
	if(isset($_POST['submit2'])){
		$id_echipa=$_POST['id_echipa'];
	}
	//echo'Id Campionat: '. $id_campionat;
	$numeTeam  =isset($_POST['numeTeam']) ? filter_var($_POST['numeTeam'],FILTER_SANITIZE_STRING) : '';
	$logoTeam  =isset($_POST['logoTeam']) ? filter_var($_POST['logoTeam'],FILTER_SANITIZE_STRING) : '';
	$mottoTeam =isset($_POST['mottoTeam']) ? filter_var($_POST['mottoTeam'],FILTER_SANITIZE_STRING) : '';
	if(empty($numeTeam) && empty($logoTeam) && empty($mottoTeam) ){
		$submit=0;
	}else{
		$submit=1;
	}
	echo $numeTeam.' '.$logoTeam.' '.$mottoTeam;
	echo $submit;
	if($submit==1){
		$res123=mysqli_query($mysqli,'UPDATE teams set name="'.$numeTeam.'",logo="'.$logoTeam.'",motto="'.$mottoTeam.'" where id_team='.$id_echipa);
		if($res123){ 
				echo'<h1>Updated</h1>';
			}
			else{
				echo '<h1>Eror</h1>';
				}
	}
	
	//$submit=isset($_POST['submit']) ? $_POST['submit'] : 0;
	$req121=mysqli_query($mysqli,'SELECT * FROM teams where id_team='.$id_echipa);
	$row=mysqli_fetch_array($req121);
	echo'<div style="position:relative;margin-top:50px;width:70%; float:left">
				<div class="col-md-3">
					<h3>Update echipa</h3>
				</div>
				<div class="col-md-3">
					<label class="labeleft">Nume:</label><input type="text"  class="inputtext inputedit" id="numeTeam" value="'.$row['name'].'">
				</div>
				<div class="col-md-3">
					<label class="labeleft">Logo:</label><input type="text"  class="inputtext inputedit" id="logoTeam" value="'.$row['logo'].'">
				</div>
				<div class="col-md-3">
					<label class="labeleft">Motto:</label><input type="text"  class="inputtext inputedit" id="mottoTeam" value="'.$row['motto'].'">
				</div>
				<div class="sendbut" style="margin-left:0" onclick="updateEchipa('.$id_echipa.')">Schimba</div>

		</div>';
		
?> 
<script>
function updateEchipa(id_echipa){
	var name=$('#numeTeam').val();
	var logo=$('#logoTeam').val();
	var motto=$('#mottoTeam').val();
	var submit=1;
	alert(name);
	alert(submit);
	controller('manage_echipa',{action:'manage_echipa',numeTeam:name,logoTeam:logo,mottoTeam:motto,id_echipa:id_echipa,submit2:submit},{});
}

</script>
