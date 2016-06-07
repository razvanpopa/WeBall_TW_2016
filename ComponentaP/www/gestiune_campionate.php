<?php
include_once "includes/connect.php";
include_once "includes/functions.php";
if (is_logged() && $admin){
?>
<select id="select_campionat" onchange="controller('functions/management_campionat',{info:this.value},{droppoint:'management_table'})">
  <option value>Selecteaza campionat</option>
  <?php
    $res=mysqli_query($mysqli,'SELECT * FROM campionate WHERE activ=0 OR activ=1');
    while($row=mysqli_fetch_array($res)){
      echo '<option value="'.$row['id'].'">'.$row['nume'].'</option>';
    }
  ?>
</select>
<div id="management_table"></div>
<?php } ?>
