$(window).on('load', function() {

	$('#Mypage').click(function() {
		$('#memberInfoDIV').css('visibility', 'visible');
	})

	$('#memberInfoDIV').mouseleave(function() {
		$('#memberInfoDIV').css('visibility', 'hidden');
	})

	$("#blogAdrress").click(function() {
		const adname = $("#blogAdrress").attr("name");
		console.log(adname);
		location.href = "/iblog/" + adname + "/blog.do";
	})
	
	$("#menuButton").click(function() {
		const menuvisi = $('.side_menu_DIV').css('visibility');
		console.log(menuvisi);
		
		if(menuvisi == 'visible') {
			$('.side_menu_DIV').css('visibility','hidden');
			$('#sidebar-left').css('z-index','-100');
			$('#xspan').css('visibility','hidden');
			$('#xspan').css('margin-left','0');
			$('#menuimage').css('visibility','visible');
			
		} else {
			$('.side_menu_DIV').css('visibility','visible');
			$('#sidebar-left').css('z-index','2');
			$('#xspan').css('visibility','visible');
			$('#xspan').css('margin-left','300px');
			$('#menuimage').css('visibility','hidden');
			
		}
	
	
	})

});
