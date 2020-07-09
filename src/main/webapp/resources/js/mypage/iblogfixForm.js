$(window).on('load', function() {
		$("#fixib").click(function(){
			
			const addressValue = document.FIXIB.blogAddress.value;
			const addressCHECK =/^.*(?=^.{2,10}$)(?=.*[a-zA-Z]).*$/;
			const addressCheck = addressCHECK.test(addressValue);
			
		try {
			if (document.FIXIB.blogName.value == "") {
				alert("블로그 제목을 입력하지 않았습니다.");
				document.FIXIB.blogName.focus();
				return false;
			}
			if (document.FIXIB.title.value == "") {
				alert("타이틀 제목을 입력하지 않았습니다.");
				document.FIXIB.title.focus();
				return false;
			}
			if (document.FIXIB.blogAddress.value == "") {
				alert("블로그 주소를 입력하지 않았습니다.");
				document.FIXIB.blogAddress.focus();
				return false;
			}
			if (addressCheck == false) {
				alert("블로그 주소는 2~10자 영문으로만 적어주세요!");
				document.FIXIB.blogAddress.focus();
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
			 document.FIXIB.submit();
				return true;
			} catch(e) {
				return false;
			}
		})
		
		$("#main_add").click(function(){
			const num = $('.main_category').length + 1;
			console.log(num);
			if(num == 17) {
				alert("최대 16개 까지 만들 수 있습니다.")
			} else {
			
			$("#categoryAdd_tbody").append("<tr class='main_category'>" +
				"<td class='cat_num_td'><input type='hidden' name='category_num' value='"+num.toString()+"' readonly='readonly'/><input type='text' name='d' value='ㆍ' disabled='disabled' /></td>" +
				"<td class='cat_main_td'><input type='text' name='category_value' placeholder='대분류는 최대 16개까지 만들수 있습니다'/></td>" +
				"<td class='cat_btn_td'><input type='button' class='sub_add' value='추가' onClick='testFunction(event)''/><input type='button' class='fix' value='수정'/><input type='button' class='del' style='margin:0;' value='삭제' onClick='delCatFunction(event)'/><input type='hidden' name='category_kind' value='main' readonly='readonly'/></td>" +
				"</tr>");
			$("#categoryAdd_tbody").append("<tr class='main_margin_tr'></tr>");
			}
					
		
		})
		
		
		$("#catego_save").click(function(){

				 document.ADDCAT.submit();

		})

})