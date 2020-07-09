<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<c:choose>
	<c:when test="${memDel eq 'ok' }">
		<script>
			window.onload=function() {
				alert("탈퇴가 완료되었습니다.");
			}
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${memDel eq 'no' }">
		<script>
			window.onload=function() {
				alert("회원탈퇴 오류가 발생했습니다. 다시시도 혹은 고객센터로 문의해주세요!!");
			}
		</script>
	</c:when>
</c:choose>
<link href="${contextPath }/resources/css/main/main.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>IBLOG</title>
<link href="https://fonts.googleapis.com/css2?family=Stylish&amp;display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="<c:url value="/resources/js/main/main.js" />"></script>
</head>
<body>
	<div class="mainForm">	
		<div class="notice_Div">
			<div class="notice_Form">
			<h1>공지사항</h1>
				<div class="notice_List">	
					<ul>
					<li><button id="first_notice">공지사항</button></li>
					<c:forEach var="notice" begin="1" end="6">
						<li><button>공지사항</button></li>
					</c:forEach>
					<li><button id="last_notice">공지사항</button></li>
					</ul>
				</div>
			
				<div class="notice_Image">
					<img src="${contextPath }/resources/image/main/main_notice/notice1.png"/>
					<h2>자신만의 블로그를 만들어 보세요<br>
					<button>바로가기</button></h2>
				</div>
			</div>
		</div>
	
		<div class="tag_Form">
			<h1>#태그로</h1>
			<h2>원하는 블로그를 손쉽게 찾아보세요</h2>
			<div class="tag_List">
				<ul>
					<li><button>#맛집</button></li>
					<li><button>#여행</button></li>
					<li><button>#웹개발</button></li>
					<li><button>#Java</button></li>
					<li><button>#카페</button></li>
					<li><button>#게임</button></li>
					<li><button>#토픽</button></li>
				</ul>
				<div>
					<img src="${contextPath }/resources/image/main/main_tag/tag1.jpg" />	
				</div>
			</div>
		</div>
		
		<div class="popular_Form">
			<h1>인기있는</h1>
			<h2>블로그를 한눈에 볼수있어요</h2>
			<div class="popular_List">
				<div class="popular_DIV">
					<a href="#">
						<div class="wrap_thumb">
							<img src="${contextPath }/resources/image/main/main_popular/popular1.jpg"/>
						</div>
						<div class="info_exam">
							<h1>종합 인기목록</h1>
							<p>전체 블로그중에 1위는 누구?</p>
						</div>
					</a>
					<a href="#" class="secon_List">
						<div class="wrap_thumb">
							<img src="${contextPath }/resources/image/main/main_popular/popular2.jpg"/>
						</div>
						<div class="info_exam">
							<h1>태그별 인기목록</h1>
							<p>태그별 순위를 확인하새요!!</p>
						</div>
					</a>
					
					<a href="#">
						<div class="wrap_thumb">
							<img src="${contextPath }/resources/image/main/main_popular/popular1.jpg"/>
						</div>
						<div class="info_exam">
							<h1>나의 순위,친구 순위</h1>
							<p>나와 친구 블로그의 순위를 확인해보세요!</p>
						</div>
					</a>
					<a href="#" class="secon_List">
						<div class="wrap_thumb">
							<img src="${contextPath }/resources/image/main/main_popular/popular2.jpg"/>
						</div>
						<div class="info_exam">
							<h1>게임 인기목록</h1>
							<p>게임 태그 1위는 무엇일까요?</p>
						</div>
					</a>
					<a href="#" class="secon_List">
						<div class="wrap_thumb">
							<img src="${contextPath }/resources/image/main/main_popular/popular2.jpg"/>
						</div>
						<div class="info_exam">
							<h1>맛집 인기목록</h1>
							<p>맛집 태그 1위는 어디일까요?</p>
						</div>
					</a>
					<a href="#" class="secon_List">
						<div class="wrap_thumb">
							<img src="${contextPath }/resources/image/main/main_popular/popular2.jpg"/>
						</div>
						<div class="info_exam">
							<h1>여행 인기목록</h1>
							<p>여행 태그 1위 블로그는 누구일까요?</p>
						</div>
					</a>
			</div>
			<div class="before_BTN arrow_btn">
				<button class="arrow" id="left_BTN">
					<img src="${contextPath }/resources/image/arrow/back.png"/>
				</button>
			</div>
			<div class="next_BTN arrow_btn">
				<button class="arrow" id="right_BTN">
					<img src="${contextPath }/resources/image/arrow/next.png"/>
				</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>