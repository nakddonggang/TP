<%@page import="java.sql.Date"%>
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
				
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
				
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					<!-- 본문 공간 -->
					<h2> 예약관리 목록 [<%=count%>]</h2>
					<%if(count==0){ out.print("예약 목록이 없습니다"); } else { %>
					<table border="1">
						<tr>
							<th>고유번호</th>
							<th>아이디</th>
							<th>예약순서</th>
							<th>예약일자</th>
							<th>입고현황</th>
						</tr>
						<%
							for (BookDTO rbookLists : rbookList) {%>
						<tr onclick="location.href='./AdminBookInfo.am?book_number=<%=rbookLists.getBook_number()%>&pageNum=<%=pageNum%>'">
							<td><%=rbookLists.getBook_number() %></td>
							<td><%=rbookLists.getMember_id()%></td>
							<td><%=rbookLists.getRbook_num()%></td>
							<td><%=rbookLists.getRbook_date()%></td>
							<td><%=rbookLists.getRbook_check()%></td>		
						</tr> <%
							} %>
					</table><br>
					<%} %>	
					
					<input type="button" value="도서관리페이지로 이동" onclick="location.href='./AdminIndex.am'">
					<% // count = 전체 글의 개수
						if (count != 0) {
							// 이전페이지 // if (startPage와 pageBlock을 비교)
							if (startPage > pageBlock) {
					%><a href="./AdminIndex.am?pageNum=<%=startPage - pageBlock%>">[이전]</a><%
						}

							// 1~10		11~20		21~30
							for (int i = startPage; i <= endPage; i++) {%>
							<a href="./AdminIndex.am?pageNum=<%=i%>">[<%=i%>]</a><%		
							}
	
							// 다음 // if (endPage와 pageCount를 비교)
							if (endPage<pageCount){%>
							<a href="./AdminIndex.am?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
							}
						} // if count 괄호 %>					
					<!-- // 본문 공간 -->
				</article>
			</section>
		</div>
		<!-- //container -->
	</div>
</body>
</html>