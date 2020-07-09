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
<link href="${contextPath }/resources/css/mypage/newIblogMakeForm.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/mypage/newiblogMakeForm.js" />"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="mypageForm_DIV">
		<div class="mypage_DISDIV">
			<div class="run_IBLOG_DIV">
				<h2 style="text-align: center;">나의 블로그 만들기</h2>
				<div>
					<form name="NEWIB" id="NEWIB" style="height: 800px;" action="${contextPath }/mypage/newIblog.do" method="post">
						<table class="infoBlog_table">
						<tbody>
							<tr class="input_TR">
								<td><p>블로그 이름</p></td>
								<td><input type="text" name="blogName" id="blogName"/></td>
								<td class="input_info"><p>블로그 메인 제목입니다</p></td>
							</tr>
							<tr class="input_TR">
								<td><p>서브 타이틀 제목</p></td>
								<td><input type="text" name="title" id="title"/></td>
								<td class="input_info"><p>블로그 위에 표시 될 서브 제목 입니다</p></td>
							</tr>
							<tr class="input_TR">
								<td><p>블로그 주소</p></td>
								<td><input type="text" name="blogAddress" id="blogAdress" placeholder="주소는 다시는 수정불가 하오니 신중하게 적어주세요!!"/></td>
								<td class="input_info"><p>iblog.**.blog 중간 **에 들어갈 주소를 적어주세요!! 영어(2~10글자)로만 가능합니다.</p></td>
							</tr>
							<tr>
								<td><p>블로그 주제 선택</p></td>
								<td>
									<select name="subject" form="NEWIB">
										<option value="food">Food</option>
										<option value="game">Game</option>
										<option value="it">IT</option>
										<option value="trip">여행</option>
										<option value="other">기타</option>
									</select>
								</td>
								<td class="input_info"><p>블로그가 분류될 주제 입니다</p></td>
							</tr>
							<tr>
								<td><p>스킨 선택</p></td>
							</tr>
							<tr class="check_TR">
								<td><input type="radio" name="skin" value="skin1"/>스킨1</td>
								<td style="padding-left: 50px;"><input type="radio" name="skin" value="skin2"/>스킨2</td>
								<td><input type="radio" name="skin" value="skin3"/>스킨3</td>
								<td><input type="radio" name="skin" value="skin4"/>스킨4</td>
							</tr>
							<tr class="img_TR">
								<td><img src="${contextPath }/resources/image/skin/skin1.jpg"/></td>
								<td style="padding-left: 95px;"><img src="${contextPath }/resources/image/skin/skin2.jpg"/></td>
								<td><img src="${contextPath }/resources/image/skin/skin3.jpg"/></td>
								<td><img src="${contextPath }/resources/image/skin/skin4.jpg"/></td>
							</tr>
							<tr>
								<td><input name="id" type="hidden" value="${member.getUsername()}"/></td>
								<td><input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/></td>
								<td colspan="2"><input type="button" id="nowsub2" value="만들기"/></td>
							</tr>
						</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>