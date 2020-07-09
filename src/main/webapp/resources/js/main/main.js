$(window).on('load', function() {
	let num = 0;
	$('#right_BTN').click(function(){
		if(num != -2560){
			$('.popular_DIV').css("margin-left",String(num-640)+"px");
			num += -640;
			$('#left_BTN').css('visibility','visible');
		} else {
			$('#right_BTN').css('visibility','hidden');
		}
	})
	
	$('#left_BTN').click(function(){
		console.log(num);
		if(num != -3200 && num != 0){
			$('.popular_DIV').css("margin-left",String(num+640)+"px");
			num += 640;
			$('#right_BTN').css('visibility','visible');
		} else if(num == 0) {
			$('#left_BTN').css('visibility','hidden');
		}
	})
	
});
