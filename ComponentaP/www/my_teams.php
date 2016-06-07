<?php

include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
if (is_logged()){
 $id=$_COOKIE["id"];
 //$command = 'C:\Python27\python.exe scripts/Championships.py '.$id;
   //	exec($command, $out, $status);
	//$out=json_decode($out[0],true);
   	  

	$res=mysqli_query($mysqli,'SELECT id_team FROM teams_user where id_user='.$id);
		  while($row=mysqli_fetch_array($res)){
			  $i=0;
			$res1=mysqli_query($mysqli,'SELECT * FROM teams where id_team='.$row[$i]);
				  while($row1=mysqli_fetch_array($res1)){
			echo '<div style="width:290px; height:300px; margin-top:30px; margin-left:20px; float:left;border-right:1px solid #ccc; border-left:1px solid #ccc; border-radius:3px; box-shadow: 0px 0px 10px rgba(0, 0, 0, .2);">';
			echo '	<span style="background::rgb(63, 81, 181); width:290px;font-size:28px; display:block; text-align:center">'.$row1['name'].'</span>';
			echo '	<span style="max-height:100px"><center><img src="'.$row1['logo'].'" style="max-height:200px"></center></span>';
			echo '	<span style="background::rgb(63, 81, 181); width:290px;font-size:28px; display:block; text-align:center; padding-top:10px">'.$row1['motto'].'</span>';
			echo '	</div>';
				  }
			$i++;
		  }
		echo '<div style="padding-top:40px; border-top:1px #ccc solid; height:300px; display:block; clear:both">
					<h2>Echipe preferate:</h2>';
					$req=mysqli_query($mysqli,'SELECT id_team  from custom_preference where id_user='.$id);
					if(!$req){
						echo 'error';
					}
					while($row=mysqli_fetch_array($req)){
						 $command = 'C:\Python27\python.exe scripts/GetFootbalTeamInfo.py '.$row['id_team'];
						 if(!$command){
							 echo ' eror';
						 }
						exec($command, $out, $status);
						$out=json_decode($out[0],true);
						echo '<table style="margin-top:10px;margin-bottom:30px;float:left; text-align:center">';
						for($i=0;$i<sizeof($out['last_games']);$i++){
							echo '<tr><td style="width:10%"><img src="'.$out['last_games'][$i]['homeTeamLogo'].'" style="width:60%"></td><td> '.$out['last_games'][$i]['homeTeamName'].'</td><td> '
							.$out['last_games'][$i]['result']['goalsHomeTeam'].'-'.$out['last_games'][$i]['result']['goalsAwayTeam'].'</td><td> '.$out['last_games'][$i]['awayTeamName'].'</td>
							<td style="width:10%"><img src=" '.$out['last_games'][$i]['awayTeamLogo']
							.'" style="width:60%"></td><td> '.$out['last_games'][$i]['date'].'</td></tr>';
						}
						echo '</table>';
					}
		echo'</div>';
}

?>
