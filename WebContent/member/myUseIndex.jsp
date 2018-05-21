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
						if(member_id == null) response.sendRedirect("./MemberLogin.me");
						String pageNum = (String) request.getAttribute("pageNum");
						int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
						int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
						int startPage = ((Integer) request.getAttribute("startPage")).intValue();
						int endPage = ((Integer) request.getAttribute("endPage")).intValue();
						int count = ((Integer) request.getAttribute("count")).intValue();
					%>
					<!-- myUseBasket.jsp : 책바구니 -->
						<h2>책 바구니</h2>
						<input type="button" value="상세보기"
							onclick="location.href='myUseBasket.jsp'">
						<table>
							<tr>
								<td>책 번호</td>
								<td>예약번호</td>
								<td>대출신청/삭제<input type="checkbox"></td>
							</tr>
							<tr>
								<td>책 번호</td>
								<td>예약번호</td>
								<td>대출신청/삭제<input type="checkbox"></td>
							</tr>
						</table>
					</div>
					<%
					List<BookDTO> bList = (List<BookDTO>)request.getAttribute("bList");
					%>
					<div>
						<!-- myUseBook.jsp : 도서 대출 목록 -->
						<h2>대출중인 도서 목록</h2>
						<input type="button" value="상세보기"
							onclick="location.href='myUseBook.jsp'">
						<table>
							<tr>
								<td>책 번호</td>
								<td>책 제목</td>
								<td>대출일자</td>
								<td>반납할 일자</td>
							</tr>
							<%
							if(bList == null) {
								%>
								<tr><td>대여중인 도서가 없습니다.</td></tr>
								<%
							} else {
							SimpleDateFormat bbook_bdate = new SimpleDateFormat("yyyy-MM-dd");
							for(BookDTO bDTO :  bList) {
							%>
							<tr>
								<td><%=bDTO.getBook_number() %></td>
								<td><%=bDTO.getBook_subject() %></td>
								<td><%=bbook_bdate.format(bDTO.getBbook_bdate()) %></td>
								<td>반납할 일자</td>
							</tr>
							<%
							}
						}
							%>
						</table>
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

					<div>
						<!-- myUseFacility.jsp : 시설 이용 현황 -->
						<h2>시설 이용 목록</h2>
						<input type="button" value="상세보기"
							onclick="location.href='myUseFacility.jsp'">
						<table>
							<tr>
								<td>자리번호</td>
								<td>시작시간</td>
								<td>종료시간</td>
								<td>자리유형</td>
							</tr>
						<!-- 	for문 자리 -->
						</table>
					</div>
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>