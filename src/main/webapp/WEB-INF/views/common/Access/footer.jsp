<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath }/resources/css/common/footer.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>하단</title>
</head>
<body>
	<div class="footer_DIV">
		<div class="footer_Logo">
			<img src="${contextPath }/resources/image/logo/Mainlogo4.png"/><br>
			<span>IBLOG는 항상 좀 더 좋은 서비스를 위해<br></span>
			<span>노력하고 있습니다.</span>
		</div>
		<div class="footer_menu">
			<div class="menu_div">
				<ul class="footer_ul">
					<li class="menu_sub"><strong>Menu</strong></li>
					<li class="menu_list"><a href="#">공지</a></li>
					<li class="menu_list"><a href="#">태그</a></li>
					<li class="menu_list"><a href="#">인기</a></li>
					<li class="menu_list"><a href="#">검색</a></li>
				</ul>
			</div>
			<div class="guide_div">
				<ul class="footer_ul">
					<li class="menu_sub"><strong>Guide</strong></li>
					<li class="menu_list"><a href="#">고객센터</a></li>
					<li class="menu_list"><a href="#">blog guide</a></li>
				</ul>
			</div>
			<div class="policy_div">
				<ul class="footer_ul">
					<li class="menu_sub"><strong>Policy</strong></li>
					<li class="menu_list"><a href="#">이용약관</a></li>
					<li class="menu_list"><a href="#">개인정보처리방침</a></li>
					<li class="menu_list"><a href="#">청소년보호정책</a></li>
					
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
















