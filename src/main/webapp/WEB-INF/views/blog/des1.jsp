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
<link href="${contextPath }/resources/css/blog/blog1.css?after"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/blog/des1.js" />"></script>
</head>
<body>
	<c:if test="${main_category eq 'none' }">
		<div class="categoryTitle_DIV">
			<h3>카테고리 없음</h3>
		</div>
	</c:if>

	<c:if test="${main_category ne 'none' }">
		<c:forEach var="i" begin="0" end="${writeInfoVOList.size()-1}">
			<c:if
				test="${writeAddress == writeInfoVOList.get(i).getWrite_address() }">
				<div class="categoryTitle_DIV">
					<ul>
						<li><h3>${writeInfoVOList.get(i).getWrite_main_category()}
								- ${writeInfoVOList.get(i).getWrite_sub_category() }</h3></li>
						<c:if test="${writeInfoVOList ne 'none' }">
							<li><p style="font-size: 30px;">${writeInfoVOList.get(i).getWrite_subject() }</p></li>
						</c:if>
						<c:if test="${writeInfoVOList eq 'none' }">
							<li><p style="font-size: 30px;">등록된 글이 없습니다</p></li>
						</c:if>
						<li style="float: left; margin-right: 30px;"><p id="wrid">${iblogbyAddress.getId() }</p></li>
						<c:if test="${writeInfoVOList ne 'none' }">
							<li style="float: left;"><p>${writeInfoVOList.get(i).getWrite_date()}</p></li>
						</c:if>
						<li style="float:right;"><p>views ${writeInfoVOList.get(i).getWrite_count() }</p></li>
						<c:if test="${member.getId() == writeInfoVOList.get(i).getId() }">
							<li style="float:right;margin-top:15px;"><button id="wrup" name="${i }" onClick="updateWrite('${writeInfoVOList.get(i).getId()}',
							'${writeInfoVOList.get(i).getWrite_main_category()}',
							'${writeInfoVOList.get(i).getWrite_sub_category()}',
							'${writeInfoVOList.get(i).getWrite_subject()}',
							'${writeInfoVOList.get(i).getWrite_address()}')">수정</button>
							<button id="wrdel" onClick="deleteWrite('${writeInfoVOList.get(i).getId()}',
							'${writeInfoVOList.get(i).getWrite_main_category()}',
							'${writeInfoVOList.get(i).getWrite_sub_category()}',
							'${writeInfoVOList.get(i).getWrite_address()}')">삭제</button></li>
						</c:if>
					</ul>
				</div>
				<div class="discription_DIV">
					${writeInfoVOList.get(i).getWrite_description() }</div>
				<div class="otherList_DIV">
					<ul>
						<li id="other_LI"><p>'${writeInfoVOList.get(i).getWrite_sub_category() }'
								카테고리의 다른 글</p></li>
						<c:forEach var="j" begin="0" end="${writeInfoVOList.size()-1}">
							<c:if
								test="${writeInfoVOList.get(i).getWrite_main_category() == writeInfoVOList.get(j).getWrite_main_category() && writeInfoVOList.get(i).getWrite_sub_category() == writeInfoVOList.get(j).getWrite_sub_category() }">
								<li><a
									href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do/${writeInfoVOList.get(j).getWrite_address()}/write.do">${writeInfoVOList.get(j).getWrite_subject()}</a><span>${writeInfoVOList.get(j).getWrite_date()}</span></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</c:forEach>
	</c:if>
</body>
<script>
function updateWrite(id,write_main_category,write_sub_category,write_subject,write_address) {
	var form = document.createElement("form");
	
	const write_description = $('.discription_DIV').html();
	
	console.log(write_description);
	
 	form.setAttribute("charset", "UTF-8");

	form.setAttribute("method", "Post"); // Post 방식

	form.setAttribute("action", "/iblog/blog/updateWriteForm.do"); // 요청 보낼 주소

	var hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "id");

	hiddenField.setAttribute("value", id);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "write_main_category");

	hiddenField.setAttribute("value", write_main_category);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "write_sub_category");

	hiddenField.setAttribute("value", write_sub_category);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "write_subject");

	hiddenField.setAttribute("value", write_subject);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "write_description");

	hiddenField.setAttribute("value", write_description);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "write_address");

	hiddenField.setAttribute("value", write_address);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "${_csrf.parameterName}");

	hiddenField.setAttribute("value", "${_csrf.token}");
	
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);

	form.submit(); 
}

function deleteWrite(id,write_main_category,write_sub_category,write_address) {
	var form = document.createElement("form");
	
 	form.setAttribute("charset", "UTF-8");

	form.setAttribute("method", "Post"); // Post 방식

	form.setAttribute("action", "/iblog/blog/deleteWrite.do"); // 요청 보낼 주소

	var hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "id");

	hiddenField.setAttribute("value", id);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "write_main_category");

	hiddenField.setAttribute("value", write_main_category);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "write_sub_category");

	hiddenField.setAttribute("value", write_sub_category);
	
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "write_address");

	hiddenField.setAttribute("value", write_address);
	
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