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
<link href="${contextPath }/resources/css/blog/blog1.css?after" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<c:if test="${main_category eq 'none' }">
		<div class="categoryTitle_DIV">
			<h3>카테고리 없음</h3>
		</div>
	</c:if>

	<c:if test="${main_category ne 'none' }">
		<div class="categoryTitle_DIV">
		<ul>
				<li><h3>${main_category.get(0).get('CATEGORY_VALUE')} - ${sub_category.get(0).get('CATEGORY_VALUE') }</h3></li>
				<c:if test="${writeLastVO ne 'none' }">
					<li><p style="font-size: 30px;">${writeLastVO.get(0).getWrite_subject() }</p></li>
				</c:if>
				<c:if test="${writeLastVO eq 'none' }">
					<li><p style="font-size: 30px;">등록된 글이 없습니다</p></li>
				</c:if>
				<li style="float: left;margin-right: 30px;"><p>${iblogbyAddress.getId() }</p></li>
				<c:if test="${writeLastVO ne 'none' }">
					<li style="float:left;"><p>${writeLastVO.get(0).getWrite_date()}</p></li>
				</c:if>
				<c:if test="${writeLastVO ne 'none' }">
					<li style="float:right;"><p>views ${writeInfoVOList.get(i).getWrite_count() }</p></li>
				</c:if>
		</ul>
	</div>
	<div class="discription_DIV">
		<c:if test="${writeLastVO ne 'none' }">
			${writeLastVO.get(0).getWrite_description() }
		</c:if>
	</div>
	<div class="otherList_DIV">
		<ul>
			<c:if test="${writeLastVO ne 'none' }">
				<li id="other_LI"><p>'${writeLastVO.get(0).getWrite_sub_category() }' 카테고리의 다른 글</p></li>
				<c:forEach var="i" begin="0" end="${writeLastVO.size()-1}">
					<c:if test="${writeLastVO.get(0).getWrite_sub_category() == writeLastVO.get(i).getWrite_sub_category() }">
						<li><a href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do/${writeLastVO.get(i).getWrite_address()}/write.do">${writeLastVO.get(i).getWrite_subject()}</a><span>${writeLastVO.get(i).getWrite_date()}</span></li>
					</c:if>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	</c:if>
</body>
</html>