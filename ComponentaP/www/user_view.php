<?php
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
if (is_logged() && $admin){
  $res=mysqli_query($mysqli,'SELECT * FROM jocuri WHERE finalizat=2 ORDER BY data DESC LIMIT 10');
  echo '<h3>Ultimele 10 meciuri</h3>';
  echo '<table style="margin-bottom:30px;">';
  echo '<tr><th>Echipa 1</th><th>Scor</th><th>Echipa 2</th><th>Data meciului</th><th>Campionat</th></tr>';
  while($row=mysqli_fetch_array($res)){
    $res2=mysqli_query($mysqli,'SELECT nume FROM campionate,jocuri_campionat WHERE jocuri_campionat.campionat_id=campionate.id AND joc_id='.$row['id']);
    $row2=mysqli_fetch_array($res2);
    $res3=mysqli_query($mysqli,'SELECT nume FROM echipe WHERE id='.$row['echipa1']);
    $row3=mysqli_fetch_array($res3);
    $res4=mysqli_query($mysqli,'SELECT nume FROM echipe WHERE id='.$row['echipa2']);
    $row4=mysqli_fetch_array($res4);
    echo '<tr><td>'.$row3['nume'].'</td><td><input class="inputtext" disabled style="text-align:center;width:40px;margin:10px 0;" type="text" value="'.$row['puncte1'].'"/><span style="position:relative;float:left;line-height:50px;margin:0 10px;">-</span><input disabled class="inputtext" style="width:40px;margin:10px 0;text-align:center;" type="text" value="'.$row['puncte2'].'"/></td><td>'.$row4['nume'].'</td><td>'.dateDec($row['data']).'</td><td>'.$row2['nume'].'</td></tr>';
  }
  echo '</table>';
  $res=mysqli_query($mysqli,'SELECT * FROM jocuri WHERE finalizat=0 ORDER BY data LIMIT 10');
  echo '<h3>Urmatoarele 10 meciuri</h3>';
  echo '<table style="">';
  echo '<tr><th>Echipa 1</th><th>Echipa 2</th><th>Data meciului</th><th>Campionat</th></tr>';
  while($row=mysqli_fetch_array($res)){
    $res2=mysqli_query($mysqli,'SELECT nume FROM campionate,jocuri_campionat WHERE jocuri_campionat.campionat_id=campionate.id AND joc_id='.$row['id']);
    $row2=mysqli_fetch_array($res2);
    $res3=mysqli_query($mysqli,'SELECT nume FROM echipe WHERE id='.$row['echipa1']);
    $row3=mysqli_fetch_array($res3);
    $res4=mysqli_query($mysqli,'SELECT nume FROM echipe WHERE id='.$row['echipa2']);
    $row4=mysqli_fetch_array($res4);
    echo '<tr><td>'.$row3['nume'].'</td><td>'.$row4['nume'].'</td><td>'.dateDec($row['data']).'</td><td>'.$row2['nume'].'</td></tr>';
  }
  echo '</table>';
}
?>
