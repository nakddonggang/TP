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
<link href="<c:url value="/css/jquery.fullpage.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/jquery.toast.min.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/jQuery.Alert-1.0.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
	<%
	String member_id = (String) session.getAttribute("member_id");
	if (member_id == null) {
		boolean admincheck = (boolean) session.getAttribute("admincheck");
		if(admincheck == false) {
				response.sendRedirect("./Main.fp");
		}
	}
	%>
<%
String pageNum = (String)request.getAttribute("pageNum");
BookDTO bookList = (BookDTO)request.getAttribute("bookList");
%>

<body>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<article class="submenu section SECTION">
					<div class="slide DIV_SLIDE">
						<div class="intro1">
							<div class="slide_con">
								<div class="box_thm">
									<div id="admBookDLosInfo_img" class="box_thm01">
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
				<!-- //서브메뉴 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					<div class="content">
				<!-- 메인 페이지 -->
				
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					<!-- 본문 공간 -->
					
					<div class='join_form'>
					
					<h3>손망실 책 상세정보</h3>
						<ul class="row">
							<li>
								<ul class="row_sub">
										<li class="title"><span>고유 번호</span></li>
										<li class="inp_form"><input type="text" name="book_number" value="<%=bookList.getBook_number()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>사유</span></li>
										<li class="ta_form"><textarea cols="20" rows="10" readonly><%=bookList.getDbook_reason()%></textarea></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>도서상태</span></li>
										<li class="ta_form"><input type="text" name="dbook_state" value="<%=bookList.getDbook_state()%>" readonly></li>
								</ul>
							</li>
						</ul>

				<div class="btn_btm_center" >
					<ul>
						<li class="adm_btn_cancle">
							<input type="button" value="글목록" onclick="location.href='./AdminBookDLos.am?pageNum=<%=pageNum%>'" class ="btn_type4 BTN_IF_LIST">
						</li>
						<li class="adm_btn__left">
							<input type="button" value="손망실 수정" onclick="location.href='./AdminBookDLosReWrite.am?book_number=<%=bookList.getBook_number()%>'"  class ="btn_type4 BTN_IF_LIST">
						</li>
					</ul>
				</div>
				
					</div>
					</div>
				<!-- //메인 페이지-->
				
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>