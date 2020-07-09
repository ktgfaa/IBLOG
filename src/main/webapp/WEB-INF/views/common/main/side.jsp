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
<link href="${contextPath }/resources/css/common/side.css?after" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="left_fix_menu">
	<p id="quick">Quick Menu</p>
		<ul id="quick_menu">
			<li class="hide_BTN"><a href="${contextPath }/main.do"><button>HOME</button></a></li>
			<c:if test="${member == null}">
				<li class="hide_BTN"><a href="${contextPath }/member/loginForm.do"><button>로그인</button></a></li>
				<li class="hide_BTN"><a href="${contextPath }/member/TOSForm.do"><button>회원가입</button></a></li>
			</c:if>
			<c:if test="${member != null}">
				<li class="hide_BTN"><a href="${contextPath }/member/logout.do"><button>로그아웃</button></a></li>
				<li class="hide_BTN"><a href="${contextPath }/mypage/mypageForm.do"><button>마이페이지</button></a></li>
			</c:if>
			<li class="hide_BTN"><a href="#"><button>인기</button></a></li>
			<li class="hide_BTN"><a href="#"><button>태그</button></a></li>
			<li class="hide_BTN"><a href="#"><button>공지사항</button></a></li>
			<li class="hide_BTN"><a href="#"><button>검색</button></a></li>
			<li class="hide_BTN"><a href="#"><button>맨위로</button></a></li>
		</ul>
	</div>
</body>
<script>
</script>
</html>










