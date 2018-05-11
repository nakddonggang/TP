<%@page import="net.book.db.BookDTO"%>
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
BookDTO bookdto = (BookDTO)request.getAttribute("bookdto");
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
				
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
				
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					<!-- 본문 공간 -->
			<h2>희망도서 정보</h2>
			<form action="./AdminHBookWriteAction.am" method="post">
				<table border="1">
					<tr>
						<td>아이디 : </td>
						<td><input type="text" name="member_id" value="<%=bookdto.getMember_id()%>" readonly></td>
					</tr>
					<tr>
						<td>도서명 : </td>
						<td><input type="text" name="hbook_subject" value="<%=bookdto.getHbook_subject() %>" readonly></td>
					</tr>
					<tr>
						<td>저자 : </td>
						<td><input type="text" name="hbook_author" value="<%=bookdto.getHbook_author()%>" readonly></td>
					</tr>
					<tr>
						<td>처리상태 : </td>
						<td><select name="hbook_check">
							<option value="wait" <%if(bookdto.getHbook_check()=="wait") {%>selected<%}%>>대기</option>
							<option value="in" <%if(bookdto.getHbook_check()=="in") {%>selected<%}%>>입고됨</option>
							<option value="not-in" <%if(bookdto.getHbook_check()=="not-in") {%>selected<%}%>>입고불가</option>
						</select></td>
					</tr>
					<tr>
						<td>발행처 : </td>
						<td><input type="text" name="hbook_publisher" value="<%=bookdto.getHbook_publisher()%>" readonly></td>
					</tr>
					<tr>
						<td>국제표준번호 : </td>
						<td><input type="text" name="hbook_isbn" value="<%=bookdto.getHbook_isbn()%>"></td>
					</tr>
					<tr>
						<td>희망도서 설명 : </td>
						<td><input type="text" name="hbook_explain" value="<%=bookdto.getHbook_explain()%>" readonly></td>
					</tr>
				</table>
				
				<div>
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</div>
			</form>

			<!-- // 본문 공간 --> </article> </section>
		</div>
		<!-- //container -->
	</div>
</body>
</html>