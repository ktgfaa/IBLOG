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
<link href="${contextPath }/resources/css/blog/blogside4.css?after"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="side_DIV">
		<div class="blogName_DIV">
			<ul>
				<li><img
					src="${contextPath }/resources/image/main/main_loginLogo/member2.png" /></li>
				<li><a
					href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do"
					style="margin-bottom: 1px; font-size: 25px; text-decoration: none; color: black;">${iblogbyAddress.getTitle() }</a></li>
				<li><p>total ${iblogbyAddress.getIblog_count() }</p></li>
			</ul>
		</div>
	</div>
</body>
</html>










