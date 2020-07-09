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
<title>마이페이지</title>
<link href="${contextPath }/resources/css/mypage/mypage.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/mypage/mypage.js" />"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="mypageForm_DIV">
		<c:if test="${PasSet eq 'not' }">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2>운영중인 IBLOG</h2>
					<div>
						<ul>
							<c:if test="${member.getRunblog() eq 'run' }">
								<li class="IBLOG_LI">
									<img src="${contextPath }/resources/image/mypage/nonImage/nonB.jpg"/>
									<p>${iblogInfoVO.getBlogName() }</p>
									<a href="/iblog/${iblogInfoVO.getBlogAddress() }/blog">${iblogInfoVO.getBlogAddress() }</a>
								</li>
								<li><button id="delBLOG">내 블로그 삭제</button></li>
							</c:if>
							<c:if test="${member.getRunblog() eq 'none' }">
								<li class="IBLOG_LI">
									<img src="${contextPath }/resources/image/mypage/nonImage/nonB.jpg"/>
									<p>개설된 블로그가 없습니다.</p>
								</li>
								<li><button id="newBLOG">새 블로그 만들기</button></li>
							</c:if>
							
						</ul>
					</div>
				</div>
				<div class="info_IBLOG_DIV">
					<h2>나의 IBLOG 현황</h2>
					<div>
						<ul>
							<c:if test="${member.getRunblog() eq 'none' }">
								<li class="IBLOG_LI">
									<p>현재 내 블로그는 전체</p>
									<p style="color:red;">00위</p> 
									<p>입니다.</p>
								</li>
							</c:if>
							<c:if test="${member.getRunblog() eq 'run' }">
								<li class="IBLOG_LI">
									<p>현재 내 블로그는 전체</p>
									<p style="color:red;">${myRank }위</p> 
									<p>입니다.</p>
								</li>
							</c:if>
							<li class="IBLOG_LI2"><p>순위는 조회수로 측정됩니다.</p></li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${PasSet eq 'yet'}">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">비밀번호 수정</h2>
					<div>
						<form name="IBALPAS" action="${contextPath }/mypage/passetCheck.do" method="post">
							<input type="password" name="password" id="nowPas" placeholder="현재 비밀번호"/>
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							<input type="submit" id="nowsub" value="확인"/>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${PasSet eq 'now'}">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">비밀번호 수정</h2>
					<div>
						<form name="IBALPAS" style="height: 300px;" action="${contextPath }/mypage/updatePas.do" method="post">
							<ul>
								<li><input type="password" style="margin-top: 30px;" name="password" id="nowPas" placeholder="새 비밀번호"/></li>
								<li><input type="password" name="passwordcheck" id="PasC" placeholder="새 비밀번호 확인"/></li>
								<li><span id="pwdCheck">패스워드가 일치하지 않습니다!!</span></li>
								<li><input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/></li>
								<li><input type="button" id="nowsub2" style="margin: 0;" value="변경"/></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${PasSet eq 'x' }">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">비밀번호 수정</h2>
					<div>
						<form name="IBALPAS" action="${contextPath }/mypage/passetCheck.do" method="post">
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
				<c:if test="${PasSet eq 'don' }">
			<div class="mypage_DISDIV">
				<div class="run_IBLOG_DIV">
					<h2 style="text-align: center;">비밀번호 수정</h2>
					<div>
						<form name="IBALPAS" action="${contextPath }/mypage/passetCheck.do" method="post">
							<input type="password" name="password" id="nowPas" placeholder="현재 비밀번호"/>
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							<input type="submit" id="nowsub" value="확인"/>
						</form>
					</div>
				</div>
			</div>
			<script>
				window.onload=function() {
					alert("비밀번호 수정이 완료되었습니다.");
				}
			</script>
		</c:if>
	</div>
</body>
</html>