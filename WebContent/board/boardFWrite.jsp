<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<!-- board/boardFWrite.jsp FAQ 글쓰기 페이지 -->
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- container -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">
				<h2 class="hide">Main</h2>

				<!-- left_content -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //left_content -->
				<article class="rgt_con section SECTION">
					<!-- 본문 공간 -->
	
			<h1>FAQ 글쓰기</h1>
			<form action="./BoardFaqWriteAction.fa"  method="post"  name="fr" enctype="multipart/form-data">
				<table class="" >
					<tr>
						<th>TYPE</th>
						<td><input type="text" name="faq_type" value=""></td>
					</tr>
					<tr>
						<th>SUBJECT</th>
						<td><input type="text" name="faq_subject" value=""></td>
					</tr>
					<tr>
						<th>CONTENT</th>
						<td><input type="text" name="faq_content" value=""></td>
					</tr>
					<tr>
						<th>FILE</th>
						<td><input type="file" name="faq_file"></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="글쓰기"> <input type="reset" value="취소"></th>
					</tr>
				</table>
			</form>

					<!-- // 본문 공간 -->
				</article>
			</section>
		</div>
		<!-- //container -->
	</div>

</body>
</html>