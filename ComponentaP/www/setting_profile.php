<?php
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
if (is_logged()){
	$id=$_COOKIE["id"];
	if(isset($_POST['id_e'])){
		$id_e=$_POST['id_e'];
		$req=mysqli_query($mysqli,'INSERT INTO custom_preference values('.$id.','.$id_e.')');
		if(!$req){
			echo mysqli_error($mysqli);
		}
	}
	if(isset($_POST['username'])){
		$user=trim($_POST['username']);
	}
	else{
		$user='';
	}
	if(isset($_POST['genre'])){
		$genre=trim($_POST['genre']);
	}
	else{
		$genre='';
	}
	if(isset($_POST['age'])){
		$age=trim($_POST['age']);
	}
	else{
		$age='';
	}
	if(isset($_POST['motto'])){
		$motto=trim($_POST['motto']);
	}
	else{
		$motto='';
	}
	if(isset($_POST['email'])){
		$email=trim($_POST['email']);
	}
	else{
		$email='';
	}
	if(isset($_POST['username'])){
			
	$res1=mysqli_query($mysqli,'UPDATE users set user="'.$user.'",genre="'.$genre.'",age='.$age.',motto="'.$motto.'",email="'.$email.'" where id='.$id);
		if($res1){ 
				echo'<h1>Updated</h1>';
			}
			else{
				echo '<h1>Eror</h1>';
				}

	}
	$check=-1;
	if(isset($_POST['numeCampionat'])){
		$numeCampionat=$_POST['numeCampionat'];
		$check=1;
	}
	else{
		$numeCampionat='';
		$check=-1;
	}
	 $detalii=isset($_POST['detalii'])? $_POST['detalii'] : '';
	$logo=isset($_POST['logo'])? $_POST['logo'] : '';
	if($check==1){
		$timestamp = date('Y-m-d');
		$req4=mysqli_query($mysqli,'INSERT INTO CHAMPIONSHIPS (name,details,logo,date) VALUES("'.$numeCampionat.'","'.$detalii.'","'.$logo.'","'.$timestamp.'")');
		if($req4){
			$req5=mysqli_query($mysqli,'SELECT id_championship FROM CHAMPIONSHIPS where name="'.$numeCampionat.'"');
			while($row1=mysqli_fetch_array($req5)){
				$id_campionat_nou=$row1['id_championship'];
			}
			if($req5){
				$req6=mysqli_query($mysqli,'INSERT INTO championships_admin values('.$id_campionat_nou.','.$id.')');
				if($req6){
					
				}
			}
			
		}else{
			echo 'error '. mysqli_error($mysqli).' ';
			//echo $timestamp;
		}
	}
	 $req=mysqli_query($mysqli,"SELECT * FROM USERS where id=$id");
	if($req){
		while($row=mysqli_fetch_array($req)){
			echo '<div style="position:relative; margin-top:50px; width:400px; float:left">
					<div class="col-md-3"><h3>Setari profil</h3></div>
					<div class="col-md-3"><label class="labeleft">Nume:</label><input type="text"  class="inputtext inputedit" id="user" value="'. $row['user'].'"></div>
					<div class="col-md-3"><label class="labeleft">Genre:</label><input type="text"  class="inputtext inputedit" id="genre" value="'. $row['genre'].'"></div>
					<div class="col-md-3"><label class="labeleft">Varsta:</label><input type="number"  class="inputtext inputedit" id="age" value="'. $row['age'].'"></div>
					<div class="col-md-3"><label class="labeleft">Motto:</label><input type="text"  class="inputtext inputedit" id="motto" value="'. $row['motto'].'"></div>
					<div class="col-md-3"><label class="labeleft">email:</label><input type="text"  class="inputtext inputedit" id="email" value="'. $row['email'].'"></div><div class="sendbut" style="margin-left:0" onclick="schimbaSetari()">Schimba</div></div>';
		}
			
	}
	else{
		
	}
	echo'<div style="position:relative;margin-top:50px;width:45%; float:right">
				<div class="col-md-3">
				<h3>Creeaza un nou Campionat</h3>
				</div>
				<div class="col-md-3">
				<label class="labeleft">Nume:</label><input type="text"  class="inputtext inputedit" id="numeCampionat" placeholder="ex:Campioni">
				</div>
				<div class="col-md-3">
				<label class="labeleft">Detalii:</label><input type="text"  class="inputtext inputedit" id="detalii" placeholder="scurta descriere">
				</div>
				<div class="col-md-3">
				<label class="labeleft">Logo:</label><input type="text"  class="inputtext inputedit" id="logoCampionat" placeholder="un www">
				</div>
				<div class="sendbut" style="margin-left:0" onclick="adaugaCampionat()">Adauga</div>

		</div>';
		
	echo'<div style="position:relative;margin-top:50px;width:100%; float:right"><h3>Adauga o echipa din UEFA</h3>';
		echo'<input class="selectEchipa" id="datalisttestinput" list="cpref" name="browser" onchange="customPreference()">
	<datalist id="cpref">';
    $res21=mysqli_query($mysqli,'SELECT team_name, id FROM footbal_teams');
	if(!$res21){
		echo mysqli_error($res21);
	}
	else{
		echo ' suces';
	}

    while($row=mysqli_fetch_array($res21)){
      echo '<option id="'.$row['id'].'" value="'.$row['team_name'].'"></option>';
	  print_r($row);
    }
	echo '</datalist></div>';	
	
	
	//Al2lwea
	echo '<div style="position:relative;width:100%; float:right">
				<div class="col-md-3">';
				
				
	
		echo'<h3 style="padding-top:20px; margin-bottom:0">Selecteaza campionatul de editat</h3> ';
		echo'<select id="select_campionat" onchange="controller(\'manage_campionat\',{info:this.value},{droppoint:\'management_table\'})">
  <option value>Selecteaza campionat</option>';
	
    $res=mysqli_query($mysqli,'SELECT * FROM championships where id_championship in (select id_championship from championships_admin where id_user='.$id.')');
    while($row=mysqli_fetch_array($res)){
      echo '<option value="'.$row['id_championship'].'">'.$row['name'].'</option>';
    }
	echo'</select>
		<div id="management_table"></div>';
	echo '<div style="position:relative;margin-top:50px;width:100%; float:right">
				<div class="col-md-3">';
				
				
	
		echo'<h3 style="padding-top:20px; margin-bottom:0">Selecteaza echipa de editat</h3> ';
		echo'<select style="margin-top:30px" id="select_echipa" onchange="controller(\'manage_echipa\',{id_edit:this.value},{droppoint:\'management_echipa\'})">
  <option value>Selecteaza echipa</option>';
	
    $res=mysqli_query($mysqli,'SELECT * from teams where id_team in (select id_team from teams_user where id_user='.$id.')');
    while($row=mysqli_fetch_array($res)){
      echo '<option value="'.$row['id_team'].'">'.$row['name'].'</option>';
    }
	echo'</select>
		<div id="management_echipa" style="min-height:200px"></div>';

}


?>
<script>
function customPreference(){
	var x = $('#datalisttestinput').val();
	var z = $('#cpref');
	var val = $(z).find('option[value="' + x + '"]');
	var id_e=val.attr('id');
	//alert(id_e);
	controller('setting_profile',{action:'setting_profile',id_e:id_e},{});
}
function adaugaCampionat(){
	var numeCampionat=$('#numeCampionat').val();
	var detalii=$('#detalii').val();
	var logo=$('#logoCampionat').val();
	controller('setting_profile',{action:'setting_profile',numeCampionat:numeCampionat,detalii:detalii,logo:logo},{});
}
function schimbaSetari(){
	var user=$('#user').val();
	var genre=$('#genre').val();
	var age=$('#age').val();
	var motto=$('#motto').val();
	var email=$('#email').val();
	alert(email);
  controller('setting_profile',{action:'setting_profile',username:user,genre:genre,age:age,motto:motto,email:email},{});
}
</script>
