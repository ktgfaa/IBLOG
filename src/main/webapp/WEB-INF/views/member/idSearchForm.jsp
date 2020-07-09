<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${contextPath }/resources/css/member/idSearchForm.css?after" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="idSearchForm">
			<p>IBLOG 아이디 찾기</p>
			<form name="IBidSearch" action="${contextPath }/member/sendMail.do" method="post">
				<input type="text" name="email" placeholder="회원가입때 입력 한 이메일 입력"/><br>
				<input type="submit" value="아이디 찾기" id="idSBtn"/><br>
				<ul>
					<li style="margin-left: 110px;"><a href="${contextPath }/member/idEnableForm.do">계정 활성화</a></li>
					<li style="margin-left: 120px;"><a href="${contextPath }/member/loginForm.do">로그인</a></li>
					<li><p style="margin: 0;">/</p></li>
					<li><a href="${contextPath }/member/TOSForm.do">회원가입</a></li>
				</ul>
			</form>
	</div>
</body>
</html>