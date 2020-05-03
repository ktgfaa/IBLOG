$(window).on('load', function() {

	// 인증 3분 카운트 하기
	const confirm_btn = $('#confirm_btn').text();
	if(confirm_btn == '인증'){

		// Set the date we're counting down to
		let countDown = 180;

		// Update the count down every 1 second
		let x = setInterval(function() {

		  let minutes = Math.floor( countDown/ 60);
		  let seconds = Math.floor(countDown % 60);

		  // Display the result in the element with id="demo"
		  document.getElementById("timeC").innerHTML = minutes + "분 " + seconds + "초 ";
		  
		  countDown--;
		  // If the count down is finished, write some text
		  if (countDown < 0) {
		    clearInterval(x);
		    document.getElementById("timeC").innerHTML = "시간초과 하였으므로 이메일을 다시 보내주세요!!";
		    alert("시간초과 하였으므로 처음부터 다시 해주세요!!");
		    location.href="/iblog/member/TOSForm.do";
		  }
		  
		},1000);
	
	} else {
		console.log('실패');
	}
	
	// 인증성공시 다음 버튼 활성화
	const next_val = $('.cer_succese').next().text();
	if(next_val != null){
		$('#join_next2').removeAttr("disabled");
		$('#join_next2').css('cursor', 'pointer');
		$('#join_next2').css('background-color', '#efcae0');
		$('#CerResult').attr('value','yes');
	}
	
	// 이메일 보내기 폼
	$('#sent_email').click(function(){
		const userEmail = $('#email').val();
		let regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		let email_check = regex.test(userEmail);

		if(userEmail == null || userEmail == ''){
			alert("메일을 다시확인후 보내주세요!!");
		} else if (email_check == false) {
			alert("잘못된 이메일 형식입니다.");
			document.emailCer.email.value = "";
			document.emailCer.email.focus();
			return false;
		} else {
			$('body').css('cursor','wait');
			$('#emailCer').submit();
		}
	});
	
	// 이메일 인증 폼
	$('#confirm_btn').click(function(){
		const confirm = $('#confirm').val();
		
		if(confirm != '' && confirm != null){
			$('body').css('cursor','wait');
			$('#emailCer2').submit();
		} else {
			alert('인증번호가 틀립니다.');
		}
	});
	
	// 다음 페이지 넘이기 폼
	$('#join_next2').click(function(){
		const CerResult = $('#CerResult').val();

		if(CerResult == 'yes'){
			$('body').css('cursor','wait');
			$('#IBpolisy2').submit();
		} else {
			alert('메일 본인 인증 후 넘어가 주세요!!');
		}
	});
});