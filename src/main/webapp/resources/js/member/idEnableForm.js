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
		    //location.href="/iblog/member/idEnableForm.do";
		  }
		  
		},1000);
	
	} else {
		console.log('실패');
	}
	
	
});