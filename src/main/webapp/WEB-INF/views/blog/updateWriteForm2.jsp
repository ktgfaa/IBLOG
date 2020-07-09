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
<title>아이블로그 글수정</title>
<link href="${contextPath }/resources/css/blog/updateWriteForm2.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/mypage/updateWriteForm.js" />"></script>
<script type="text/javascript" src="${contextPath }/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="mypageForm_DIV">
		<div class="mypage_DISDIV">
			<div class="run_IBLOG_DIV">
				<h2 style="text-align: center;">아이블로그 글수정</h2>
				<div>
					<form name="UPWRITE" id="UPWRITE" style="min-height: 1300px;" action="${contextPath }/blog/updateWrite.do" method="post">
						<ul>
							<li>
 								<select name="write_main_category" id="main" form="WRITEIB" onchange="main_categoryValue()">
									<option selected="selected" disabled="disabled">메인카테고리</option>
									<c:if test="${writeInfoVO ne 'none'}">
										<option value="${writeInfoVO.getWrite_main_category() }" selected="selected">${writeInfoVO.getWrite_main_category() }</option>
									</c:if>
								</select>
								<c:if test="${writeInfoVO ne 'none' }">
									<select name="write_sub_category" id="sub" form="WRITEIB">
										<option value="${writeInfoVO.getWrite_sub_category() }" selected="selected">${writeInfoVO.getWrite_sub_category() }</option>
									</select>
								</c:if>
							</li>
							<li>
								<input type="text" name="write_subject" id="write_title" value="${writeInfoVO.getWrite_subject() }"/>
							</li>
							<li>
 								<div class="jsx-2303464893 editor"> 
									<div class="fr-box fr-basic fr-top" role="application"> 
										<div class="fr-wrapper show-placeholder" style="overflow: scroll;width: 1264px;"> 
											<textarea class="form_control" name="write_description" id="bo_content" style="width: 1264px; height: 500px;">
												${writeInfoVO.getWrite_description() }
											</textarea> 
										</div> 
									</div> 
								</div>
							</li>
							<li>
								<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
								<input name="id" id="write_id" type="hidden" value="${writeInfoVO.getId()}"/>
								<input name="write_address" id="write_address" type="hidden" value="${writeInfoVO.getWrite_address()}"/>
							</li>
							<li>
								<input type="button" id="upwrite" value="수정" />
							</li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
