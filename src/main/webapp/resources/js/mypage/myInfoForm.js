$(window).on('load', function() {
		$("#nowsub2").click(function(){
	
		try {
			if (document.IBALPAS.name.value == "") {
				alert("이름을 입력하지 않았습니다.");
				document.IBALPAS.name.focus();
				return false;
			}
			 document.IBALPAS.submit();
				return true;
			} catch(e) {
				return false;
			}
		})
})