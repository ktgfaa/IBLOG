<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link href="${contextPath }/resources/css/mypage/myInfoForm.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/mypage/myInfoForm.js" />"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="mypageForm_DIV">
	<c:if test="${inPas eq 'not'}">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">개인 정보</h2>
					<div>
						<form name="IBALPAS" action="${contextPath }/mypage/myinfoPasCheck.do" method="post">
							<input type="password" name="password" id="nowPas" placeholder="비밀번호 확인"/>
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							<input type="submit" id="nowsub" value="확인"/>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${inPas eq 'now'}">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">개인 정보</h2>
					<div>
						<form name="IBALPAS" style="height: 300px;" action="${contextPath }/mypage/myInfoUp.do" method="post">
							<ul class="infoMember_UL">
								<li>아이디  <input type="text" name="id" value="${member.getUsername() }" readonly="readonly"/></li>
								<li>이름  <input type="text" style="margin-left: 70px;" name="name" value="${member.getName() }"/></li>
								<li>이메일  <input type="text" name="email" value="${member.getEmail() }" readonly="readonly"/></li>
								<li><input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/></li>
								<li><input type="button" id="nowsub2" style="margin: 0;" value="수정"/></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${inPas eq 'x' }">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">회원 탈퇴</h2>
					<div>
						<form name="IBALPAS" action="${contextPath }/mypage/myinfoPasCheck.do" method="post">
							<input type="password" name="password" id="nowPas" placeholder="현재 비밀번호"/>
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							<input type="submit" id="nowsub" value="확인"/>
						</form>
					</div>
				</div>
			</div>
			<script>
				window.onload=function() {
					alert("비밀번호가 맞지 않습니다.");
				}
			</script>
		</c:if>
		</div>
</body>
</html>