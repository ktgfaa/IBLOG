<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${contextPath }/resources/css/member/loginForm.css?after" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="loginForm">
			<p>IBLOG LOGIN</p>
			<form name="IBlogin" action="${contextPath }/member/login.do">
				<input type="text" name="id" placeholder="ID"/><br>
				<input type="password" name="pwd" placeholder="PASSWORD"/><br>
				<input type="submit" value="로그인" id="loginBtn"/><br>
				<ul>
					<li style="margin-left: 260px;"><a href="#">아이디</a></li>
					<li><p style="margin: 0;">/</p></li>
					<li><a href="#">비밀번호 찾기</a></li>
				</ul>
			</form>
	</div>
</body>
</html>