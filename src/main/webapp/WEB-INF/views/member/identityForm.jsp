<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
	<c:if test="${total_val ne 'yes'}">
		<script>
			window.onload=function() {
				alert("약관 동의후 본인 인증을 진행해주세요!!");
				location.href="TOSForm.do";
			}
		</script>
	</c:if>
	<c:if test="${emailMessage eq 'false' }">
		<script>
			window.onload=function() {
				alert("이미 가입된 이메일 입니다");
			}
		</script>
	</c:if>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${contextPath }/resources/css/member/identityForm.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/member/identityForm.js" />"></script>
</head>
<body>
	<div class="identityForm">
		<div class="identity_DIV">
			<p id="company_name">IBLOG</p>
			<p>회원가입</p>
			<ul>
				<li><button>3</button></li>
				<li><button id="steb">2</button></li>
				<li><button>1</button></li>
			</ul>
			
				<div class="form_div">
					<div class="form_div2">
						<form name="emailCer" id="emailCer" action="${contextPath }/member/certification.do" method="post">
							<ul>	
							<li style="margin-bottom: 80px;"><h2>이메일 본인 인증</h2></li>
							<li><input type="text" name="email" id="email" placeholder="이메일을 입력해주세요"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button type="button" id="sent_email">인증번호받기</button></li>
							</ul>
						</form>
					</div>
					<div class="form_div2">
						<form name="emailCer2" id="emailCer2" action="${contextPath }/member/certification2.do" method="post">
							<ul>	
								<c:if test="${emailMessage eq 'true' }">
									<li style="margin-bottom: 10px;"><input type="text" name="confirm" id="confirm" placeholder="인증번호를 입력해주세요"/>
									<button type="button" id="confirm_btn">인증</button></li>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<li style="padding-left: 40px;float:left;color:red;"><p>남은시간</p><p id="timeC">3:00</p></li>
								</c:if>
								<c:if test="${cer_result eq 'true'}">
									<li class="cer_succese"><h3>인증 성공!!!</h3></li>
									<li><h3>다음으로 넘어가 주세요!</h3></li>
								</c:if>
							</ul>
						</form>
					</div>
				</div>
					<div class="check_next">
					<form name="IBpolisy2" id="IBpolisy2" action="${contextPath }/member/cer_conNext.do" method="post">
						<input type="hidden" name="CerResult" id="CerResult" value="no"/>
						<input type="button" id="join_next2" disabled="disabled" value="다음" />
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
					</div>
		</div>
	</div>
</body>
</html>