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
<link href="${contextPath }/resources/css/blog/blogHeader4.css?after" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/blog/blog4.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/blog/blog4.js" />"></script>
<script src="<c:url value="/resources/js/blog/blogHeader4.js" />"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="content_DIV">
		<div class="TopDIV">
			<div class="logoDiv">
				<ul class="ListUL">
					<li style="padding-top: 10px; border: none;"><a
						href="${contextPath }/main.do"> <img title="HOME" id="mainLogo"
							src="/iblog/resources/image/logo/Mainlogo4.png" />
					</a></li>
				</ul>
				<ul class="memberList">
				<c:if test="${isLogon == null}">
					<li style="float: left;" class="loginB"><a href="${contextPath }/member/loginForm.do"><button title="로그인" id="login">로그인</button></a></li>
					<li style="float: right;" class="loginB"><a href="${contextPath }/member/TOSForm.do"><button title="회원가입" id="user" >회원가입</button></a></li>
				</c:if>
				<c:if test="${isLogon != null}">
					<li class="loginA"><img src="${contextPath }/resources/image/main/main_loginLogo/member.png" title="개인정보" id="Mypage"/></li>
					<li class="memberInfo">
						<div id="memberInfoDIV">
							<ul>
								<li><p>${member.getName() } 님</p></li>
								<li style="margin-bottom: 20px;"><img src="${contextPath }/resources/image/main/main_loginLogo/member.png" style="width: 70px;"/></li>
								<li style="margin-bottom: 20px;">
									<c:if test="${iblogInfoVO ne 'none' }">
										<input type="button" name="${iblogInfoVO.getBlogAddress() }" id="blogAdrress" value="iblg.${iblogInfoVO.getBlogAddress() }.blog"/>
									</c:if>
									<c:if test="${iblogInfoVO eq 'none' }">
										<input type="button" id="blogAdrresss" value="개설된 블로그 없음"/>
									</c:if>
								</li>
								<li><a href="${contextPath }/mypage/mypageForm.do"><button id="mypage_BTN">마이페이지</button></a></li>
								<li><a href="${contextPath }/member/logout.do"><button id="logout_BTN">로그아웃</button></a></li>
							</ul>
						</div>
					</li>
				</c:if>
				</ul>
			</div>
		</div>
	<div class="blogDis_DIV">
		<div>
			<div class="welcome_DIV">
				<h2>${iblogbyAddress.getId() }님의 블로그에 오신걸 환영합니다</h2>
			</div>
			<c:if test="${main_category eq 'none' }">
				<div class="mainDis_DIV">
					<div class="leftCat_DIV">
						<h3>카테고리 없음</h3>
					</div>
				</div>
			</c:if>
			<c:if test="${main_category ne 'none' }">
				<div class="mainDis_DIV">
					<c:forEach var="i" begin="0" end="${main_category.size()-1}">
						<c:if test="${i%2 == 0 || i == 0}">
							<div class="leftCat_DIV">
								<ul>
									<li
										style="border-top: 1px solid; border-bottom: 1px solid; height: 60px;"><h2>${main_category.get(i).get('CATEGORY_VALUE') }</h2></li>
									<c:if test="${sub_category ne 'none' }">
										<c:forEach var="k" begin="0" end="${sub_category.size()-1}">
											<c:if test="${writeInfoVOList ne 'none' }">
											<c:if
												test="${main_category.get(i).get('CATEGORY_NUM').charAt(0) == sub_category.get(k).get('CATEGORY_NUM').charAt(0) }">
												<li style="margin-top: 10px;"><a>-
														${sub_category.get(k).get('CATEGORY_VALUE') }</a></li>
												<ul
													style="width: 82%; overflow: hidden; border-bottom: 1px dashed; margin-bottom: 20px;">
													<c:forEach var="j" begin="0"
														end="${writeInfoVOList.size()-1}">
														<c:if
															test="${main_category.get(i).get('CATEGORY_VALUE') == writeInfoVOList.get(j).getWrite_main_category() && sub_category.get(k).get('CATEGORY_VALUE') == writeInfoVOList.get(j).getWrite_sub_category() }">
															<li style="margin-bottom: 15px; width: 170px;"><a
																href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do/${writeInfoVOList.get(j).getWrite_address()}/write.do"
																style="text-decoration: none; color: #505050;">--
																	${writeInfoVOList.get(j).getWrite_subject() }</a>
														</c:if>
													</c:forEach>
												</ul>
											</c:if>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</c:if>
						<c:if test="${i%2 != 0 && i != 0 }">
							<div class="rightCat_DIV">
								<ul>
									<li
										style="border-top: 1px solid; border-bottom: 1px solid; height: 60px;"><h2>${main_category.get(i).get('CATEGORY_VALUE') }</h2></li>
									<c:if test="${sub_category ne 'none' }">
										<c:forEach var="k" begin="0" end="${sub_category.size()-1}">
											<c:if test="${writeInfoVOList ne 'none' }">
											<c:if
												test="${main_category.get(i).get('CATEGORY_NUM').charAt(0) == sub_category.get(k).get('CATEGORY_NUM').charAt(0) }">
												<li style="margin-top: 10px;"><a>-
														${sub_category.get(k).get('CATEGORY_VALUE') }</a></li>
												<ul
													style="width: 82%; overflow: hidden; border-bottom: 1px dashed; margin-bottom: 20px;">
													<c:forEach var="j" begin="0"
														end="${writeInfoVOList.size()-1}">
														<c:if
															test="${main_category.get(i).get('CATEGORY_VALUE') == writeInfoVOList.get(j).getWrite_main_category() && sub_category.get(k).get('CATEGORY_VALUE') == writeInfoVOList.get(j).getWrite_sub_category() }">
															<li style="margin-bottom: 15px; width: 170px;"><a
																href="http://localhost:8080/iblog/${iblogbyAddress.getBlogAddress()}/blog.do/${writeInfoVOList.get(j).getWrite_address()}/write.do"
																style="text-decoration: none; color: #505050;">--
																	${writeInfoVOList.get(j).getWrite_subject() }</a>
														</c:if>
													</c:forEach>
												</ul>
											</c:if>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
	</div>
</body>
</html>