
<%@page import="net.board.db.BoardDTO"%>
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
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
List<BookDTO> bbList = (List<BookDTO>)request.getAttribute("bbList");
int count = ((Integer) request.getAttribute("count")).intValue();
String member_id = (String) session.getAttribute("member_id");
String pageNum = (String) request.getAttribute("pageNum");
if(pageNum == null) pageNum = "1";
int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer) request.getAttribute("startPage")).intValue();
int endPage = ((Integer) request.getAttribute("endPage")).intValue();
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
			            
					<div class=board>
					
					
						<!-- myUseBBookList.jsp : 도서 대출 목록 -->
						<h3>역대 대출 내역</h3>
						<div class="view_cnt">
							<p>Total_<span><%=count %></span></p>
						</div>
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
								   
								    <li class="my_p">사진</li>
									<li class="my_p">책 제목</li>
									<li class="my_p">대출일자</li>
									<li class="my_p">반납할 일자</li>
								</ul>
							</div>
							<%
							SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
								if(bbList.size()==0) {
									%><ul><li class="col_tit"><p>대출하신 기록이 없습니다.</p></li></ul><%
								} else {
									for(BookDTO bDTO : bbList) {
										%>
										<div class="con_lst">
										   <ul class="no_scroll" onclick="location.href='./BookInfo.bk?book_number=<%=bDTO.getBook_number() %>'">
												
												<li class="my_p"><img src="./upload/book/<%=bDTO.getBook_file()%>"width="70px" height="80px"></li>
												<li class="my_ppp"><p><%=bDTO.getBook_subject() %></p></li>
												<li class="my_pp"><span><%=date.format(bDTO.getBbook_bdate()) %></span></li>
												<li class="my_pp"><span><%=date.format(bDTO.getBbook_rdate()) %></span></li>
											</ul>
										</div>
										<%
									}
								}
							%>
					      </li>
				         </ul>


                                      <div class="paginate">
											<%
												if (pageCount < endPage) endPage = pageCount;%>
												<a href="MemberMyUseBorrowBookList.me?pageNum=1">[처음]</a>

												<%if (startPage > pageBlock) { %><a href="MemberMyUseBorrowBookList.me?pageNum=<%=startPage - pageBlock%>"
												class="prev"><span class="hide">이전 페이지</span></a>
											<% }
												for (int p = startPage; p <= endPage; p++) {
													if (p == Integer.parseInt(pageNum)) {%>&nbsp;<strong title="현재 페이지" id="currentPage"><%=p%></strong> &nbsp;<% } 
													else {%> &nbsp;<a href="MemberMyUseBorrowBookList.me?pageNum=<%=p%>"><%=p%></a> &nbsp;<% }
												}
												if (endPage < pageCount) {%><a href="MemberMyUseBorrowBookList.me?pageNum=<%=startPage + pageBlock%>"
												class="next"><span class="hide">다음 페이지</span></a>
											<% } %>
					                           <a href="MemberMyUseBorrowBookList.me?pageNum=<%=pageCount %>">[끝]</a>
					                  </div>
					
					
			             <div class="btn_btm_center">
					
						<input type="button"  class="btn_type5" value="목록" onclick="location.href='./MemberUseIndex.me'">
						
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