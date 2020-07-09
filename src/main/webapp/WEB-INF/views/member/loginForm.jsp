<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<c:choose>
	<c:when test="${result == 'loginFailed' }">
		<script>
			window.onload=function() {
				alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요!!!");
			}
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${result == 'Disabled' }">
		<script>
			window.onload=function() {
				alert("비활성화 계정입니다. 이메일 인증을 통해 다시 활성화 해주세요!!");
				location.href="${contextPath}/member/idEnableForm.do";
			}
		</script>
	</c:when>
</c:choose>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${contextPath }/resources/css/member/loginForm.css?after" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="loginForm">
			<p>IBLOG LOGIN</p>
			<form name="IBlogin" action="${contextPath }/login" method="post">
				<input type="text" name="id" placeholder="ID"/><br>
				<input type="password" name="password" placeholder="PASSWORD"/><br>
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				<input type="submit" value="로그인" id="loginBtn"/><br>
				<ul>
					<li style="margin-left:110px;"><a href="${contextPath }/member/idEnableForm.do">계정 활성화</a></li>
					<li style="margin-left:85px;"><a href="${contextPath }/member/idSearchForm.do">아이디</a></li>
					<li><p style="margin: 0;">/</p></li>
					<li><a href="${contextPath }/member/pwdSearchForm.do">비밀번호 찾기</a></li>
				</ul>
			</form>
	</div>
</body>
</html>