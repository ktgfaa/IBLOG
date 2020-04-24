<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath }/resources/css/main/mainHeader.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>헤더</title>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>

	<div class="TopDIV">
		<div class="logoDiv">
			<ul class="ListUL">
				<li class="List"
					style="border-left: 1px solid; border-color: #ea9eef;"><a
					href="#">공지</a></li>
				<li class="List"><a href="#">태그</a></li>
				<li style="margin-top: 21px; border: none;"><a
					href="${contextPath }/main.do"> <img title="HOME" id="mainLogo"
						src="/iblog/resources/image/logo/Mainlogo4.png" />
				</a></li>
				<li class="List"
					style="border-left: 1px solid; border-color: #ea9eef;"><a
					href="#">인기</a></li>
				<li class="List"><a href="#">검색</a></li>
			</ul>
			<ul class="memberList">
				<li style="float: left;"><button title="로그인" id="login" onclick="loginForm()">로그인</button></li>
				<li style="float: right;"><button title="회원가입" id="user" >회원가입</button></li>
			</ul>
		</div>
		
		<div class="notice_Div">
			<div class="notice_Form">
				<div class="notice_List">
					<ul>
					<li><button id="first_notice">공지사항</button></li>
					<c:forEach var="notice" begin="1" end="6">
						<li><button>공지사항</button></li>
					</c:forEach>
					<li><button id="last_notice">공지사항</button></li>
					</ul>
				</div>
			
				<div class="notice_Image">
					<img src="${contextPath }/resources/image/notice1.png"/>
					<h2>자신만의 블로그를 만들어 보세요<br>
					<button>바로가기</button></h2>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	function loginForm(){
		location.href="/iblog/member/loginForm.do";
	}
</script>
</html>











