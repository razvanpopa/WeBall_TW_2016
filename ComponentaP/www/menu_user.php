<div id="menu">
	<div id="menu_ins">
		<img id="logo" src="images/logo2.png"/>
		<span id="logo_name">Vrei sa fi Campion?</span>
		<div id="menu_items">
      <a onclick="controller('games_now',{},{})">Campionate</a>
      <a onclick="controller('my_teams',{},{})">Echipe</a>
      <!--<a onclick="controller('games_audit',{},{})">Istoric meciuri</a>-->
      <a onclick="controller('games_coming',{},{})">Meciuri viitoare</a>
      <a onclick="controller('setting_profile',{},{})">Setari</a>
      <a id="logout" href="includes/logout.php">Log Out</a>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		controller('games_now',{},{});
	});
</script>
