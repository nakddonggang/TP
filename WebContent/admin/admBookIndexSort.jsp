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
String sort = (String)request.getAttribute("sort");
int count = ((Integer)request.getAttribute("count")).intValue();
String pageNum = (String)request.getAttribute("pageNum");
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
List<BookDTO> booksortList = (List<BookDTO>)request.getAttribute("booksortList");
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
				</div>
				<!-- //메인 페이지-->
					<!-- 본문 공간 -->
					<!-- 통합검색 (제목을 이용하여 검색하는 창) -->
					<div>
					<form action="./AdminBookSearch.am" method="post">
						<fieldset>
						<legend>상세검색</legend>
							<select name="category">
							<option value="all">전체</option>
							<option value="book_subject">제목</option>
							<option value="book_author">저자</option>
							<option value="book_publisher">출판사</option>
							<option value="book_isbn">국제표준번호</option>
							<option value="book_classification">분류기호</option>				
							</select>
					 		<input type="text" name="search" placeholder="책 제목을 입력하세요">
							<input type="submit" value="상세검색">	
						</fieldset>
					</form>
					</div>
					
					<fieldset>
					<legend>책 목록 정렬</legend>
					<select name="sort">
						<option value="number" checked>정렬</option>
						<option value="book_subject" onclick="location.href='./AdminBookSort.am?sort=book_subject'">제목순</option>
						<option value="book_author" onclick="location.href='./AdminBookSort.am?sort=book_author'">저자순</option>
						<option value="book_popul" onclick="location.href='./AdminBookSort.am?sort=book_number'">인기순</option>
						<option value="book_pubDate" onclick="location.href='./AdminBookSort.am?sort=book_pubDate'">신작순</option>
						<option value="book_date" onclick="location.href='./AdminBookSort.am?sort=book_date'">입고순</option>
					</select>
					</fieldset>
					
					<h2>책 목록 [<%=count%>]</h2>
					<%if(booksortList.isEmpty()){ out.print("책 목록이 없습니다"); } else {%>
					<table border="1">
						<tr>
							<th>고유번호</th>
							<th>제목</th>
							<th>저자</th>
							<th>출판사</th>
							<th>도서상태</th> <!-- dbook -->
							<th>반납상태</th> <!-- bbook -->
							<th>예약일자</th> <!-- rbook -->
							<th> 예약현황</th> <!-- rbook -->
						</tr>
						<%
							for (BookDTO booksortLists : booksortList) {%>
								<tr onclick="location.href='./AdminBookInfo.am?book_number=<%=booksortLists.getBook_number()%>'">
									<td><img src="./upload/<%=booksortLists.getBook_file()%>" width="100" height="100"><%=booksortLists.getBook_number()%></td>
									<td><%=booksortLists.getBook_subject()%></td>
									<td><%=booksortLists.getBook_author()%></td>
									<td><%=booksortLists.getBook_publisher()%></td>
									<td><%=booksortLists.getDbook_state()%></td>
									<td><%=booksortLists.getBbook_bstate()%></td>
									<td><%=booksortLists.getRbook_date()%></td>
									<td><%=booksortLists.getRbook_check()%></td>		
								</tr> <%}%>
					</table>
					<%}%><br>
					<input type="button" value="입고하기" onclick="location.href='./AdminBookWrite.am'"> 
					<input type="button" value="예약관리" onclick="location.href='./AdminBookRes.am'">					
					<input type="button" value="희망도서목록" onclick="location.href='./AdminHBookList.am'"><br>
								
					<% // count = 전체 글의 개수
						if (count != 0) {
							// 이전페이지 // if (startPage와 pageBlock을 비교)
							if (startPage > pageBlock) {
					%><a href="./AdminBookSort.am?pageNum=<%=startPage - pageBlock%>">[이전]</a><%
						}

							// 1~10		11~20		21~30
							for (int i = startPage; i <= endPage; i++) {%>
							<a href="./AdminBookSort.am?pageNum=<%=i%>">[<%=i%>]</a><%		
							}
	
							// 다음 // if (endPage와 pageCount를 비교)
							if (endPage<pageCount){%>
							<a href="./AdminBookSort.am?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
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