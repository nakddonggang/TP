<%@page import="net.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<%
BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO");
String pageNum = request.getParameter("pageNum");
%>
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
			<form action="./BoardNoticeUpdateAction.no?num=<%=bDTO.getNotice_num() %>&pageNum=<%=pageNum %>"  method="post"  name="fr" enctype="multipart/form-data">
				<table class="">
					<tr>
						<th>TYPE</th>
						<td><input type="text" name="notice_type" value="<%=bDTO.getNotice_type()%>"></td>
					</tr>
					<tr>
						<th>SUBJECT</th>
						<td><input type="text" name="notice_subject" value="<%=bDTO.getNotice_subject()%>"></td>
					</tr>
					<tr>
						<th>CONTENT</th>
						<td><input type="text" name="notice_content" value="<%=bDTO.getNotice_content()%>"></td>
					</tr>
					<tr>
						<th>FILE</th>
						<td><input type="file" name="notice_file" value="<%=bDTO.getNotice_file()%>"></td>
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