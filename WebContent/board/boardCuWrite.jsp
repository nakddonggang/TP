<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="../css/jquery.fullpage" rel="stylesheet" type="text/css">
<link href="../css/import.css?ver=1" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.3.1.js"></script>
<script src="../js/jquery.bxslider.min.js"></script>
<script src="../js/jquery.fullpage.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.min.js"></script>
<script src="../js/fullpage.min.js"></script>
</head>
<body>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- top_link -->
		<jsp:include page="../include/topmenu.jsp" />
		<!-- //top_link -->

		<!-- container -->
		<div class="container">
			<section class="sub_con_half SEC_HALF">
				<h2 class="hide">Title</h2>
				<article>
					<!-- left_content -->
					<jsp:include page="../include/submenu.jsp" />
					<!-- //left_content -->
					
					<form action="./BoardCurWriteAction.cu" method="post" name="fr" enctype="multipart/form-data">
						<table border="1">
							<tr>
								<td>글쓴이</td>
								<td>
									<input type="text" name="cur_name">
								</td>
							</tr>
							<tr>
								<td>제목</td>
								<td>
									<input type="text" name="cur_type">
								</td>
							</tr>
							<tr>
								<td>타입</td>
								<td>
									<input type="text" name="cur_subject">
								</td>
							</tr>
							<tr>
								<td>파일</td>
								<td>
									<input type="file" name="cur_file">
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
									<textarea cols="20" rows="10" name="cur_content" style="width: 580px; resize: none;"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="등록"><input type="reset" value="뒤로">
								</td>
							</tr>
						</table>
					</form>
	
				</article>
			</section>
		</div>
	</div>
</body>
</html>