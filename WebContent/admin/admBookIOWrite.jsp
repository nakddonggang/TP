<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../css/jquery.fullpage" rel="stylesheet" type="text/css">
<link href="../css/import.css?ver=1" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery.bxslider.min.js"></script>
<script src="../js/jquery.fullpage.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/fullpage.js"></script>
</head>
<body>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- container -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">
			<h2 class="hide"></h2>

			<!-- left_content --> <jsp:include page="../include/submenu_main.jsp" />
			<!-- //left_content --> <article class="rgt_con section SECTION">
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