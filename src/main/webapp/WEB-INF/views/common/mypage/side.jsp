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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<link href="${contextPath }/resources/css/mypage/side.css?after" rel="stylesheet" type="text/css">
</head>
<body>
		<div class="mypage_ListDIV">
			<div class="member_DIV">
				<ul>
					<li><img src="${contextPath }/resources/image/main/main_loginLogo/member2.png"/></li>
					<li><p>${member.getName() }</p></li>
					<li><a href="${contextPath }/mypage/mypageForm.do">${member.getUsername() }</a></li>
				</ul>
			</div>
			<div class="member_DIV2">
				<ul>
					<li><a href="${contextPath }/mypage/mypageForm.do" style="color: #ff7878;font-size:25px;">마이페이지 홈</a></li>
				</ul>
				<ul>
					<li><h2>계정</h2></li>
					<li><a href="${contextPath }/mypage/myInfoForm.do">개인 정보</a></li>
					<li><a href="${contextPath }/mypage/iblogfixForm.do">아이 블로그 관리</a></li>
					<c:if test="${member.getRunblog() eq 'run' }">
						<li><a href="${contextPath }/mypage/addWriteForm.do">글쓰기</a></li>
					</c:if>
				</ul>
				<ul style="border-bottom:none;">
					<li><h2>보안</h2></li>
					<li><a href="${contextPath }/mypage/mypageForm.do?PasSet=yet">비밀번호 수정</a></li>
					<li><a href="${contextPath }/mypage/memberDelForm.do">회원 탈퇴</a></li>
				</ul>
			</div>
		</div>
</body>
<script>
</script>
</html>










