$(window).on('load', function() {
	const mainDiv = $(".blogDis_DIV").css("height");
	const mainDiv_height = mainDiv.substr(0,mainDiv.indexOf( "p" ));
	
	if(Number(mainDiv_height) > 1100) {
		const side_MIN = Number(mainDiv_height) + 100;
		$(".side_DIV").css("min-height",side_MIN+"px");
	}
	
})