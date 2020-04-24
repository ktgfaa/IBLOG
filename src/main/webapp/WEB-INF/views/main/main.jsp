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
		<div class="tag_Form">
			<h1>#태그로</h1>
			<h2>원하는 블로그를 손쉽게 찾아보세요</h2>
			<div class="tag_List">
				<ul>
					<li><button>#맛집</button></li>
					<li><button>#여행</button></li>
					<li><button>#웹개발</button></li>
					<li><button>#Java</button></li>
					<li><button>#카페</button></li>
					<li><button>#게임</button></li>
					<li><button>#토픽</button></li>
				</ul>
				<div>
					<img src="${contextPath }/resources/image/tag1.jpg" />	
				</div>
			</div>
		</div>
		
		<div class="popular_Form">
			<h1>인기있는</h1>
			<h2>블로그를 한눈에 볼수있어요</h2>
			<div class="popular_List">
				<a href="#">
					<div class="wrap_thumb">
						<img src="${contextPath }/resources/image/popular1.jpg"/>
					</div>
					<div class="info_exam"></div>
				</a>
			</div>
		</div>
		
	</div>
<script type="text/javascript">
</script>
</body>
</html>