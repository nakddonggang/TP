<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#serve_Book').submit(function() {
			if ($('#serve_book_text1').val() == "") {
				alert("작성내용을 모두 입력해 주세요");
				return false;
			} else if ($('#serve_book_text2').val() == "") {
				alert("작성내용을 모두 입력해 주세요");
				return false;
			} else if ($('#serve_book_text3').val() == "") {
				alert("작성내용을 모두 입력해 주세요");
				return false;
			} else if ($('#serve_book_text4').val() == "") {
				alert("작성내용을 모두 입력해 주세요");
				return false;
			} else {
			}
		});
	});
</script>
</head>
<body>
	<%
		String member_id = (String) session.getAttribute("member_id");
		if (member_id != null) {
	%>
	<script type="text/javascript">
		alert("로그인 한 후 사용하세요");
		location.href = "./MemberLogin.me";
	</script>
	<%
		}
	%>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->

				<article class="mainmenu section SECTION">
					<jsp:include page="../include/topbar.jsp" />
					<!-- 메인 페이지 -->


					<div class='join_form adminfo_join_form'>
						<h2>희망도서 신청</h2>
						<div class="adm">
							<form action="./ServeBookAction.bk" method="post" id="serve_Book">
								<input type="hidden" value="wait" name="hbook_check">
								<ul class="row">
									<li>
										<ul class="row_sub">
											<li class="title"><span>아이디</span></li>
											<li class="adm_inp_form"><input type="text"
												name="member_id" value="1111" readonly></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title"><span>도서명</span></li>
											<li class="adm_inp_form"><input type="text"
												name="hbook_subject" id="serve_book_text1"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title"><span>저자</span></li>
											<li class="adm_inp_form"><input type="text"
												name="hbook_author" id="serve_book_text2"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title"><span>발행처</span></li>
											<li class="adm_inp_form"><input type="text"
												name="hbook_publisher" id="serve_book_text3"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title"><span>희망도서 설명</span></li>
											<li class="adm_inp_form"><textarea cols="35" rows="10"
													name="hbook_explain" id="serve_book_text4"></textarea></li>
										</ul>
									</li>
								</ul>

								<div class="btn_btm_center">
									<ul>
										<li class="btn_cancle"><input type="submit"
											value="도서 신청하기" class="btn_type4 BTN_IF_LIST"></li>
										<li class="adm_btn__left"><input type="reset" value="취소"
											class="btn_type4 BTN_IF_LIST"></li>
									</ul>
								</div>
							</form>

						</div>

					</div>

				</article>
				<!-- //메인 페이지-->

			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>

</body>
</html>