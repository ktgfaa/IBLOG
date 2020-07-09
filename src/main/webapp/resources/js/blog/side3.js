$(window).on('load', function() {
	const sideDiv = $(".blogmyCategory_DIV").css("height");
	const sideDiv_height = sideDiv.substr(0,sideDiv.indexOf( "p" ));
	console.log(sideDiv_height);
	if(Number(sideDiv_height) > 500) {
		const content_MIN = Number(sideDiv_height)+400;
		$("#content").css("min-height",content_MIN+"px");
	}
	
})