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
				<!-- 메인 페이지 -->
				
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					<!-- 본문 공간 -->
			<h2>책 입고하기</h2>
			<form action="./AdminBookWriteAction.am" method="post">
				<table border="1">
					<tr>
						<td>표제 : </td>
						<td><input type="text" name="book_subject"></td>
					</tr>
					<tr>
						<td>저자 : </td>
						<td><input type="text" name="book_author"></td>
					</tr>
					<tr>
						<td>발행처 : </td>
						<td><input type="text" name="book_publisher"></td>
					</tr>
					<tr>
						<td>발행일 : </td>
						<td><input type="text" name="book_pubDate"></td>
					</tr>
					<tr>
						<td>형태 : </td>
						<td><input type="text" name="book_form"></td>
					</tr>
					<tr>
						<td>주기 : </td>
						<td><input type="text" name="book_notation"></td>
					</tr>
					<tr>
						<td>국제표준번호 : </td>
						<td><input type="text" name="book_isbn"></td>
					</tr>
					<tr>
						<td>분류기호 : </td>
						<td><input type="text" name="book_classification"></td>
					</tr>
				</table>
				
				<div>
					<input type="submit" value="입고하기">
					<input type="reset" value="취소">
				</div>
			</form>

			<!-- // 본문 공간 --> </article> </section>
		</div>
		<!-- //container -->
	</div>
</body>
</html>