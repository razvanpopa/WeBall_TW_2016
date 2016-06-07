<div id="menu">
	<div id="menu_ins">
		<img id="logo" src="images/logo2.png"/>
		<span id="logo_name">CAMPION</span>
		<div id="menu_items">
			<a onclick="controller('gestiune',{},{})">Gestiune</a>
			<a onclick="controller('gestiune_campionate',{},{})">Gestiune campionate</a>
			<a onclick="controller('user_view',{},{})">User View</a>
			<a id="logout" href="includes/logout.php">Log Out</a>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		controller('gestiune',{},{});
	});
</script>
