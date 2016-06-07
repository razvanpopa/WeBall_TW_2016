<?php
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/connect.php";
include_once $_SERVER['DOCUMENT_ROOT']."/samuel/includes/functions.php";
function ja02ns82ns82n9w(){
  global $mysqli;
  if($_POST['memo']){
    mysqli_query($mysqli,'INSERT INTO echipe (nume) VALUES ("'.$_POST['memo'].'")');
    $res2=mysqli_query($mysqli,'SELECT id,nume FROM echipe ORDER BY nume ASC');
    $html='';
    while($row2=mysqli_fetch_array($res2)){
      $html.='<div class="allLista">
        <div class="titluLista">'.$row2['nume'].'</div>
        <div class="ne_remove" data-mid="'.$row2['id'].'" style="position:absolute;right:0;top:0;">
          <svg xmlns="http://www.w3.org/2000/svg" fill="#969696" height="24" viewBox="0 0 24 24" width="24">
            <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
            <path d="M0 0h24v24H0z" fill="none"/>
          </svg>
        </div>
      </div>';
    }
    echo $html;
  }
  exit;
}
function jas90a9s2hs0ssk(){
  global $mysqli;
  mysqli_query($mysqli,'DELETE FROM echipe WHERE id='.$_POST['memo']);
  exit;
}
if (is_logged() && $admin){
  if(isset($_POST['token'])) $_POST['token']();
  $res2=mysqli_query($mysqli,'SELECT id,nume FROM echipe ORDER BY nume ASC');
  $html='';
  while($row2=mysqli_fetch_array($res2)){
    $html.='<div class="allLista">
      <div class="titluLista ">'.$row2['nume'].'</div>
      <div class="ne_remove" data-mid="'.$row2['id'].'" style="position:absolute;right:0;top:0;">
        <svg xmlns="http://www.w3.org/2000/svg" fill="#969696" height="24" viewBox="0 0 24 24" width="24">
          <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
          <path d="M0 0h24v24H0z" fill="none"/>
        </svg>
      </div>
    </div>';
  }
}
?>
<div class="widget_all">
  <h3>Echipe</h3>
  <div class="dashboardLista" style="min-height:20px;">
    <div id="dropMemoHere"><?php echo $html; ?></div>
    <div class="allLista">
      <input id="nv_addMemo" onkeyup="whichButton()" type="text"/>
      <div class="ne_addMemo" style="position:absolute;right:0;top:0;">
        <svg xmlns="http://www.w3.org/2000/svg" fill="#969696" height="24" viewBox="0 0 24 24" width="24">
          <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
          <path d="M0 0h24v24H0z" fill="none"/>
        </svg>
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
  readyMemo();
  $('.ne_addMemo').click(function(){
    $.post("functions/echipe.php",{token:"ja02ns82ns82n9w",memo:$('#nv_addMemo').val()}).done(function (back){$('#nv_addMemo').val('');$('#dropMemoHere').html(back);readyMemo();});
  });
});
function whichButton() {
  if (event.keyCode == 13) {
    $('.ne_addMemo').click();
  }
}
function readyMemo(){
  $('.ne_remove').click(function(){
    var removable=$(this);
    var mid=$(this).attr('data-mid');
    $.post("functions/echipe.php",{token:"jas90a9s2hs0ssk",memo:mid}).done(function (back){$(removable).parent().remove()});
  });
}
</script>
