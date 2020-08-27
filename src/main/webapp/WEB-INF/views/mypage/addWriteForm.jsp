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
<c:choose>
	<c:when test="${iblogInfoVO eq 'none' }">
		<script>
			window.onload = function() {
				alert("아이블로그를 먼저 개설해 주세요!!!");
				location.href = "${contextPath}/mypage/mypageForm.do";
			}
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when
		test="${write_main_category eq 'none' || write_sub_category eq 'none' }">
		<script>
			window.onload = function() {
				alert("카테고리 먼저 만든 후에 글쓰기를 진행해주세요!!");
				location.href = "${contextPath}/mypage/iblogfixForm.do";
			}
		</script>
	</c:when>
</c:choose>
<meta charset="UTF-8">
<title>아이블로그 글쓰기</title>
<link href="${contextPath }/resources/css/mypage/addWriteForm.css?after"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script src="<c:url value="/resources/js/mypage/addWriteForm.js" />"></script>
<script type="text/javascript"
	src="${contextPath }/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="mypageForm_DIV">
		<div class="mypage_DISDIV">
			<div class="run_IBLOG_DIV">
				<h2 style="text-align: center;">아이블로그 글쓰기</h2>
				<div>
					<form name="WRITEIB" id="WRITEIB" style="min-height: 1300px;"
						action="${contextPath }/mypage/addWrite.do" method="post">
						<ul>
							<li><select name="write_main_category" id="main"
								form="WRITEIB" onchange="main_categoryValue()">
									<option selected="selected" disabled="disabled">메인카테고리</option>
									<c:if
										test="${write_main_category ne 'none' && write_sub_category ne 'none' }">
										<c:forEach var="i" begin="0"
											end="${write_main_category.size()-1}">
											<c:if
												test="${main_value ne 'none' && main_value eq write_main_category.get(i).get('CATEGORY_VALUE') }">
												<option
													value="${write_main_category.get(i).get('CATEGORY_VALUE') }"
													selected="selected">${write_main_category.get(i).get('CATEGORY_VALUE') }</option>
											</c:if>
											<c:if
												test="${main_value ne 'none' && main_value eq write_main_category.get(i).get('CATEGORY_VALUE') }">
												<option
													value="${write_main_category.get(i).get('CATEGORY_VALUE') }">${write_main_category.get(i).get('CATEGORY_VALUE') }</option>
											</c:if>
											<c:if test="${main_value eq 'none'}">
												<option
													value="${write_main_category.get(i).get('CATEGORY_VALUE') }">${write_main_category.get(i).get('CATEGORY_VALUE') }</option>
											</c:if>
										</c:forEach>
									</c:if>
							</select> <c:if test="${sub_cw eq 'none' }">
									<select name="write_sub_category" id="sub" form="WRITEIB">
										<option selected="selected" disabled="disabled">서브카테고리</option>
									</select>
								</c:if> <c:if test="${sub_cw ne 'none' }">
									<select name="write_sub_category" id="sub" form="WRITEIB">
										<option selected="selected" disabled="disabled">서브카테고리</option>
										<c:forEach var="i" begin="0" end="${sub_cw.size()-1}">
											<option value="${sub_cw.get(i).get('CATEGORY_VALUE') }">${sub_cw.get(i).get('CATEGORY_VALUE') }</option>
										</c:forEach>
									</select>
								</c:if></li>
							<li><input type="text" name="write_subject" id="write_title"
								placeholder="글제목" /></li>
							<li>
								<div class="jsx-2303464893 editor">
									<div class="fr-box fr-basic fr-top" role="application">
										<div class="fr-wrapper show-placeholder"
											style="overflow: scroll; width: 1148px;">
											<textarea class="form_control" name="write_description"
												id="bo_content" style="width: 1124px; height: 500px;">
											</textarea>
										</div>
									</div>
								</div>
							</li>
							<li><input name="${_csrf.parameterName}" type="hidden"
								value="${_csrf.token}" /> <input name="id" id="write_id"
								type="hidden" value="${member.getUsername()}" /></li>
							<li><input type="button" id="saveWrite" value="완료" /></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function main_categoryValue() {
		const main_value = $("#main option:selected").val();
		addsub(main_value);
	}

	function addsub(main_value) {
		var form = document.createElement("form");
		const id = $("#write_id").attr("value");

		form.setAttribute("charset", "UTF-8");

		form.setAttribute("method", "Post"); // Post 방식

		form.setAttribute("action", "/iblog/mypage/writeCngSub.do"); // 요청 보낼 주소

		var hiddenField = document.createElement("input");

		hiddenField.setAttribute("type", "hidden");

		hiddenField.setAttribute("name", "id");

		hiddenField.setAttribute("value", id);

		form.appendChild(hiddenField);

		hiddenField = document.createElement("input");

		hiddenField.setAttribute("type", "hidden");

		hiddenField.setAttribute("name", "category_value");

		hiddenField.setAttribute("value", main_value);

		form.appendChild(hiddenField);

		hiddenField = document.createElement("input");

		hiddenField.setAttribute("type", "hidden");

		hiddenField.setAttribute("name", "${_csrf.parameterName}");

		hiddenField.setAttribute("value", "${_csrf.token}");

		form.appendChild(hiddenField);

		document.body.appendChild(form);

		form.submit();
	}
</script>
</html>
