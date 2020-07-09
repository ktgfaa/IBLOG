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
<link href="${contextPath }/resources/css/mypage/memberDelForm.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/mypage/memberDelForm.js" />"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="mypageForm_DIV">
	<c:if test="${delpas eq 'not'}">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">회원 탈퇴</h2>
					<div>
						<form name="IBALPAS" action="${contextPath }/mypage/memberDelCheck.do" method="post">
							<input type="password" name="password" id="nowPas" placeholder="비밀번호 확인"/>
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							<input type="submit" id="nowsub" value="확인"/>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${delpas eq 'now'}">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">회원 탈퇴</h2>
					<div>
						<form name="IBALPAS" style="height: 300px;" action="${contextPath }/mypage/deleteMem.do" method="post">
							<ul>
								<li><span>밑에 회원 탈퇴라고 적어주신후 탈퇴 버튼을 누르시면 탈퇴가 완료됩니다!!</span></li>
								<li><input type="text" style="margin-top: 30px;" name="checkDel" id="nowPas"/></li>
								<li><input type="hidden" name="id" value="${member.getUsername() }" readonly="readonly" />
								<li><input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/></li>
								<li><input type="button" id="nowsub2" style="margin: 0;" value="탈퇴"/></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${delpas eq 'x' }">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">회원 탈퇴</h2>
					<div>
						<form name="IBALPAS" action="${contextPath }/mypage/memberDelCheck.do" method="post">
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