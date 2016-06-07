<?php

include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
if (is_logged()){
 $id=$_COOKIE["id"];
 $command = 'C:\Python27\python.exe scripts/Championships.py '.$id;
   	exec($command, $out, $status);
	$out=json_decode($out[0],true);
//AdaugaComment
	if(isset($_POST['submitComment'])){
		$submitComment=!empty($_POST['submitComment'])? filter_var($_POST['submitComment'],FILTER_SANITIZE_NUMBER_INT) : 0;
		$comment=!empty($_POST['comment'])? filter_var($_POST['comment'],FILTER_SANITIZE_STRING) :'';
		$id_campionat=!empty($_POST['id_campionat'])? filter_var($_POST['id_campionat'],FILTER_SANITIZE_NUMBER_INT) :'';
		if($submitComment==1){
			$req134=mysqli_query($mysqli,'INSERT INTO comments (id_campionat,id_user,details) values('.$id_campionat.','.$id.',"'.$comment.'")');
			if(!$req134){
				echo 'error '.mysqli_error($mysqli);
			}
			else{
				//echo 'suces';
			}
		}
	}
//AdaugaAdmin
	if(isset($_POST['nameAdmin'])){
		$newAdmin=trim($_POST['nameAdmin']);
		$id_championship=trim($_POST['id_u']);
		$res=mysqli_query($mysqli,'SELECT id from users where user="'.$newAdmin.'"');
		if($res){ 
				while($row=mysqli_fetch_array($res)){
						$res1=mysqli_query($mysqli,'INSERT INTO championships_admin values('.$id_championship.','.$row['id'].')');
						if(!$res1){
							echo "error";
						}else{
							echo 'succes';
						}
					}
				$_POST['nameAdmin']='';
				$_COOKIE['id_championship']='';
			}
			else{
				
			 echo '<h1>Eror</h1>';
			 }
		}

        for($i=0;$i<sizeof($out);$i++)
		{  
			echo '<div style="margin:0 auto; width:48%">';
			echo'<h2>'.$out[$i]['name'][0].'</h2>';
			if($out[$i]['is_admin'])
			{
			echo'<div><input type="text" style="width:78%" class="inputtext" id="newAdmin'.$i.'" placeholder="Insert new admin"><div class="sendbut" onclick="adaugaAdmin('.$out[$i]['id_championship'].','.$i.')">Adauga</div></div>';	
			}else
			{
				
			}
			echo '<table style="margin-top:10px;margin-bottom:30px;float:left; text-align:center">';
			echo '<tr><th></th><th>Echipa</th><th></th><th>Puncte</th></tr>';
           for($j=0;$j<sizeof($out[$i]['data']);$j++)
		   {
				echo '<tr><td>'.$out[$i]['data'][$j]['pozitie'].'</td>'.'<td><img src="'.$out[$i]['data'][$j]['logo'].'" style="height:5%; align:center"></td>'.'<td>'.$out[$i]['data'][$j]['nume'].'</td>'.'<td>'.$out[$i]['data'][$j]['punctaj'].'</td></tr>';
			}
			echo '</table></div>';
			echo'<div class="comment" style="margin:0 auto; width:48%">
				<h3 id="show_'.$i.'">Comments</h3>
				<input type="text" style="width:78%" class="inputtext" id="comment'.$i.'" placeholder="Insert new comment"><div class="sendbut" onclick="adaugaComment('.$out[$i]['id_championship'].','.$i.')">Adauga</div>
				<p id="extra_'.$i.'" style="display:none">';
				$req145=mysqli_query($mysqli,'Select id_user,details from comments where id_campionat='.$out[$i]['id_championship']);
				while($row12=mysqli_fetch_array($req145)){
					echo '<strong>';
					$req541=mysqli_query($mysqli,'SELECT user from users where id='.$row12['id_user']);
					$row21=mysqli_fetch_array($req541);
					echo $row21['user'];
					echo' :</strong> '.$row12['details'].'</br>';
				}
				
			echo'</p>
				</div>';
	  }
if(isset($_POST['submitCSV']) && $_POST['submitCSV']==1){
	
	header('Content-Type: text/csv; charset=utf-8');
	header('Content-Disposition: attachment; filename=export.csv');
	// create a file pointer connected to the output stream
	$output = fopen('export.csv', 'w');

	// output the column headings
	fputcsv($output, array('Team Logo', 'Team 1 name', 'scor','Team 2 name','Team 2 logo','Data','Championship name'));

	// fetch the data
	$command3 = 'C:\Python27\python.exe scripts/LastGames.py '.$id.' 10';
   	exec($command3, $out4, $status);
	$out4=json_decode($out4[0],true);
	for($i=0;$i<sizeof($out4);$i++){
		$special=[];
		array_push($special, $out4[$i]['team1_logo'],$out4[$i]['team1_name'],$out4[$i]['score'],$out4[$i]['team2_name'],$out4[$i]['team2_logo'],$out4[$i]['date'],$out4[$i]['championship_name']);
		fputcsv($output,$special);
	}
	$_POST['submitCSV']=0;
}


// loop over the rows, outputting them
	$command2 = 'C:\Python27\python.exe scripts/LastGames.py '.$id.' 10';
   	exec($command2, $out2, $status);
	$out2=json_decode($out2[0],true);
		echo '<div style="margin:0 auto; clear:both"><h2 style="width:70%; display:inline-block">Ultimele meciuri</h2><div class="sendbut" onclick="ExportCSV()" style="float:right; margin-top:20px;">ExportCSV</div>';
		echo '<table style="margin-bottom:30px; margin:0 auto">';
	for($i=0;$i<sizeof($out2);$i++){
		
		echo '<tr><td style="max-width:50px"><img src="'.$out2[$i]['team1_logo'].'" style="width:100%"></td><td>'.$out2[$i]['team1_name'].'</td><td>'.$out2[$i]['score'].'</td><td>'.$out2[$i]['team2_name'].'</td><td style="max-width:50px"><img src="'.$out2[$i]['team2_logo'].'" style="width:100%""></td><td>'.$out2[$i]['date'].'</td><td>'.$out2[$i]['championship_name'].'</td></tr>';
	}
	
		echo '</table></div>';

}

?>
<script>
function ExportCSV(){
	var submitCSV=1;
	controller('games_now',{action:'games_now',submitCSV:submitCSV},{});
}
function adaugaComment(id_campionat,input_id){
	var submitComment=1;
	var comment=$('#comment'+input_id).val();
    controller('games_now',{action:'games_now',id_campionat:id_campionat,submitComment:submitComment,comment:comment},{});
}
function adaugaAdmin(id,i){
  var newAdmin=$('#newAdmin'+i).val();
  alert(newAdmin);
  alert(id);
  controller('games_now',{action:'games_now',nameAdmin:newAdmin,id_u:id},{});
}
$("h3[id^=show_]").click(function(event) {
    $("#extra_" + $(this).attr('id').substr(5)).slideToggle(400);
    event.preventDefault();
})
</script>
