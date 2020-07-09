$(window).on('load', function() {
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "bo_content",
		sSkinURI : "/iblog/smarteditor2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			bUseToolbar : true,
			bUseVerticalResizer : true,
			bUseModeChanger: true
		}
	});

	$("#saveWrite").click(function() {
		console.log("save");
		try {

			oEditors.getById["bo_content"].exec("UPDATE_CONTENTS_FIELD", []);
			console.log($('#main option:selected').val());
			console.log($('#sub option:selected').val());
			if ($('#main option:selected').val() == '메인카테고리') {
				alert("메인 주제를 선택하지 않았습니다.");
				return false;
			}
			if ($('#sub option:selected').val() == '서브카테고리') {
				alert("서브 주제를 선택하지 않았습니다.");
				return false;
			}
			document.WRITEIB.submit();
			return true;
		} catch (e) {
			return false;
		}
	})

})
