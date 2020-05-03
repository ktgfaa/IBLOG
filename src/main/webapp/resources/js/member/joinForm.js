$(window).on('load', function() {
	$("#pwd").keyup(function() {
	    const pwd = $(this).val();
	    const pwdc = $("#pwdcheck").val()
	    const pwdcheck = $("#pwdCheck");
	    if(pwd == pwdc) {
	    	pwdcheck.css('visibility','visible');
	    	pwdcheck.text('비밀번호가 일치합니다');
	    	pwdcheck.css('color','blue');
	    } else {
	    	pwdcheck.css('visibility','visible');
	    	pwdcheck.text('비밀번호가 일치하지 않습니다.');
	    	pwdcheck.css('color','red');
	    }
	})
		$("#pwdcheck").keyup(function() {
	    const pwd = $(this).val();
	    const pwdc = $("#pwd").val()
	    const pwdcheck = $("#pwdCheck");
	    if(pwd == pwdc) {
	    	pwdcheck.css('visibility','visible');
	    	pwdcheck.text('비밀번호가 일치합니다');
	    	pwdcheck.css('color','blue');
	    }  else {
	    	pwdcheck.css('visibility','visible');
	    	pwdcheck.text('비밀번호가 일치하지 않습니다.');
	    	pwdcheck.css('color','red');
	    }
	})
	
	$("#id").keyup(function() {
		$('#idcheckresult').attr('value',"");
	});
	
	// 회원가입 submit
	$("#addmember").click(function(){
			
			const ck_pwd = $("#pwd").val();
			const pwdcheck = $('#pwdCheck').css("color");
			const regexPwd =/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			const pwd_check = regexPwd.test(ck_pwd);
			const idcheck = $('#idcheckresult').val();
			console.log(pwdcheck);
		try {
			if(pwd_check == false){
				alert("비밀번호는 8~20자 영문,숫자,특수문자 조합으로 이루어져야 합니다.");
				document.IBmember.pwd.focus();
				document.IBmember.pwd.select();
				return false;
			}
			
			if(pwdcheck == 'rgb(255, 0, 0)'){
				alert("비밀번호가 일치하지 않습니다.");
				document.IBmember.pwd.focus();
				document.IBmember.pwd.select();
				return false;
			}
			
			if (document.IBmember.username.value == "") {
				alert("이름을 입력하지 않았습니다.");
				document.IBmember.username.focus();
				return false;
			}
			if (document.IBmember.email.value == "") {
				alert("이메일을 입력하지 않았습니다.");
				document.IBmember.email.focus();
				return false;
			}
			if(idcheck != 'true') {
				alert("아이디 중복을 체크하지 않았습니다.");
				document.IBmember.id.focus();
				return false;
			}
			if (document.IBmember.id.value == "") {
				alert("아이디를 입력하지 않았습니다.");
				document.IBmember.id.focus();
				return false;
			}
			
			alert('회원가입이 완료되었습니다.');
		    $("#IBmember").attr("action", "/iblog/member/addMember.do");
		    $("#addmember").attr("type", "button");
		    document.IBmember.submit();
			return true;
		} catch(e) {
			return false;
		}
	});
	
});
