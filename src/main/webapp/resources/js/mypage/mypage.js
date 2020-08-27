$(window).on('load', function() {
	$("#nowPas").keyup(function() {
	    const pwd = $(this).val();
	    const pwdc = $("#PasC").val()
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
		$("#PasC").keyup(function() {
	    const pwd = $(this).val();
	    const pwdc = $("#nowPas").val()
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
	
		$("#nowsub2").click(function(){
			
			const ck_pwd = $("#nowPas").val();
			const pwdcheck = $('#pwdCheck').css("color");
			const regexPwd =/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			const pwd_check = regexPwd.test(ck_pwd);
			console.log(pwdcheck);
		try {
			if(pwd_check == false){
				alert("비밀번호는 8~20자 영문,숫자,특수문자 조합으로 이루어져야 합니다.");
				document.IBALPAS.pwd.focus();
				document.IBALPAS.pwd.select();
				return false;
			}
			
			if(pwdcheck == 'rgb(255, 0, 0)'){
				alert("비밀번호가 일치하지 않습니다.");
				document.IBALPAS.pwd.focus();
				document.IBALPAS.pwd.select();
				return false;
			}
			 document.IBALPAS.submit();
				return true;
			} catch(e) {
				return false;
			}
		})
		
		$("#newBLOG").click(function(){
			location.href="/iblog/mypage/newIblogMakeForm.do";
		})
		
		$("#delBLOG").click(function(){
			location.href="/iblog/member/idEnableForm.do";
		})
})