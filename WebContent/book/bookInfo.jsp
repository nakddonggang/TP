<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp"%>
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
<script type="text/javascript">
function bbook(){
	var bbook = confirm("대출예약을 하시겠습니까?");
	if(bbook==true){
		document.fr.action="";
		document.fr.submit();
	} else{
		return;
	}
}
function basket(){
	var basket = confirm("책바구니에 담겠습니까?");
	if(basket==true){
		document.fr.action="";
		document.fr.submit();
	} else{
		return;
	}	
}
</script>
</head>
<body>
<%

int book_number = ((Integer)request.getAttribute("book_number")).intValue();
String pageNum = request.getParameter("pageNum");
BookDTO bookList = (BookDTO)request.getAttribute("bookList");
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
				<div class="content">
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
				
					<h2>책 정보보기</h2>
					<form action="" method="post" name="fr">
					<table border="1">
						<tr>
							<th>고유번호 : </th>
							<td><%=bookList.getBook_number()%></td>
						</tr>	
						<tr>						
							<th>표제 : </th>
							<td><%=bookList.getBook_subject()%></td>
						</tr>	
						<tr>	
							<th>저자 : </th>
							<td><%=bookList.getBook_author()%></td>
						</tr>	
						<tr>	
							<th>발행처 : </th>
							<td><%=bookList.getBook_publisher()%></td>
						</tr>	
						<tr>	
							<th>발행일 : </th>
							<td><%=(Timestamp)bookList.getBook_pubDate()%></td>
						</tr>	
						<tr>	
							<th>형태 : </th>
							<td><%=bookList.getBook_form()%></td>
						</tr>	
						<tr>	
							<th>주기 : </th>
							<td><%=bookList.getBook_notation()%></td>
						</tr>	
						<tr>	
							<th>국제표준번호 : </th>
							<td><%=bookList.getBook_isbn()%></td>
						</tr>	
						<tr>	
							<th>분류기호 : </th>
							<td><%=bookList.getBook_classification()%></td>
						</tr>	
						<tr>	
							<th>입고일 : </th>
							<td><%=(Timestamp)bookList.getBook_date()%></td>	
						</tr>	
					</table>
					<div>
							<!-- book/bookInfo.jsp 에 필요한 기능 -->
						<input type="button" value="대출예약" onclick="location.href='javascript:bbook()'">
						<input type="button" value="책바구니" onclick="location.href='javascript:basket()'">
					</div>
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