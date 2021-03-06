<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath }/resources/css/main/mainHeader.css?after" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/main/mainHeader.js" />"></script>
<meta charset="UTF-8">
<title>헤더</title>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>

	<div class="TopDIV">
		<div class="logoDiv">
			<ul class="ListUL">
				<li class="List"
					style="border-left: 1px solid; border-color: #ea9eef;"><a
					href="#">공지</a></li>
				<li class="List"><a href="#">태그</a></li>
				<li style="margin-top: 21px; border: none;"><a
					href="${contextPath }/main.do"> <img title="HOME" id="mainLogo"
						src="/iblog/resources/image/logo/Mainlogo4.png" />
				</a></li>
				<li class="List"
					style="border-left: 1px solid; border-color: #ea9eef;"><a
					href="#">인기</a></li>
				<li class="List"><a href="#">검색</a></li>
			</ul>
			<ul class="memberList">
			<c:if test="${member == null}">
				<li style="float: left;" class="loginB"><a href="${contextPath }/member/loginForm.do"><button title="로그인" id="login">로그인</button></a></li>
				<li style="float: right;" class="loginB"><a href="${contextPath }/member/TOSForm.do"><button title="회원가입" id="user" >회원가입</button></a></li>
			</c:if>
			<c:if test="${member != null}">
				<li class="loginA"><img src="${contextPath }/resources/image/main/main_loginLogo/member.png" title="개인정보" id="Mypage"/></li>
				<li class="memberInfo">
					<div id="memberInfoDIV">
						<ul>
							<li><p>${member.getUsername() } 님</p></li>
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
		<div>
			<div class="total_blog">
				<h1 class="total_com to">총</h1>
				<h1 class="total_com num">100,000</h1>
				<h1 class="total_com com">개의 IBLOG 사이트</h1>
			</div>
			<div class="search_input_div">
				<div class="input_div_span">
					<span>검색 필터를 통해 원하는 블로그를 찾아보세요!!</span>
				</div>
				<div class="input_div_img">
						<select>
							<option>전체</option>
						</select>
						<input type="text" placeholder="Search" />
						<img src="${contextPath }/resources/image/main/main_search/search.png"/>
				</div>
			</div>
			<div class="hot_search">
				<span>Currently Popular Searches</span>
				<ul>
					<li><button>코로나19</button></li>
					<li><button>맛집</button></li>
					<li><button>제주도</button></li>
					<li><button>게임</button></li>
					<li style="margin:0;"><button>Java</button></li>
				</ul>
			</div>
		</div>

	</div>

</body>
</html>











