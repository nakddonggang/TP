<%@page import="net.book.db.BookDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../css/jquery.fullpage" rel="stylesheet" type="text/css">
<link href="../css/import.css?ver=1" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery.bxslider.min.js"></script>
<script src="../js/jquery.fullpage.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/fullpage.js"></script>
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
List<BookDTO> bookList = (List<BookDTO>)request.getAttribute("bookList");
%>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- container -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">
				<h2 class="hide"></h2>
				<!-- left_content -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //left_content -->
				<article class="rgt_con section SECTION">
					<!-- 본문 공간 -->
					<h2>입고 목록 [<%=count%>]</h2>
					<%if(count==0){ out.print("책 목록이 없습니다"); } %>
					<table border="1">
						<tr>
							<th>고유번호</th>
							<th>표제</th>
							<th>저자</th>
							<th>발행처</th>
							<th>발행일</th>
							<th>형태</th>
							<th>주기</th>
							<th>국제표준번호</th>
							<th>분류기호</th>
							<th>입고일</th>
						</tr>
						<%
							for (BookDTO bookLists : bookList) {%>
						<tr>
							<td><%=bookLists.getBook_number()%></td>
							<td><%=bookLists.getBook_subject()%></td>
							<td><%=bookLists.getBook_author()%></td>
							<td><%=bookLists.getBook_publisher()%></td>
							<td><%=bookLists.getBook_pubDate()%></td>
							<td><%=bookLists.getBook_form()%></td>
							<td><%=bookLists.getBook_notation()%></td>
							<td><%=bookLists.getBook_isbn()%></td>		
							<td><%=bookLists.getBook_classification()%></td>		
							<td><%=bookLists.getBook_date()%></td>					
						</tr> <%
							} %>
					</table>
					
					<% // count = 전체 글의 개수
						if (count != 0) {
							// 이전페이지 // if (startPage와 pageBlock을 비교)
							if (startPage > pageBlock) {
					%><a href="./AdminBookIO.am?pageNum=<%=startPage - pageBlock%>">[이전]</a><%
						}

							// 1~10		11~20		21~30
							for (int i = startPage; i <= endPage; i++) {%>
							<a href="./AdminBookIO.am?pageNum=<%=i%>">[<%=i%>]</a><%		
							}
	
							// 다음 // if (endPage와 pageCount를 비교)
							if (endPage<pageCount){%>
							<a href="./AdminBookIO.am?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
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