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
<meta charset="UTF-8">
<title>아이블로그 관리</title>
<link
	href="${contextPath }/resources/css/mypage/newIblogMakeForm.css?after"
	rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/mypage/iblogfixForm.css?after"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script src="<c:url value="/resources/js/mypage/iblogfixForm.js" />"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="mypageForm_DIV">
		<div class="mypage_DISDIV">
			<div class="run_IBLOG_DIV">
				<h2 style="text-align: center;">나의 아이블로그 수정</h2>
				<div>
					<form name="FIXIB" id="FIXIB" style="height: 800px;"
						action="${contextPath }/mypage/fixIblog.do" method="post">
						<table class="infoBlog_table">
							<tbody>
								<tr class="input_TR">
									<td><p>블로그 이름</p></td>
									<c:if test="${iblogInfoVO ne 'none' }">
										<td><input type="text" name="blogName" id="blogName"
											value="${iblogInfoVO.getBlogName() }" /></td>
									</c:if>
									<td class="input_info"><p>블로그 메인 제목입니다</p></td>
								</tr>
								<tr class="input_TR">
									<td><p>서브 타이틀 제목</p></td>
									<c:if test="${iblogInfoVO ne 'none' }">
										<td><input type="text" name="title" id="title"
											value="${iblogInfoVO.getTitle() }" /></td>
									</c:if>
									<td class="input_info"><p>블로그 위에 표시 될 서브 제목 입니다</p></td>
								</tr>
								<tr class="input_TR">
									<td><p>블로그 주소</p></td>
									<c:if test="${iblogInfoVO ne 'none' }">
										<td><input type="text" name="blogAddress" id="blogAdress"
											value="${iblogInfoVO.getBlogAddress() }" readonly="readonly" /></td>
									</c:if>
									<td class="input_info"><p>주소는 변경 불가 합니다.</p></td>
								</tr>
								<tr>
									<td><p>블로그 주제 선택</p></td>
									<td><select name="subject" form="FIXIB">
											<option value="food">Food</option>
											<option value="game">Game</option>
											<option value="it">IT</option>
											<option value="trip">여행</option>
											<option value="other">기타</option>
									</select></td>
									<td class="input_info"><p>블로그가 분류될 주제 입니다</p></td>
								</tr>
								<tr>
									<td><p>스킨 선택</p></td>
								</tr>
								<tr class="check_TR">
									<td><input type="radio" name="skin" value="skin1" />스킨1</td>
									<td style="padding-left: 50px;"><input type="radio"
										name="skin" value="skin2" />스킨2</td>
									<td><input type="radio" name="skin" value="skin3" />스킨3</td>
									<td><input type="radio" name="skin" value="skin4" />스킨4</td>
								</tr>
								<tr class="img_TR">
									<td><img
										src="${contextPath }/resources/image/skin/skin1.jpg" /></td>
									<td style="padding-left: 95px;"><img
										src="${contextPath }/resources/image/skin/skin2.jpg" /></td>
									<td><img
										src="${contextPath }/resources/image/skin/skin3.jpg" /></td>
									<td><img
										src="${contextPath }/resources/image/skin/skin4.jpg" /></td>
								</tr>
								<tr>
									<td><input name="id" type="hidden"
										value="${member.getUsername()}" /></td>
									<td><input name="${_csrf.parameterName}" type="hidden"
										value="${_csrf.token}" /></td>
									<td colspan="2"><input type="button" id="fixib" value="수정" /></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="run_IBLOG_DIV2">
				<h2 style="text-align: center;">카테고리 추가 및 수정</h2>
				<div class="categoryAdd_DIV">
					<form name="ADDCAT" id="ADDCAT"
						action="${contextPath }/mypage/addCategory.do" method="post">
						<table>
							<tbody id="categoryAdd_tbody">
								<c:if test="${categoryMainList == null }">
									<tr class="main_category">
										<td class="cat_num_td"><input type="hidden"
											name="category_num" value="1" readonly="readonly" /> <input
											type="text" name="d" value="ㆍ" disabled="disabled" /></td>
										<td class="cat_main_td"><input type="text"
											name="category_value" /></td>
										<td class="cat_btn_td"><input type="button"
											class="sub_add" value="추가" onClick="subAddFunction(event)" /> <input
											type="button" class="fix" value="수정" /><input type="button"
											class="del" style="margin: 0;" value="삭제" /> <input
											type="hidden" name="category_kind" value="main"
											readonly="readonly" /></td>
									</tr>
									<tr class="sub_margin_tr"></tr>
									<tr class="sub_category">
										<td class="sub_cat_num_td">
											<p>ㆍㆍㆍㆍ</p>
										</td>
										<td class="sub_cat_main_td"><input type="hidden"
											name="category_num" class="sub_cnum" value="1-1"
											readonly="readonly" /> <input type="text"
											name="category_value" class="sub_cat" /></td>
										<td class="sub_cat_btn_td"><input type="button"
											class="fix" value="수정" /> <input type="button" class="del"
											style="margin: 0;" value="삭제" /> <input type="hidden"
											name="category_kind" value="sub" readonly="readonly" /></td>
									</tr>
									<tr class="main_margin_tr"></tr>
								</c:if>
								<c:if test="${categoryMainList != null }">
									<c:forEach var="i" begin="0" end="${categoryMainList.size()-1}">
										<tr class="main_category">
											<td class="cat_num_td"><input type="hidden"
												name="category_num"
												value="${categoryMainList.get(i).get('CATEGORY_NUM') }"
												disabled="disabled" /> <input type="text" name="d" value="ㆍ"
												disabled="disabled" /></td>
											<td class="cat_main_td"><input type="text"
												name="category_value"
												value="${categoryMainList.get(i).get('CATEGORY_VALUE') }"
												disabled="disabled" /></td>
											<td class="cat_btn_td"><input type="button"
												class="sub_add" value="추가" onClick="subAddFunction(event)" />
												<input type="button" class="fix" value="수정"
												onClick="fixCatFunction(event)" /><input type="button"
												class="del" style="margin: 0;" value="삭제"
												onClick="delCatFunction(event)" /> <input type="hidden"
												name="category_kind" value="main" disabled="disabled" /></td>
										</tr>
										<c:forEach var="k" begin="0" end="${categorySubList.size()-1}">
											<c:if
												test="${categoryMainList.get(i).get('CATEGORY_NUM').charAt(0) == categorySubList.get(k).get('CATEGORY_NUM').charAt(0) }">
												<tr class="sub_margin_tr"></tr>
												<tr class="sub_category">
													<td class="sub_cat_num_td">
														<p>ㆍㆍㆍㆍ</p>
													</td>
													<td class="sub_cat_main_td"><input type="hidden"
														name="category_num" class="sub_cnum"
														value="${categorySubList.get(k).get('CATEGORY_NUM') }"
														disabled="disabled" /> <input type="text"
														name="category_value" class="sub_cat"
														value="${categorySubList.get(k).get('CATEGORY_VALUE') }"
														disabled="disabled" /></td>
													<td class="sub_cat_btn_td"><input type="button"
														class="fix" value="수정" onClick="fixCatsubFunction(event)" />
														<input type="button" class="del" style="margin: 0;"
														value="삭제" onClick="delCatsubFunction(event)" /> <input
														type="hidden" name="category_kind" value="sub"
														disabled="disabled" /></td>
												</tr>
											</c:if>
										</c:forEach>
										<tr class="main_margin_tr"></tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div class="save_div">
							<input name="${_csrf.parameterName}" type="hidden"
								value="${_csrf.token}" /> <input name="id" id="cat_id"
								type="hidden" value="${member.getUsername()}" /> <input
								type="button" id="main_add" value="메인 카테고리 추가" /> <input
								type="button" id="catego_save" value="변경사항 저장하기" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function subAddFunction(event) {
		const num = $('.sub_category').length + 1;
		var main_category = $(event.target).parent().parent();
		const num_first = main_category.children().first().children().attr(
				"value");
		var sub_category = "";
		var total = 0;
		const classsub = $(event.target).parent().parent().next().attr("class");

		total = check_sub(main_category, total);
		sub_category = lastsub(main_category, sub_category, total);

		if (classsub == null) {
			$(
					"<tr class='sub_category'>"
							+ "<td class='sub_cat_num_td'><p>ㆍㆍㆍㆍ</p></td>"
							+ "<td class='sub_cat_main_td'><input type='hidden' name='category_num' class='sub_cnum' value='"+num_first+"-1' readonly='readonly'/><input type='text' name='category_value' class='sub_cat' placeholder='소분류는 최대 16개까지 만들수 있습니다'/></td>"
							+ "<td class='sub_cat_btn_td'><input type='button' class='fix' value='수정'/><input type='button' class='del' style='margin:0;' value='삭제' onClick='delCatsubFunction(event)'/><input type='hidden' name='category_kind' value='sub' readonly='readonly'/></td>"
							+ "</tr>").insertAfter(main_category);
			$("<tr class='sub_margin_tr'></tr>").insertAfter(main_category);
		} else {
			$(
					"<tr class='sub_category'>"
							+ "<td class='sub_cat_num_td'><p>ㆍㆍㆍㆍ</p></td>"
							+ "<td class='sub_cat_main_td'><input type='hidden' name='category_num' class='sub_cnum' value='"
							+ num_first
							+ "-"
							+ (total + 1)
							+ "' readonly='readonly'/><input type='text' name='category_value' class='sub_cat' placeholder='소분류는 최대 16개까지 만들수 있습니다'/></td>"
							+ "<td class='sub_cat_btn_td'><input type='button' class='fix' value='수정'/><input type='button' class='del' style='margin:0;' value='삭제' onClick='delCatsubFunction(event)'/><input type='hidden' name='category_kind' value='sub' readonly='readonly'/></td>"
							+ "</tr>").insertAfter(sub_category);
			$("<tr class='sub_margin_tr'></tr>").insertAfter(sub_category);
		}
		
		function lastsub(main_category, sub_category, total) {
			total = total * 2 + 1;
			for (var i = 0; i < total; i++) {
				main_category = main_category.next();

				if (main_category.attr("class") == 'main_margin_tr') {
					sub_category = main_category.prev();
					return sub_category;
				}
			}
		}

		function check_sub(main_category, total) {
			for (var i = 0; i < 30; i++) {
				main_category = main_category.next();
				if (main_category.attr("class") == 'sub_category') {
					total += 1;
				} else if (main_category.attr("class") == 'main_margin_tr') {
					return total;
				}
			}
			return total;
		}
	}
	function fixCatFunction(event) {

		const num = $(event.target).parent().prev().prev().children();
		const value = $(event.target).parent().prev().children();
		const kind = $(event.target).next().next();
		num.removeAttr("disabled");
		num.attr("readonly", "readonly");
		value.removeAttr("disabled");
		kind.removeAttr("disabled");
		kind.attr("readonly", "readonly");
	}

	function fixCatsubFunction(event) {

		const num = $(event.target).parent().prev().children().eq(0);
		const value = $(event.target).parent().prev().children().eq(1);
		const kind = $(event.target).next().next();
		console.log(num);
		console.log(value);
		console.log(kind);
		num.removeAttr("disabled");
		num.attr("readonly", "readonly");
		value.removeAttr("disabled");
		kind.removeAttr("disabled");
		kind.attr("readonly", "readonly");
	}

	function delCatFunction(event) {
		const main_cat = $(event.target).parent().parent();
		var main_cat2 = $(event.target).parent().parent();
		var list = new Array();
		var category_num = new Array();
		for (var i = 0; i < 16; i++) {
			main_cat2 = main_cat2.next();
			if (main_cat2.attr("class") == 'sub_category'
					|| main_cat2.attr("class") == 'main_margin_tr'
					|| main_cat2.attr("class") == 'sub_margin_tr') {
				list.push(main_cat2);
			} else if (main_cat2.attr("class") == 'main_category') {
				console.log(list);
				category_num.push(main_cat.children().eq(0).children().eq(0)
						.attr("value"));
				for (var k = 0; k < list.length; k++) {
					if (k % 2 != 0 && k != 0) {
						category_num.push(list[k].children().eq(1).children()
								.eq(0).attr("value"));
					}
					list[k].remove();
				}
				delData(category_num);
				main_cat.remove();
				return false;
			}
		}

	}

	function delCatsubFunction(event) {
		const sub_cat = $(event.target).parent().parent();
		const sub_margin_cat = $(event.target).parent().parent().prev();
		var num = $(event.target).parent().prev().children().eq(0);
		var list = new Array();
		var category_num = new Array();
		category_num.push(num.attr("value"));
		delData(category_num);
		sub_margin_cat.remove();
		sub_cat.remove();

	}

	function delData(category_num) {
		var form = document.createElement("form");
		const id = $("#cat_id").attr("value");

		form.setAttribute("charset", "UTF-8");

		form.setAttribute("method", "Post"); //Post 방식

		form.setAttribute("action", "/iblog/mypage/delCategory.do"); //요청 보낼 주소

		var hiddenField = document.createElement("input");

		hiddenField.setAttribute("type", "hidden");

		hiddenField.setAttribute("name", "id");

		hiddenField.setAttribute("value", id);

		form.appendChild(hiddenField);

		for (var i = 0; i < category_num.length; i++) {
			hiddenField = document.createElement("input");

			hiddenField.setAttribute("type", "hidden");

			hiddenField.setAttribute("name", "category_num");

			hiddenField.setAttribute("value", category_num[i]);

			form.appendChild(hiddenField);
		}

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