<?php
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
if (is_logged()){
	$id1=isset($_POST['id1']) ? $_POST['id1']: '';
	$id2=isset($_POST['id2']) ? $_POST['id2']: '';
	$idc=isset($_POST['idc']) ? $_POST['idc']: '';
	$scor1=isset($_POST['scor1']) ? $_POST['scor1']: '';
	$scor2=isset($_POST['scor2']) ? $_POST['scor2']: '';
	$timestamp = date('Y-m-d');
	if(!empty($id1) and !empty($id2) and !empty($idc) and ! empty($scor1) and !empty($scor2)){
		$req=mysqli_query($mysqli,'INSERT INTO matches (id_championship,id_team1,id_team2,score,date) values('.$idc.','.$id1.','.$id2.',"'.trim($scor1).'-'.trim($scor2).'","'.$timestamp.'")');
		if($req){
			echo 'succes';
		}
		else{
			echo 'error'.mysqli_error($mysqli);
		}
	}
	
	$id=$_COOKIE["id"];
	$command = 'C:\Python27\python.exe scripts/NextGames.py '.$id;
	exec($command, $out, $status);
	$out=json_decode($out[0],true);

	  echo '<h3>Meciuri in derulare</h3>';
	
	  for($i=0;$i<sizeof($out);$i++){
		echo '<table style="margin-bottom:30px; display:block; width:650px">';
	  echo '<thead id="show_'.$i.'"><tr><th>Echipa 1</th><th>Scor</th><th>Echipa 2</th><th>'.$out[$i]['championship_name'][0].'</th></tr></thead>
	  <tbody id="extra_'.$i.'" style="display:none"> ';
		  for($j=0;$j<sizeof($out[$i]['not_played']);$j++){
			echo   '<tr><td style="width:150px"><img src="'.$out[$i]['not_played'][$j]['team1_logo'].'" style="width:20%">'.$out[$i]['not_played'][$j]['team1_name'].'</td>
			<td style="width:150px">
			<input id="scor1" type="number" class="inputtext" style="width:30%; margin-right:5px">
			<input id="scor2" type="number" class="inputtext" style="width:30%"></td> 
			<td style="width:150px">'. $out[$i]['not_played'][$j]['team2_name'].'<img src="'. $out[$i]['not_played'][$j]['team2_logo'].'"style="width:20%""></td>
			<td><div class="sendbut" style="margin-left:0" onclick="updateScor('.$out[$i]['not_played'][$j]['id_team1'][0].','.$out[$i]['not_played'][$j]['id_team2'][0] .','.$out[$i]['id_championship'].')">Adauga</div></td>
			</tr> ';
		 }
	  echo '</tbody></table>';
	  }

}
?>
<script>
$("thead[id^=show_]").click(function(event) {
    $("#extra_" + $(this).attr('id').substr(5)).slideToggle(400);
    event.preventDefault();
})
function updateScor(id1,id2,idc){
	var scor1=$('#scor1').val();
	var scor2=$('#scor2').val();
	controller('games_coming',{action:'games_coming',id1:id1,id2:id2,scor1:scor1,scor2:scor2,idc:idc},{});
}
</script>
