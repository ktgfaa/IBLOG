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
<link href="${contextPath }/resources/css/blog/blog2.css?after"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/blog/blog2.js" />"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="inner_index">
		<c:if test="${writeLastVO eq 'none' }">
			<h3>등록된 글이 없습니다.</h3>
		</c:if>
		<c:if test="${writeLastVO ne 'none' }">
			<c:forEach var="i" begin="0" end="0">
			<div class="article_context">
				<div class="article_title">
					<div>
						<a href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do/${writeLastVO.get(i).getWrite_address()}/write.do"><Strong>${writeLastVO.get(i).getWrite_subject() }</Strong></a> 
					</div>
					<span>${writeLastVO.get(i).getWrite_sub_category() }</span> 
					<span>${writeLastVO.get(i).getWrite_date() }</span>
					<p style="float: right;margin: 0;">views ${writeLastVO.get(i).getWrite_count() }</p>
				</div>
				<div class="article_image article_dis">
					${writeLastVO.get(i).getWrite_description() }
				</div>
				<div class="button_DIV">
					<button id="more">MORE POST</button>
				</div>
			</div>
			</c:forEach>
		</c:if>
		<c:if test="${writeLastVO ne 'none' }">
			<c:if test="${writeLastVO.size() < 4 }">
			<c:forEach var="i" begin="1" end="${writeLastVO.size()-1}">
				<div class="article_context2">
					<div class="article_title">
						<div>
							<a href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do/${writeLastVO.get(i).getWrite_address()}/write.do"><Strong>${writeLastVO.get(i).getWrite_subject() }</Strong></a>  
						</div>
						<span>${writeLastVO.get(i).getWrite_sub_category() }</span> 
						<span>${writeLastVO.get(i).getWrite_date() }</span>
						<p style="float: right;margin: 0;">views ${writeLastVO.get(i).getWrite_count() }</p>
					</div>
					<div class="article_image article_dis">
						${writeLastVO.get(i).getWrite_description() }
					</div>
				</div>
			</c:forEach>
			</c:if>
			<c:if test="${writeLastVO.size() > 3 }">
			<c:forEach var="i" begin="1" end="3">
				<div class="article_context2">
					<div class="article_title">
						<div>
							<a href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do/${writeLastVO.get(i).getWrite_address()}/write.do"><Strong>${writeLastVO.get(i).getWrite_subject() }</Strong></a>  
						</div>
						<span>${writeLastVO.get(i).getWrite_sub_category() }</span> 
						<span>${writeLastVO.get(i).getWrite_date() }</span>
						<p style="float: right;margin: 0;">views ${writeLastVO.get(i).getWrite_count() }</p>
					</div>
					<div class="article_image article_dis">
						${writeLastVO.get(i).getWrite_description() }
					</div>
				</div>
			</c:forEach>
			</c:if>
		</c:if>
	</div>
</body>
</html>