<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<!-- member/memberInsert.jsp 회원가입 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />	<!-- div id=header -->
			<jsp:include page="../include/footer.jsp" />	<!-- div id=footer -->
		</div>
		<div id="sub_menu">
			<jsp:include page="../include/submenu.jsp"/>	<!-- div id=sub_menu -->
		</div>
		
		<!-- 본문 시작되는 곳 -->
		<article>
			<h1>Notice 글쓰기</h1>
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

		</article>
	</div>
</body>
</html>