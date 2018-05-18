<%@page import="java.util.Date"%>
<%@page import="net.book.db.BookDTO"%>
<%@page import="java.util.List"%>
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
request.setCharacterEncoding("utf-8");
//count, pageNum, boardList, pageCount, pageBlock, startPage, endPage 가져오기
int count = ((Integer)request.getAttribute("count")).intValue();
String pageNum = (String)request.getAttribute("pageNum");
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
List<BookDTO> rbookList = (List<BookDTO>)request.getAttribute("rbookList");
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
					<div class="content">
						
						<div class='join_form adminfo_join_form' >
					<!-- 본문 공간 -->
						<div class=board>
						
							<h3>예약관리 리스트</h3>
						  <div class="view_cnt">
						  	<p>
								Total_<span><%=count%></span>
							</p>
						  </div>
						  <div class="adm">			
						  <ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
							<ul class="no_scroll title_t">
								<li class="col_con_id">고유번호</li>
								<li class="col_con_id">아이디</li>
								<li class="col_con_id">예약순서</li>
								<li class="col_con_id">예약일자</li>
								<li class="col_con_id">입고현황</li>
							</ul>
							</div>
						<%
							if (rbookList == null) {
						%><ul>
							<li class="col_tit"><p>예약 목록이 없습니다</p></li>
						</ul>
						<%
							} else {
								for (int i = 0; i < rbookList.size(); i++) {
									BookDTO rbookLists = rbookList.get(i); //제너릭 사용해서 형변환 할 필요없음
				
						%>
						<div class="con_lst">
							<ul
								 onclick="location.href='./AdminBookInfo.am?book_number=<%=rbookLists.getBook_number()%>&pageNum=<%=pageNum%>'"  class="no_scroll">
								<li class="col_con_id"><a href="#"><p><%=rbookLists.getBook_number() %></a></li>
								<li class="col_con_id"><a href="#"><p><%=rbookLists.getMember_id()%></a></li>
								<li class="col_con_id"><a href="#"><%=rbookLists.getRbook_num()%></li>
								<li class="col_con_id"><a href="#"><%=rbookLists.getRbook_date()%></li>
								<li class="col_con_id"><a href="#"><%=rbookLists.getRbook_check()%></li>
							</ul>
						</div>
						<%}}%>
							</li>
						</ul>
						<div class="paginate">
						<%if (count != 0) {//이전
								if (startPage > pageBlock) {
						%><a href="./AdminBookRes.am?pageNum=<%=startPage - pageBlock%>" class="prev"><span class="hide">이전 페이지</span></a>
						<%}// 1~10 11~20 21~30
							for (int i = startPage; i <= endPage; i++) {
						%><a href="./AdminBookRes.am?pageNum=<%=i%>"> &nbsp;<strong title="현재 페이지" id="currentPage"><%=i %></strong> &nbsp;</a>
						<%}//다음
								if (endPage < pageCount) {
						%><a href="./AdminBookRes.am?pageNum=<%=startPage + pageBlock%>" class="next"><span class="hide">다음 페이지</span></a></a>
						<%}}%>
						</div>
				
						</div>
						  <div class="btn_btm_center">
							<ul>
								<li class="btn_cancle">
									<input type="button" value="도서관리페이지" onclick="location.href='./AdminIndex.am'" class ="btn_type4 BTN_IF_LIST">
								</li>
							</ul>
						 </div>	
					</div>
				</div>
				</div>
			</article>

		</section>
		
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>