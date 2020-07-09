$(window).on('load', function() {

	$("#more").click(function() {
		$(".article_context2").css("visibility","visible");
		$(".article_context2").css("position","inherit");
		$("#more").css("visibility","hidden");
	})

	$("#hidden").click(function() {
		$(".article_context2").css("visibility","hidden");
		$(".article_context2").css("position","absolute");
		$("#more").css("visibility","visible");
	})

})