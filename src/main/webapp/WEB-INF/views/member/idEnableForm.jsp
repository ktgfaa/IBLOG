<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<c:choose>
	<c:when test="${EnableResult == 'idfailed' }">
		<script>
			window.onload=function() {
				alert("없는 아이디 입니다.");
			}
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${EnableResult eq 'pwdfailed' }">
		<script>
			window.onload=function() {
				alert("비밀번호가 잘못되었습니다.");
			}
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${EnableResult eq 'email_Cer' }">
		<script>
			window.onload=function() {
				alert("써주신 메일로 인증번호를 확인 한 후 인증해주세요!!");
			}
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${EnableResult eq 'succese' }">
		<script>
			window.onload=function() {
				alert("인증이 완료되었습니다. 활성화 버튼을 누르면 계정이 활성화 됩니다!!");
			}
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${EnableResult eq 'enfailed' }">
		<script>
			window.onload=function() {
				alert("이미 활성화된 계정 입니다!!");
			}
		</script>
	</c:when>
</c:choose>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${contextPath }/resources/css/member/idEnableForm.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/member/idEnableForm.js" />"></script>
</head>
<body>
	<div class="idEnableForm">
			<p>IBLOG ID 활성화</p>
			<c:if test="${EnableResult != 'succese' && EnableResult != 'email_Cer'}">
				<form name="IBidEnable" action="${contextPath }/member/idEnabled_check.do" method="post">
					<input type="text" name="id" placeholder="아이디 입력"/><br>
					<input type="password" name="pwd" placeholder="비밀번호 입력"/><br>
					<input type="submit" value="인증" id="idEBtn"/><br>
					<ul>
						<li class="idpwdS" style="margin-left:260px;"><a href="${contextPath }/member/idSearchForm.do">아이디</a></li>
						<li class="idpwdS"><p style="margin: 0;">/</p></li>
						<li class="idpwdS"><a href="${contextPath }/member/pwdSearchForm.do">비밀번호 찾기</a></li>
					</ul>
				</form>
			</c:if>
			<c:if test="${EnableResult eq 'email_Cer'}">
				<form name="IBidEnable" action="${contextPath }/member/certification2.do" method="post">
					<input type="hidden" name="id" id="id" value="${id }"/>
					<ul>
						<li><input type="text" name="confirm" id="confirm" placeholder="인증번호를 입력해주세요"/>
						<button type="submit" id="confirm_btn">인증</button></li>
						<li><p style="float:left;margin-left:40px;color:red;">남은시간</p><p style="float:left;color:red;margin-left:10px;" id="timeC">3:00</p></li>
						<li style="margin-left:140px;margin-top: 55px;" class="idpwdS"><a href="${contextPath }/member/idSearchForm.do">아이디</a></li>
						<li style="margin-top: 55px;" class="idpwdS"><p style="margin: 0;">/</p></li>
						<li style="margin-top: 55px;" class="idpwdS"><a href="${contextPath }/member/pwdSearchForm.do">비밀번호 찾기</a></li>
					</ul>
				</form>
			</c:if>
			<c:if test="${EnableResult eq 'succese'}">
				<form name="IBidEnable" action="${contextPath }/member/idEnabled.do" method="post">
					<input type="text" placeholder="인증 성공!" disabled="disabled"/><br>
					<input type="hidden" name="id" value="${id }"/><br>
					<input type="submit" value="활성화" id="idEBtn"/><br>
					<ul>
						<li class="idpwdS" style="margin-left:260px;"><a href="${contextPath }/member/idSearchForm.do">아이디</a></li>
						<li class="idpwdS"><p style="margin: 0;">/</p></li>
						<li class="idpwdS"><a href="${contextPath }/member/pwdSearchForm.do">비밀번호 찾기</a></li>
					</ul>
				</form>
			</c:if>
	</div>
</body>
</html>