<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
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
				
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					<!-- 본문 공간 -->
			<div class="fp-tableCell">	
			<h2>책 입고하기</h2>
			<div class="join_form">
			<form action="./AdminBookWriteAction.am" method="post" enctype="multipart/form-data">
				<ul class="row">
					<li>
						<ul class="row_sub">
							<li class="title"><span>표제</span></li>
							<li class="inp_form"><input type="text" name="book_subject"></li>
						</ul>
					</li>
					<li>
						<ul class="row_sub">
						<li class="title"><span>저자</span></li>
						<li class="inp_form"><input type="text" name="book_author"></li>
						</ul>
					</li>
					<li>
						<ul class="row_sub">
						<li class="title"><span>발행처</span></li>
						<li class="inp_form"><input type="text" name="book_publisher"></li>
						</ul>
					</li>
					<li>
						<ul class="row_sub">
						<li class="title"><span>발행일</span></li>
						<li class="inp_form"><input type="text" name="book_pubDate" placeholder="YYYY-MM-DD 형식으로 입력해주세요"></li>
						</ul>
					</li>
					<li>
						<ul class="row_sub">
						<li class="title"><span>형태</span></li>
						<li class="inp_form"><input type="text" name="book_form"></li>
						</ul>
					</li>
					<li>
						<ul class="row_sub">
						<li class="title"><span>주기</span></li>
						<li class="inp_form"><input type="text" name="book_notation"></li>
						</ul>
					</li>
					<li>
						<ul class="row_sub">
						<li class="title"><span>국제표준번호</span></li>
						<li class="inp_form"><input type="text" name="book_isbn"></li>
						</ul>
					</li>
					<li>
						<ul class="row_sub">
						<li class="title"><span>분류기호</span></li>
						<li class="inp_form"><input type="text" name="book_classification"></li>
						</ul>
					</li>
					<li>
						<ul class="row_sub">
						<li class="title"><span>책 사진</span></li>
						<li class="inp_form"><input type="file" name="book_file"></li>
						</ul>
					</li>
				</ul>
				
				<div class="btn_btm_center">
				<ul>
					<li class="btn_cancle"><input type="submit" value="입고하기">
					<input type="reset" value="취소"></li>
				</ul>
				</div>
				
			</form>
			</div>
		</div> <!-- table 풀 페이지 div -->
		
			<!-- // 본문 공간 --> </article> </section>
		</div>
		<!-- //container -->
	</div>
</body>
</html>