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
<link href="${contextPath }/resources/css/main/main.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>IBLOG</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
<body>
	<div class="mainForm">

		
		<!-- 그외 다른것 -->
		<div class="otherForm">
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