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
String pageNum = request.getParameter("pageNum");
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
				
					<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class="content">
	
			<h1>FAQ 글쓰기</h1>
			<form action="./BoardFaqUpdateAction.fa?num=<%=bDTO.getFaq_num() %>&pageNum=<%=pageNum %>"  method="post"  name="fr" enctype="multipart/form-data">
	
				<table class="" >
					<tr>
						<th>TYPE</th>
						<td><input type="text" name="faq_type" value="<%=bDTO.getFaq_type()%>"></td>
					</tr>
					<tr>
						<th>SUBJECT</th>
						<td><input type="text" name="faq_subject" value="<%=bDTO.getFaq_subject()%>"></td>
					</tr>
					<tr>
						<th>CONTENT</th>
						<td><input type="text" name="faq_content" value="<%=bDTO.getFaq_content()%>"></td>
					</tr>
					<tr>
						<th>FILE</th>
						<td><input type="file" name="faq_file"><%=bDTO.getFaq_file()%></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="글수정"> <input type="reset" value="다시쓰기"></th>
					</tr>
				</table>
			</form>
			</div>
			<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>