function controller(action,content,orders){
	var dontWait=true;
	if(typeof orders !== "undefined"){
		if(typeof orders.droppoint !== "undefined")
			var drop='#'+orders.droppoint;
		else
			var drop='#droppoint';
		if(orders.callback !== "undefined")
			var callback=orders.callback;
		else
			var callback='';
		if(orders.async !== "undefined")
			dontWait=orders.dontWait;
		else
			dontWait=true;
	}else{
		var drop='#droppoint';
		var callback='';
	}
	$.ajax({
		type: 'POST',
  		url: './'+action+'.php',
		data: content,
		success: function(data) {
			$(drop).html(data);
			if(callback){
				window[callback]();
			}
			$('#loadingpage').css('display','none');
		},
		beforeSend: function() {
			$('#loadingpage').css('display','block');
		},
		error: function (jqXHR, textStatus, errorThrown) {
        	if(jqXHR.readyState==0){
						if(tryConnection<3){
        			controller(action,content,orders);
						}else{
	        		$('#loadingpage').css('display','none');
	        		showalert('Conexiune la server pierduta.');
	        	}
        	}
        	if(jqXHR.readyState==4){
        		$('#loadingpage').css('display','none');
        		showalert('Modul in lucru. Va rugam incercati mai tarziu.');
        	}
   		},
		async:dontWait
	});
}
function showalert(content){
	$('#alertboxback').remove();
  if(content){
			$('#dropoutside').before('\
			<div id="alertboxback" class="donothide">\
				<div id="alertbox">\
					<h1>Notificare</h1>\
					<div id="alrtbx" style="cursor:default;">\
						<div id="alertboxcontent">'+content+'</div>\
						<div class="alrtbxbut" onclick="showalert(\'\')">INAPOI</div>\
					</div>\
				</div>\
			</div>\
			');
		setTimeout(function(){$('#alertbox').css('margin-top','150px');$('#alertboxback').css('opacity','1');},500);
  }
}
