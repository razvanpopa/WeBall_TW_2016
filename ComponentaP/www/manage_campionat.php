<?php
include $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
	$id=$_COOKIE["id"];
	$id_campionat=isset($_POST['info']) ? $_POST['info'] : '';
	if(isset($_POST['submit'])){
		$id_campionat=$_POST['id_campionat'];
	}
	//echo'Id Campionat: '. $id_campionat;
	$name  =isset($_POST['name']) ? $_POST['name'] : '';
	$logo  =isset($_POST['logo']) ? $_POST['logo'] : '';
	$motto =isset($_POST['motto']) ? $_POST['motto'] : '';
	//$submit=isset($_POST['submit']) ? $_POST['submit'] : 0;

		if(!empty($name) && !empty($logo) && !empty($motto) ){
			$submit=1;

		}
		else{
			$submit=0;
		
		}
		//echo 'nu sunt in submit';
			if($submit == 1){
			//creez echipa
			echo 'sunt in submit';
			$req1=mysqli_query($mysqli,'INSERT into teams (name,logo,motto) values("'.$name.'","'.$logo.'","'.$motto.'")');
			if(!$req1){
				echo 're1 '. mysqli_error($mysqli);
			}
			//iau id_team dupa crearea echipei
			$req3=mysqli_query($mysqli,'SELECT id_team from teams where name="'.$name.'"');
			if(!$req3){
				echo 're3 '. mysqli_error($mysqli);
			}
			while($row=mysqli_fetch_array($req3)){
				$id_team=$row['id_team'];
			}
			//adaug userul in echipa dupa creare
			$req2=mysqli_query($mysqli,'INSERT INTO teams_user VALUES ('.$id_team.','.$id.')');
			if(!$req2){
				echo 're2 '. mysqli_error($mysqli);
			}
			//adaug in champhionship teams
			echo $id_team;
			echo'Id Campionatw: '. $id_campionat;
			$req=mysqli_query($mysqli,'INSERT INTO championship_teams VALUES ('.$id_campionat.','.$id_team.')');
			if(!$req){
				echo  're '.mysqli_error($mysqli);
			}
	}
	echo'<div style="position:relative;margin-top:50px;width:70%; float:left">
				<div class="col-md-3">
					<h3>Creeaza o echipa si introduce-o in campionat</h3>
				</div>
				<div class="col-md-3">
					<label class="labeleft">Nume:</label><input type="text"  class="inputtext inputedit" id="nameEchipa" placeholder="ex:Campioni">
				</div>
				<div class="col-md-3">
					<label class="labeleft">Logo:</label><input type="text"  class="inputtext inputedit" id="logoEchipa" placeholder="logo">
				</div>
				<div class="col-md-3">
					<label class="labeleft">Motto:</label><input type="text"  class="inputtext inputedit" id="mottoEchipa" placeholder="motto de viata">
				</div>
				<div class="sendbut" style="margin-left:0" onclick="creazaEchipa('.$id_campionat.')">Adauga</div>

		</div>';
?> 
<script>
function creazaEchipa(id_campionat){
	var name=$('#nameEchipa').val();
	var logo=$('#logoEchipa').val();
	var motto=$('#mottoEchipa').val();
	var submit=1;
	controller('manage_campionat',{action:'manage_campionat',name:name,logo:logo,motto:motto,id_campionat:id_campionat,submit:submit},{});
}

</script>
