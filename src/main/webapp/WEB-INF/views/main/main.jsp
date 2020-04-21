<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IBLOG</title>
<style>
	body {
		margin:0;
		padding:0;
	}
	.noticeForm {
		width: 660px;
   	 	height: 697px;
    	float: left;
    	cursor : pointer;
	}
	
	.otherForm {
		width: 660px;
    	height: 697px;
    	display: inline-block;
	}
	
	  .memberForm{
	    width: 689px;
	    height: 230px; 	
	    cursor : pointer;
	  }
	  
	  .tagForm{
	    width: 689px;
	    height: 230px;   
	    cursor : pointer;	
	  }
	  
	  .popularForm{
	    width: 689px;
	    height: 235px;   
	    cursor : pointer;	
	  }
	
	.opacity{
    	width: 660px;
    	height: 697px;
    	opacity: 0.9;
    	position: absolute;
    	top: 0;
	}
	.opacity:hover {
		width: 660px;
    	height: 697px;
    	opacity: 0.9;
    	background-color: #00000045;
    	top: 0;
  }
  
  	.opacity2{
    	width: 689px;
    	height: 230px;
    	opacity: 0.9;
	}
	.opacity2:hover {
    	width: 689px;
    	height: 230px;
    	opacity: 0.9;
    	background-color: #00000045;
  }
  
  	.opacity3{
    	width: 689px;
    	height: 230px;
    	opacity: 0.9;
	}
	.opacity3:hover {
    	width: 689px;
    	height: 230px;
    	opacity: 0.9;
    	background-color: #00000045;
  }
  
  	.opacity4{
    	width: 689px;
    	height: 235px;
    	opacity: 0.9;
	}
	.opacity4:hover {
    	width: 689px;
    	height: 235px;
    	opacity: 0.9;
    	background-color: #00000045;
  }
  .noticeNum {
  	margin: 0;
    padding: 0;
    display: flex;
    list-style: none;
    position: absolute;
    bottom: 50px;
    left: 480px;
    
  }	
  
  .noticeNum > li {
  	margin-right : 10px;
  	float : left;
  	
  }
  
  .noticeNum > li > button {
  	border-radius: 100px 100px 100px 100px;
  	background-color: black;
    border-color: black;
  }
  
  .noticeNum > li > button:hover {
  	border-radius: 100px 100px 100px 100px;
  	background-color: gray;
  	border-color: gray;
  }
  
  .mainLogo{
  	position: fixed;
    z-index: 100;
    left: 0;
    top: 0;
  }
  
   .loginLogo{
  	position: fixed;
    z-index: 100;
	right: 20px;
    top: 20px;
  }
  
  .loginLogo > button {
  	width: 97px;
    height: 35px;
    border: none;
    background-color: #fff92d;
    border-radius: 10px 10px 10px 10px;
    
  }
  
  .loginLogo > button > strong {
  	cursor: pointer;
  }
  
   .loginLogo > button:hover {
  	background-color: #fb08d1;
  }

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
<body>
	<div class="mainForm">
		<!-- 공지사항 -->
		<a href="/iblog/main.do" class="mainLogo">
			<img title="iblog" alt="iblog" src="/iblog/resources/image/logo/MainLogo3.png" style="width: 150px;"/>
		</a>
		<div class="noticeForm" title="공지사항">

			<div class="opacity">
				<ul class="noticeNum">
					<li><button class="button1"></button></li>
					<li><button class="button2"></button></li>
					<li><button class="button3"></button></li>
					<li><button class="button4"></button></li>
					<li><button class="button5"></button></li>					
				</ul>
			</div>	
		</div>
		
		<!-- 그외 다른것 -->
		<div class="otherForm">
			<a href="${contextPath }/member/loginForm.do" class="loginLogo">
				<button title="login"><strong>로그인</strong></button>
			</a>
			<div class="memberForm" title="회원가입">
				<div class="opacity2">

				</div>	
			</div>
			<div class="tagForm" title="태그">
				<div class="opacity3">
					
				</div>
			</div>
			<div class="popularForm" title="인기블로그">
				<div class="opacity4">
					
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	$('.noticeForm').css('background','url("/iblog/resources/image/notice/notice1.jpg")');
	$('.memberForm').css('background','url("/iblog/resources/image/member.jpg")');
	$('.tagForm').css('background','url("/iblog/resources/image/tag.jpg")');
	$('.popularForm').css('background','url("/iblog/resources/image/popular.jpg")');
  $('.button1').mouseenter(function(){
    $('.noticeForm').css('background-image','url("/iblog/resources/image/notice/notice1.jpg")');
  });
  $('.button2').mouseenter(function(){
	    $('.noticeForm').css('background-image','url("/iblog/resources/image/notice/notice2.jpg")');
	  });
  $('.button3').mouseenter(function(){
	    $('.noticeForm').css('background-image','url("/iblog/resources/image/notice/notice3.jpg")');
	  });
  $('.button4').mouseenter(function(){
	    $('.noticeForm').css('background-image','url("/iblog/resources/image/notice/notice4.jpg")');
	  });
  $('.button5').mouseenter(function(){
	    $('.noticeForm').css('background-image','url("/iblog/resources/image/notice/notice5.jpg")');
	  });
});
</script>
</body>
</html>