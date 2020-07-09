$(window).on('load', function() {
		$("#nowsub2").click(function(){
			
			const addressValue = document.NEWIB.blogAddress.value;
			const addressCHECK =/^.*(?=^.{2,10}$)(?=.*[a-zA-Z]).*$/;
			const addressCheck = addressCHECK.test(addressValue);
			
		try {
			if (document.NEWIB.blogName.value == "") {
				alert("블로그 제목을 입력하지 않았습니다.");
				document.NEWIB.blogName.focus();
				return false;
			}
			if (document.NEWIB.title.value == "") {
				alert("타이틀 제목을 입력하지 않았습니다.");
				document.NEWIB.title.focus();
				return false;
			}
			if (document.NEWIB.blogAddress.value == "") {
				alert("블로그 주소를 입력하지 않았습니다.");
				document.NEWIB.blogAddress.focus();
				return false;
			}
			if (addressCheck == false) {
				alert("블로그 주소는 2~10자 영문으로만 적어주세요!");
				document.NEWIB.blogAddress.focus();
				return false;
			}
			if ($('select option:selected').val() == 0) {
				alert("주제를 선택하지 않았습니다.");
				return false;
			}
			if ($('input:radio[name=skin]').is(':checked') == false) {
				alert("스킨을 선택하지 않았습니다.");
				return false;
			}
			 document.NEWIB.submit();
				return true;
			} catch(e) {
				return false;
			}
		})
})