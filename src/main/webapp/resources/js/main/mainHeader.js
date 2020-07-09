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
});
