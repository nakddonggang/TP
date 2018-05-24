<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.book.db.BookDTO"%>
<%@page import="net.member.db.MemberDTO"%>
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
	<!-- member/myUseIndex.jsp 이용현황 목록 페이지 -->
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
					<div class="content">
					<%
						String member_id = (String)session.getAttribute("member_id");
						String pageNum = (String) request.getAttribute("pageNum");
						String pageNum2 = (String) request.getAttribute("pageNum2");
						int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
						int pageCount2 = ((Integer) request.getAttribute("pageCount2")).intValue();
						int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
						int startPage = ((Integer) request.getAttribute("startPage")).intValue();
						int startPage2 = ((Integer) request.getAttribute("startPage2")).intValue();
						int endPage = ((Integer) request.getAttribute("endPage")).intValue();
						int endPage2 = ((Integer) request.getAttribute("endPage2")).intValue();
						int count = ((Integer) request.getAttribute("count")).intValue();
						int count2 = ((Integer) request.getAttribute("count2")).intValue();
					%>
					<!-- myUseBasket.jsp : 책바구니 -->
						<h2>예약중인 도서목록</h2>
						
							<ul>
								<li>책 제목</li>
								<li>예약번호</li>
								<li>예약신청날짜</li>
								<li>대출신청/삭제<input type="checkbox"></li>
							</ul>
							<%
							List<BookDTO> bList2 = (List<BookDTO>)request.getAttribute("bList2");
							if(bList2==null) {
								%>
								<ul><li>예약중인 도서가 없습니다.</li></ul>
								<%
							} else {
								SimpleDateFormat rbook_rdate = new SimpleDateFormat("yyyy-MM-dd");
								for(BookDTO bDTO : bList2) {
									%>
										<ul onclick = "loaction.href = '#'">
											<li><%=bDTO.getBook_subject() %></li>
											<li><%=bDTO.getRbook_num() %></li>
											<li><%=rbook_rdate.format(bDTO.getRbook_date()) %></li>
											<li>대출신청/삭제<input type="checkbox"></li>
										</ul>
									<%
								}
							}
							%>
					<%
								if (pageCount2 < endPage2) endPage2 = pageCount2;
								if (startPage2 > pageBlock) {
							%><a
								href="./MemberUseIndex.me?pageNum2=<%=startPage2 - pageBlock%>"
								class="prev"><span class="hide">이전 페이지</span></a>
							<%
								}

								for (int p = startPage2; p <= endPage2; p++) {
									if (p == Integer.parseInt(pageNum2)) {
										%>
										&nbsp;<strong title="현재 페이지" id="currentPage"><%=p%></strong> &nbsp;<%
 									} else {
 										%>&nbsp;<a href="./MemberUseIndex.me?pageNum2=<%=p%>"><%=p%></a>&nbsp;<%
 									}
 								}

							 	if (endPage2 < pageCount2) {
 									%><a
									href="./MemberUseIndex.me?pageNum2=<%=startPage2 + pageBlock%>"
									class="next"><span class="hide">다음 페이지</span></a>
								<%
								}
								%>
					</div>
					<%
					List<BookDTO> bList = (List<BookDTO>)request.getAttribute("bList");
					%>
					<div>
						<!-- myUseBook.jsp : 도서 대출 목록 -->
						<h2>대출중인 도서 목록</h2>
							<ul>
								<li>책 제목</li>
								<li>대출일자</li>
								<li>반납할 일자</li>
							</ul>
							<%
							if(bList == null) {
								%>
								<ul><li>대여중인 도서가 없습니다.</li></ul>
								<%
							} else {
							SimpleDateFormat bbook_bdate = new SimpleDateFormat("yyyy-MM-dd");
							for(BookDTO bDTO :  bList) {
							%>
							<ul onclick="location.href = '#'">
								<li><%=bDTO.getBook_subject() %></li>
								<li><%=bbook_bdate.format(bDTO.getBbook_bdate()) %></li>
								<li>반납할 일자</li>
							</ul>
							<%
							}
						}
							%>
						<%
								if (pageCount < endPage) endPage = pageCount;
								if (startPage > pageBlock) {
							%><a
								href="./MemberUseIndex.me?pageNum=<%=startPage - pageBlock%>"
								class="prev"><span class="hide">이전 페이지</span></a>
							<%
								}

								for (int p = startPage; p <= endPage; p++) {
									if (p == Integer.parseInt(pageNum)) {
										%>
										&nbsp;<strong title="현재 페이지" id="currentPage"><%=p%></strong> &nbsp;<%
 									} else {
 										%>&nbsp;<a href="./MemberUseIndex.me?pageNum=<%=p%>"><%=p%></a>&nbsp;<%
 									}
 								}

							 	if (endPage < pageCount) {
 									%><a
									href="./MemberUseIndex.me?pageNum=<%=startPage + pageBlock%>"
									class="next"><span class="hide">다음 페이지</span></a>
								<%
								}
								%>
					</div>

				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>