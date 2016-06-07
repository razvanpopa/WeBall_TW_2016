<?php
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
function adaugaMeci(){
  global $mysqli;
  if(isset($_POST['info']) && isset($_POST['echipa1']) && isset($_POST['echipa2']) && isset($_POST['datameci'])){
    $datameci=dateEn($_POST['datameci']);
    mysqli_query($mysqli,"INSERT INTO jocuri (echipa1,echipa2,data) VALUES (".$_POST['echipa1'].",".$_POST['echipa2'].",'".$datameci."')");
    $meciId=mysqli_insert_id($mysqli);
    mysqli_query($mysqli,"INSERT INTO jocuri_campionat (campionat_id,joc_id) VALUES (".$_POST['info'].",".$meciId.")");
  }
}
function finalizareCampionat(){
  global $mysqli;
  if(isset($_POST['info'])){
    mysqli_query($mysqli,"UPDATE campionate SET activ=2 WHERE id=".$_POST['info']);
  }
}
function startCampionat(){
  global $mysqli;
  $res=mysqli_query($mysqli,"SELECT count(id) FROM jocuri_campionat WHERE campionat_id=".$_POST['info']);
  $row=mysqli_fetch_array($res);
  $nr=$row['count(id)'];
  $k=0;
  while($nr%2==0 && $nr!=1 && $nr!=0){
    $nr=$nr/2;
    if($nr==1) $k=1;
  }
  if($k){
    if(isset($_POST['info'])){
      mysqli_query($mysqli,"UPDATE campionate SET activ=1 WHERE id=".$_POST['info']);
    }
  }
}
function stergeMeci(){
  global $mysqli;
  if(isset($_POST['info']) && isset($_POST['meci'])){
    mysqli_query($mysqli,"DELETE FROM jocuri WHERE id=".$_POST['meci']);
    mysqli_query($mysqli,"DELETE FROM jocuri_campionat WHERE joc_id=".$_POST['meci']);
  }
}
function pornesteMeci(){
  global $mysqli;
  if(isset($_POST['info']) && isset($_POST['meci'])){
    mysqli_query($mysqli,"UPDATE jocuri SET finalizat=1 WHERE id=".$_POST['meci']);
  }
}
function opresteMeci(){
  global $mysqli;
  if(isset($_POST['info']) && isset($_POST['meci'])){
    mysqli_query($mysqli,"UPDATE jocuri SET finalizat=2 WHERE id=".$_POST['meci']);
    $res=mysqli_query($mysqli,"SELECT * FROM jocuri WHERE id=".$_POST['meci']);
    $row=mysqli_fetch_array($res);
    $tur=$row['tur'];
    if($row['puncte1']>$row['puncte2']){
      $winner=$row['echipa1'];
    }else{
      $winner=$row['echipa2'];
    }
    $res=mysqli_query($mysqli,"SELECT * FROM jocuri_campionat WHERE campionat_id=".$_POST['info']);
    $i=1;
    $meciuri=array();
    while($row=mysqli_fetch_array($res)){
      $meciuri[$i++]=$row['joc_id'];
    }
    if(array_search($_POST['meci'],$meciuri)%2==0){
      $adversar=$meciuri[array_search($_POST['meci'],$meciuri)-1];
    }else{
      $adversar=$meciuri[array_search($_POST['meci'],$meciuri)+1];
    }
    if($adversar){
      $res=mysqli_query($mysqli,"SELECT * FROM jocuri WHERE id=".$adversar);
      $row=mysqli_fetch_array($res);
      if($row['finalizat']==2){
        if($row['puncte1']>$row['puncte2']){
          $adversar=$row['echipa1'];
        }else{
          $adversar=$row['echipa2'];
        }
        if(array_search($_POST['meci'],$meciuri)%2){
          $echipa2=$adversar;
          $echipa1=$winner;
        }else{
          $echipa1=$adversar;
          $echipa2=$winner;
        }
        mysqli_query($mysqli,'INSERT INTO jocuri (echipa1,echipa2,tur) VALUES ('.$echipa1.','.$echipa2.','.($tur+1).')');
        $meciId=mysqli_insert_id($mysqli);
        mysqli_query($mysqli,"INSERT INTO jocuri_campionat (campionat_id,joc_id) VALUES (".$_POST['info'].",".$meciId.")");
      }
    }
  }
}
function changeScor(){
  global $mysqli;
  if(isset($_POST['info']) && isset($_POST['meci']) && isset($_POST['puncte']) && isset($_POST['team'])){
    if($_POST['team']==1){
      mysqli_query($mysqli,"UPDATE jocuri SET puncte1=".$_POST['puncte']." WHERE id=".$_POST['meci']);
    }else{
      mysqli_query($mysqli,"UPDATE jocuri SET puncte2=".$_POST['puncte']." WHERE id=".$_POST['meci']);
    }
  }
}
if (is_logged() && $admin){
  if(isset($_POST['action'])){
    $_POST['action']();
  }
  $res=mysqli_query($mysqli,'SELECT activ FROM campionate WHERE id='.$_POST['info']);
  $type=mysqli_fetch_array($res);
  $type=$type['activ'];
  if($type){
    $tur=-1;
    $res=mysqli_query($mysqli,'SELECT * FROM jocuri_campionat WHERE campionat_id='.$_POST['info']);
    echo '<input type="hidden" id="cid" value="'.$_POST['info'].'"/>';
    echo '<table style="margin-top:20px;">';
    echo '<tr><th>Echipa 1</th><th>Scor</th><th>Echipa 2</th><th>Data meciului</th><th>Action</th></tr>';
    while($row=mysqli_fetch_array($res)){
      $res2=mysqli_query($mysqli,'SELECT * FROM jocuri WHERE jocuri.id='.$row['joc_id']);
      $row2=mysqli_fetch_array($res2);
      $res3=mysqli_query($mysqli,'SELECT nume FROM echipe WHERE id='.$row2['echipa1']);
      $row3=mysqli_fetch_array($res3);
      $res4=mysqli_query($mysqli,'SELECT nume FROM echipe WHERE id='.$row2['echipa2']);
      $row4=mysqli_fetch_array($res4);
      if($row2['tur']!=$tur){
        echo '<tr><td style="color:rgb(255, 110, 64)">Turul '.($row2['tur']+1).'</td><td></td><td></td><td></td><td></td></tr>';
        $tur=$row2['tur'];
      }
      if($row2['finalizat']==0){
        echo '<tr><td>'.$row3['nume'].'</td><td><input class="inputtext" disabled style="text-align:center;width:40px;margin:10px 0;" type="text" value="'.$row2['puncte1'].'"/><span style="position:relative;float:left;line-height:50px;margin:0 10px;">-</span><input disabled class="inputtext" style="width:40px;margin:10px 0;text-align:center;" type="text" value="'.$row2['puncte2'].'"/></td><td>'.$row4['nume'].'</td><td>'.dateDec($row2['data']).'</td><td><div class="sendBut" style="margin-left:0" onclick="pornesteMeci('.$row2['id'].')">Porneste meci</div></td></tr>';
      }
      if($row2['finalizat']==1){
        echo '<tr><td>'.$row3['nume'].'</td><td><input class="inputtext" onchange="changeScor('.$row2['id'].',this.value,1)" style="text-align:center;width:40px;margin:10px 0;" type="text" value="'.$row2['puncte1'].'"/><span style="position:relative;float:left;line-height:50px;margin:0 10px;">-</span><input onchange="changeScor('.$row2['id'].',this.value,2)" class="inputtext" style="width:40px;margin:10px 0;text-align:center;" type="text" value="'.$row2['puncte2'].'"/></td><td>'.$row4['nume'].'</td><td>'.dateDec($row2['data']).'</td><td><div class="sendBut" style="margin-left:0;background-color:rgb(63, 81, 181)" onclick="opresteMeci('.$row2['id'].')">Opreste meci</div></td></tr>';
      }
      if($row2['finalizat']==2){
        echo '<tr><td>'.$row3['nume'].'</td><td><input class="inputtext" disabled style="text-align:center;width:40px;margin:10px 0;" type="text" value="'.$row2['puncte1'].'"/><span style="position:relative;float:left;line-height:50px;margin:0 10px;">-</span><input disabled class="inputtext" style="width:40px;margin:10px 0;text-align:center;" type="text" value="'.$row2['puncte2'].'"/></td><td>'.$row4['nume'].'</td><td>'.dateDec($row2['data']).'</td><td></td></tr>';
      }
    }
    echo '</table>';
    echo '<div class="sendBut sendButMid" id="startCampionat" onclick="startCampionat()">Finalizare campionat</div>';
  }else{
    $res=mysqli_query($mysqli,'SELECT * FROM jocuri_campionat WHERE campionat_id='.$_POST['info']);
    echo '<input type="hidden" id="cid" value="'.$_POST['info'].'"/>';
    echo '<table style="margin-top:20px;">';
    echo '<tr><th>Echipa 1</th><th>Echipa 2</th><th>Data meciului</th><th>Sterge meci</th></tr>';
    while($row=mysqli_fetch_array($res)){
      $res2=mysqli_query($mysqli,'SELECT * FROM jocuri WHERE jocuri.id='.$row['joc_id']);
      $row2=mysqli_fetch_array($res2);
      $res3=mysqli_query($mysqli,'SELECT nume FROM echipe WHERE id='.$row2['echipa1']);
      $row3=mysqli_fetch_array($res3);
      $res4=mysqli_query($mysqli,'SELECT nume FROM echipe WHERE id='.$row2['echipa2']);
      $row4=mysqli_fetch_array($res4);
      echo '<tr><td>'.$row3['nume'].'</td><td>'.$row4['nume'].'</td><td>'.dateDec($row2['data']).'</td><td style="color:#777;font-size:13px;cursor:pointer;" onclick="stergeMeci('.$row['joc_id'].')">STERGE</td></tr>';
    }
    echo '</table>';
    $res5=mysqli_query($mysqli,'SELECT * FROM echipe');
    echo '<div id="adaugajoc"><h3>Adauga joc</h3>';
    echo '<select id="team1" style="width:250px;">';
    $output='';
    while($row5=mysqli_fetch_array($res5)){
      $output.='<option value="'.$row5['id'].'">'.$row5['nume'].'</option>';
    }
      echo $output;
    echo '</select><span style="position:relative;float:left;margin:0 10px;line-height:30px;color:#777;"> vs </span>';
    echo '<select id="team2" style="width:250px;">';
      echo $output;
    echo '</select><span style="position:relative;float:left;margin:0 10px;line-height:30px;color:#777;"> la data </span>';
    echo '<input id="data" style="width:200px;" class="inputtext" type="text" placeholder="zz/ll/aaaa hh:mm"/>';
    echo '<div class="sendBut" onclick="adaugaMeci()">Adauga meci</div>';
    echo '</div>';
    echo '<div class="sendBut sendButMid" id="startCampionat" onclick="startCampionat()">Start campionat</div>';
  }
?>
<script>
function adaugaMeci(){
  var cid=$('#cid').val();
  var t1=$('#team1').val();
  var t2=$('#team2').val();
  var dt=$('#data').val();
  controller('functions/management_campionat',{action:'adaugaMeci',info:cid,echipa1:t1,echipa2:t2,datameci:dt},{});
}
function stergeMeci(mid){
  var cid=$('#cid').val();
  controller('functions/management_campionat',{action:'stergeMeci',info:cid,meci:mid},{});
}
function startCampionat(){
  var cid=$('#cid').val();
  controller('functions/management_campionat',{action:'startCampionat',info:cid},{});
}
function pornesteMeci(mid){
  var cid=$('#cid').val();
  controller('functions/management_campionat',{action:'pornesteMeci',info:cid,meci:mid},{});
}
function opresteMeci(mid){
  var cid=$('#cid').val();
  controller('functions/management_campionat',{action:'opresteMeci',info:cid,meci:mid},{});
}
function changeScor(mid,scor,echipa){
  var cid=$('#cid').val();
  controller('functions/management_campionat',{action:'changeScor',info:cid,meci:mid,puncte:scor,team:echipa},{});
}
</script>
<?php } ?>
