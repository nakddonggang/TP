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
<script src="<c:url value="/js/jQuery.Alert-1.0.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script type="text/javascript">
</script>
</head>
<body>
<%
int book_number = Integer.parseInt(request.getParameter("book_number"));
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
				
					
					<%SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd"); %>
					<div class='join_form adminfo_join_form' >
					<h3>도서 상세보기</h3>
						<ul class="row">
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>고유번호 : <%=bookList.getBook_number()%></span></li>
										<li class="inp_form"><img src="./upload/book/<%=bookList.getBook_file()%>" width="110" height="130"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>표제</span></li>
										<li class="inp_form"><%=bookList.getBook_subject()%></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>저자</span></li>
										<li class="inp_form"><%=bookList.getBook_author()%></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>발행처</span></li>
										<li class="inp_form"><%=bookList.getBook_publisher()%></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>대출일</span></li>
										<li class="inp_form"><%=date.format(bookList.getBbook_bdate())%></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>반납일</span></li>
										<li class="inp_form"><%=date.format(bookList.getBbook_rdate())%></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>연체일</span></li>
										<li class="inp_form"><%=%></li>
								</ul>
							</li>
							
						</ul>
							
				<div class="btn_btm_center">
				<ul>
					<li class="adm_btn_cancle">
						<input type="button" value="반납" onclick="location.href='./AdminBookReWrite.am?book_number=<%=bookList.getBook_number()%>'" class ="btn_type4 BTN_IF_LIST">
					</li>
					<li class="adm_btn__left">
						<input type="button" value="뒤로가기" onclick="location.href='./MemberMyUseBorrowBookList.me?book_number=<%=bookList.getBook_number()%>'" class ="btn_type4 BTN_IF_LIST b">
					</li>
				
				</ul>
				
				</div>
				
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