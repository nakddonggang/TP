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
<%
int book_number = Integer.parseInt(request.getParameter("book_number"));
%>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- container -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">
				<h2 class="hide"></h2>

				<!-- left_content -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //left_content -->
				<article class="rgt_con section SECTION">
					<!-- 본문 공간 -->
					<h2>손망실 작성</h2>
					<form action="./AdminBookDLosWriteAction.am" method="post">
						<table border="1">
							<tr>
								<th>고유번호 : </th><td><input type="text" name="book_number" value="<%=book_number%>" readonly></td>
							</tr>
							<tr>	
								<th>사유 : </th><td><textarea cols="20" rows="10" name="dbook_reason"></textarea></td>
							</tr>
							<tr>	
								<th>도서상태 : </th><td><input type="text" name="dbook_state"></td>
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