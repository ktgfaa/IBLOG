$(window).on('load', function() {
		$("#nowsub2").click(function(){
			
			const ck_del = $("#nowPas").val();
			
		try {
			if(ck_del != '탈퇴'){
				alert("정확히 탈퇴라고 적어주셔야 탈퇴 가능합니다!!");
				document.IBALPAS.checkDel.focus();
				document.IBALPAS.checkDel.select();
				return false;
			}
			 document.IBALPAS.submit();
				return true;
			} catch(e) {
				return false;
			}
		})
})