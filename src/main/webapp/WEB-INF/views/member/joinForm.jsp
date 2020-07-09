<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
	<c:if test="${cerResult ne 'yes'}">
		<script>
			window.onload=function() {
				alert("약관 동의,이메일 본인 인증 후 가입해 주세요!!");
				location.href="TOSForm.do";
			}
		</script>
	</c:if>
<c:if test="${idcheckresult != null }">
	<c:if test="${idcheckresult eq 'false' }">
		<script>
			window.onload=function() {
				alert('중복된 아이디 입니다.');
			}
		</script>
	</c:if>
	<c:if test="${idcheckresult eq 'true' }">
		<script>
			window.onload=function() {
				alert('사용 가능한 아이디 입니다.');
			}
		</script>
	</c:if>
	<c:if test="${idcheckresult eq 'no' }">
		<script>
			window.onload=function() {
				alert('아이디를 입력후 시도해 주세요!!');
			}
		</script>
	</c:if>
</c:if>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${contextPath }/resources/css/member/joinForm.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/member/joinForm.js" />"></script>
</head>
<body>
	<div class="joinForm">
		<div class="membership_DIV">
			<p id="company_name">IBLOG</p>
			<p>회원가입</p>
			<ul>
				<li><button id="steb">3</button></li>
				<li><button>2</button></li>
				<li><button>1</button></li>
			</ul>
			<div class="addMember_DIV">
				<form name="IBmember" id="IBmember" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<table class="memberTable">
						<tbody>
							<tr>
								<td><p>ID</p></td>
								<td><input type="text" name="id" id="id" placeholder="아이디 입력칸" value="${userid }" /></td>
								<td><input type="submit" id="idcheck" value="중복 확인" formaction="${contextPath }/member/idCheck.do"/></td>
							</tr>
							<tr>
								<td><p>PASSWORD</p></td>
								<td><input type="password" name="password" id="pwd" placeholder="비밀번호 입력칸" /></td>
								<td id="pwdLimit_td"><span id="pwdLimit">비밀번호는 영문+숫자+틀수문자(!@#$%^&+=) 최소 8글자 이상</span></td>
							</tr>
							<tr>
								<td><p>PASSWORD CHECK</p></td>
								<td><input type="password" name="pwdcheck" id="pwdcheck" placeholder="비밀번호 확인 입력칸" /></td>
								<td><span id="pwdCheck">패스워드가 일치하지 않습니다!!</span></td>
							</tr>
							<tr>
								<td><p>NAME</p></td>
								<td><input type="text" name="name" id="username" placeholder="이름 입력칸" /></td>
							</tr>
							<tr>
								<td><p>EMAIL</p></td>
								<td><input type="text" name="email" id="email" value="${userEmail }" placeholder="${userEmail }" readonly="readonly" /></td>
							</tr>
							<tr>
								<td colspan="3"><input type="button" id="addmember" value="회원가입" /></td>
							</tr>
						</tbody>
					</table>
				</form>
				<input type="hidden" id="idcheckresult" value="${idcheckresult }" />
			</div>
		</div>
	</div>
</body>
</html>