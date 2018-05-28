<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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
</script>
</head>
<body>
<%
List<BookDTO> bbList = (List<BookDTO>)request.getAttribute("bbList");
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
			
					
						<div>
						<!-- myUseBBookList.jsp : 도서 대출 목록 -->
						<h2>대출중인 도서 목록</h2>
							<ul>
							    <li>책 번호</li>
								<li>책 제목</li>
								<li>대출일자</li>
								<li>반납할 일자</li>
							</ul>
							<%
							if(bbList == null) {
								%>
								<ul><li>대여중인 도서가 없습니다.</li></ul>
								<%
							} else {
							SimpleDateFormat bbook_bdate = new SimpleDateFormat("yyyy-MM-dd");
							SimpleDateFormat bbook_rdate = new SimpleDateFormat("yyyy-MM-dd");
							for(BookDTO bDTO :  bbList) {
							%>
							<ul onclick="location.href = 'MyBorrowBookDetail.me'">
							    <li><%=bDTO.getBook_number() %></li>
								<li><%=bDTO.getBook_subject() %></li>
								<li><%=bbook_bdate.format(bDTO.getBbook_bdate()) %></li>
								<li><%=bbook_rdate.format(bDTO.getBbook_rdate()) %></li>
							</ul>
							<%
							}
						}
							%>
					
					</div>
			
			     </div>
				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>

</body>
</html>