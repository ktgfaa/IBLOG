<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<c:set var="baseURL" value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 0, fn:length(req.requestURI)), req.contextPath)}"></c:set>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}"></c:set>
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath }/resources/css/blog/blogside1.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/blog/side1.js" />"></script>
</head>
<body>
	<div class="sideCategory_DIV">
		<div class="leftSide_DIV">
			<div class="blogmyInfo_DIV">
				<ul>
					<li><img src="${contextPath }/resources/image/main/main_loginLogo/member2.png"/></li>
					<li><h3 style="margin-bottom: 1px;">${iblogbyAddress.getBlogName() } 블로그</h3></li>
					
					<li style="height: 55px;"><p style="margin-left: 13%;">누적 방문자 수 : </p><p style="margin-left: 15px;">${iblogbyAddress.getIblog_count() }명</p></li>
				</ul>
			</div>
			<div class="blogmyCategory_DIV">
				<c:if test="${main_category eq 'none' }">
					<h3>카테고리 없음</h3>
				</c:if>
				<c:if test="${main_category ne 'none' }">
					<c:forEach var="i" begin="0" end="${main_category.size()-1}">
					<ul>
						<li><h2>${main_category.get(i).get('CATEGORY_VALUE') }</h2></li>
						<c:if test="${sub_category ne 'none' }">
							<c:forEach var="k" begin="0" end="${sub_category.size()-1}">
								<c:if test="${main_category.get(i).get('CATEGORY_NUM').charAt(0) == sub_category.get(k).get('CATEGORY_NUM').charAt(0) }">
									<li><strong>-  ${sub_category.get(k).get('CATEGORY_VALUE') }</strong>
										<c:if test="${writeInfoVOList ne 'none' }">
											<ul style="overflow: hidden;margin-top: 15px;">
												<c:forEach var="j" begin="0" end="${writeInfoVOList.size()-1}">
													<c:if test="${main_category.get(i).get('CATEGORY_VALUE') == writeInfoVOList.get(j).getWrite_main_category() && sub_category.get(k).get('CATEGORY_VALUE') == writeInfoVOList.get(j).getWrite_sub_category() }">
														<li style="margin-bottom: 15px;width: 170px;"><a href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do/${writeInfoVOList.get(j).getWrite_address()}/write.do" style="text-decoration: none;color: #505050;">-- ${writeInfoVOList.get(j).getWrite_subject() }</a>
													</c:if>
												</c:forEach>
											</ul>
										</c:if>
									</li>
								</c:if>
							</c:forEach>
						</c:if>				
					</ul>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>










