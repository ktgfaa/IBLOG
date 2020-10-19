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
<c:choose>
	<c:when test="${memDel eq 'ok' }">
		<script>
			window.onload = function() {
				alert("탈퇴가 완료되었습니다.");
			}
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${memDel eq 'no' }">
		<script>
			window.onload = function() {
				alert("회원탈퇴 오류가 발생했습니다. 다시 시도 혹은 고객센터로 문의해주세요!!");
			}
		</script>
	</c:when>
</c:choose>
<link href="${contextPath }/resources/css/main/main.css?after"
	rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>IBLOG</title>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&amp;display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script src="<c:url value="/resources/js/main/main.js" />"></script>
</head>
<body>
	<div class="mainForm"></div>
</body>
</html>