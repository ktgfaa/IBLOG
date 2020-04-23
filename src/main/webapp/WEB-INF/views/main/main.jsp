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
<link href="${contextPath }/resources/css/main/main.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>IBLOG</title>
<link href="https://fonts.googleapis.com/css2?family=Stylish&amp;display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
<body>
	<div class="mainForm">
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
				<h2>자신의 블로그를 만들어 보세요<br>
				<button>바로가기</button></h2>
				
			</div>
		</div>
	</div>
<script type="text/javascript">
</script>
</body>
</html>