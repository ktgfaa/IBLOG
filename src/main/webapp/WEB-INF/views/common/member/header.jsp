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
<meta charset="UTF-8">
<title>헤더</title>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
<style>
.TopDIV {
	background-image: url('/iblog/resources/image/TopImage.png');
	height: 694px;
	width: 1365px;
	background-size: cover;
}

.logoDiv {
	text-align: center;
	height: 67px;
	padding-left: 283px;
	border-bottom: 1px solid;
	border-color: #ea9eef;
}

#mainLogo {
	height: 45px;
	cursor: pointer;
}

.ListUL {
	margin: 0;
	padding: 0;
	list-style: none;
	text-align: center;
	width: 816px;
	float: left;
	height: 67px;
}

.ListUL>li {
	float: left;
	padding-right: 50px;
	padding-left: 50px;
	border-right: 1px solid;
	border-color: #ea9eef;
	height: 24px;
}

.ListUL>li>a {
	font-size: 22px;
	text-decoration: none;
	color: #0084b7;
	font-family: 'Stylish', sans-serif;
}

.memberList {
	float: right;
	height: 67px;
	width: 250px;
	list-style: none;
	margin: 0;
	padding: 0;
}

.memberList>li {
	margin-top: 28px;
	margin-left: 12px;
	margin-right: 10px;
}

.memberList>li>button {
	color: #0084b7;
	font-size: 16px;
	border: none;
	border-radius: 10px 10px 10px 10px;
	width: 100px;
	height: 34px;
	cursor: pointer;
	font-family: 'Stylish', sans-serif;
}

#login {
	background-color: #efcae0;
	border: 1px solid;
	border-color: white;
}

#user {
	background-color: #ffff00a6;
	border: 1px solid;
	border-color: white;
}

#user:hover {
	background-color: #ffff0000;
}

#login:hover {
	background-color: #ffff0000;
}

.List {
	margin-top: 34px;
}
</style>
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
				<li style="float: left;"><button title="로그인" id="login">로그인</button></li>
				<li style="float: right;"><button title="회원가입" id="user">회원가입</button></li>
			</ul>
		</div>
	</div>

</body>
</html>











