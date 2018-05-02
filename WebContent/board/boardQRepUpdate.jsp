<%@page import="net.board.db.BoardDTO"%>
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
<%
BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO");
BoardDTO bDTO1 = (BoardDTO)request.getAttribute("bDTO1");
String pageNum = request.getParameter("pageNum");
%>
<!-- board/boardQRepUpdate.jsp 답변글 수정 페이지 -->
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
		
				<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class="content">
					
					<h1>답변하기</h1>
					<form action="./BoardReplyUpdateAction.qn"  method="post"  name="fr" >
						<input type="hidden" name="pageNum" value="<%=pageNum %>">
						<input type="hidden" name="qna_ref" value="<%=bDTO.getQna_ref() %>">
						<table class="" >
							<tr>
								<th>SUBJECT</th>
								<td><input type="text" name="qna_subject" value="<%=bDTO.getQna_subject() %>" readonly></td>
							</tr>
							<tr>
								<th>CONTENT</th>
								<td><textarea cols="20" rows="10" name="qna_content" readonly="readonly" style="width: 580px; resize: none;"><%=bDTO.getQna_content() %></textarea></td>
							</tr>
							<tr>
								<th>NAME</th>
								<td><input type="text" name="rep_name" value="<%=bDTO1.getRep_name() %>"></td>
							</tr>
							<tr>
								<th>EMAIL</th>
								<td><input type="text" name="rep_email" value="<%=bDTO1.getRep_email() %>"></td>
							</tr>
							<tr>
								<th>CONTENT</th>
								<td><textarea cols="20" rows="10" name="rep_content" style="width: 580px; resize: none;"><%=bDTO1.getRep_content() %></textarea></td>
							</tr>
							<tr>
								<th colspan="2"><input type="submit" value="글쓰기"> <input type="reset" value="취소"></th>
							</tr>
						</table>
					</form>
					</div>
				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>