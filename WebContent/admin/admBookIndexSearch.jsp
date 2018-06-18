<%@page import="java.text.SimpleDateFormat"%>
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
<body>
	<%
		String member_id = (String)session.getAttribute("member_id");
		if ((member_id == null) || !(member_id.equals("admin"))) {
			response.sendRedirect("./Main.fp");
		}
	%>
<%
request.setCharacterEncoding("utf-8");
//count, pageNum, boardList, pageCount, pageBlock, startPage, endPage 가져오기
String search1 = (String)request.getAttribute("search1");
String search2 = (String)request.getAttribute("search2");
String search3 = (String)request.getAttribute("search3");
String category1 = (String)request.getAttribute("category1");
String category2 = (String)request.getAttribute("category2");
String category3 = (String)request.getAttribute("category3");
String opt1 = (String)request.getAttribute("opt1");
String opt2 = (String)request.getAttribute("opt2");
String pubDate = (String)request.getAttribute("pubDate");
int count = ((Integer)request.getAttribute("count")).intValue();
String pageNum = (String)request.getAttribute("pageNum");
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
List<BookDTO> booksearchList = (List<BookDTO>)request.getAttribute("booksearchList");
%>
		<div class="wrapper">
		<!-- 본문 컨테이너 -->
		
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
						
				<div id="adm_for_book_div">
											<form action="./AdminBookSearch.am" method="get" name="searchFr" id="SearchForm">
												<div id="adm_book_field">
													<h1>통합검색</h1>
													<div class="DIV_CON_LST">
														<div id="adm_book_select_box">
															<select name="category1" id="adm_book_select1">
																<option value="all">전체</option>
																<option value="book_subject">제목</option>
																<option value="book_author">저자</option>
																<option value="book_publisher">출판사</option>
																<option value="book_isbn">국제표준번호</option>
																<option value="book_classification">분류기호</option>
															</select> <input type="text" id="search1" name="search1"
																placeholder="입력하세요" class="adm_inp_search"><input
																type="button" value="검색" class="adm_btn_search">
															<select name="opt1" id="adm_book_select2">
																<option value="and">and</option>
																<option value="or">or</option>
															</select> <a href="#"><span class="adm_btn_type3">▼</span></a>
														</div>
														<div class="adm_media_bye">
															<div id="adm_book_select_box">
																<select name="category2" id="adm_book_select1">
																	<option value="book_subject">제목</option>
																	<option value="book_author">저자</option>
																	<option value="book_publisher">출판사</option>
																	<option value="book_isbn">국제표준번호</option>
																	<option value="book_classification">분류기호</option>
																</select> <input type="text" id="search2" name="search2"
																	placeholder="입력하세요" class="adm_inp_search"><input
																	type="button" value="검색" class="adm_btn_search">
																<select name="opt2" id="adm_book_select2">
																	<option value="and">and</option>
																	<option value="or">or</option>
																</select>
															</div>

															<div id="adm_book_select_box">
																<select name="category3" id="adm_book_select1">
																	<option value="book_subject">제목</option>
																	<option value="book_author">저자</option>
																	<option value="book_publisher">출판사</option>
																	<option value="book_isbn">국제표준번호</option>
																	<option value="book_classification">분류기호</option>
																</select> <input type="text" id="search3" name="search3"
																	placeholder="입력하세요" class="adm_inp_search"><input
																	type="button" value="검색" class="adm_btn_search">
															</div>

															<div id="adm_date_box" >
																<p>&nbsp;&nbsp;발행일</p>
																<select name="pubDate" id="adm_book_date">
																	<option value="all">전체</option>
																	<option value="1">최근 1년</option>
																	<option value="2">최근 2년</option>
																	<option value="5">최근 5년</option>
																	<option value="10">최근 10년</option>
																	<option value="20">최근 20년</option>
																</select>
															</div>
														</div>
														<div id="adm_sort_submit">
															<input type=submit class="adm_btn_sr" value="상세검색" >
															<input type="reset" class="adm_btn_rs" value="입력 초기화">
														</div>
													</div>
												</div>
											</form>
									</div>

				<%SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd"); %>					
						<div class="adms">	
							<h3>&lt; 통합도서관리시스템 &gt;</h3>	
							
<div class="AdAjaxTest">											
							<p>
								Total_<span><%=count%></span>
							</p>
							
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
							<ul class="no_scroll title_t">
								<li class="adm_num">번호</li>
								<li class="adm_pic">사진</li>
								<li class="adm_subs">제목</li>
								<li class="adm_name">저자</li>
								<li class="adm_ten">출판사</li>
								<li class="adm_ten">상세정보</li>
							</ul>
							</div>
						<%
							if (count == 0) {
						%><ul>
							<li class="col_tit"><p>책 목록이 없습니다</p></li>
						</ul>
						<%
							} else {
								for (int i=0; i<booksearchList.size(); i++){
									BookDTO booksearchLists = booksearchList.get(i);
						%>
						<div class="con_lst">
							<ul class="no_scroll" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksearchLists.getBook_number()%>'">
								<li class="adm_num" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksearchLists.getBook_number()%>'"><%=booksearchLists.getBook_number()%></li>
								<li class="adm_pic" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksearchLists.getBook_number()%>'"><img src="./upload/book/<%=booksearchLists.getBook_file()%>" width="70px" height="80px"></li>
								<li class="adm_subs2" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksearchLists.getBook_number()%>'"><%=booksearchLists.getBook_subject()%></li>
								<li class="adm_name over_dot" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksearchLists.getBook_number()%>'"><%=booksearchLists.getBook_author()%></li>
								<li class="adm_ten over_dot" id="adm_book_high"><%=booksearchLists.getBook_publisher()%></li>
								<li class="adm_ten"><input type="button" id="<%=i %>" value="보기" class ="mod_btn info" ></li>
							</ul>
							
							<div id="Borrow<%=i%>">
								<div class="join_form">
								<h3>시설관리</h3>
								<ul>
									<li class="row">
										<ul class="row_sub">
										<li class="title">대출현황</li>
										<li class="inp_form"><%if (Integer.parseInt(booksearchLists.getBbook_bstate())==0){ %> 대출가능 <% }
											else { %><%=date.format(booksearchLists.getBbook_bdate())%>~<%=date.format(booksearchLists.getBbook_rdate())%> 대출중
											<%}%></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
										<li class="title">예약상태</li>
										<li class="inp_form"><%
									if(Integer.parseInt(booksearchLists.getRbook_check())>=3)	out.print("예약 불가");
									else out.print("예약 가능");
								%></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
										<li class="title">책상태</li>
										<li class="inp_form"><%if (booksearchLists.getDbook_state().equals("0")) %> 상태양호 <%
									else { %> <%=booksearchLists.getDbook_state()%> <%}%></li>
										</ul>
									</li>
								</ul>
								<div class="btn_btm_center" >
									<ul>
										<li class="adm_btn_cancle">
										<input type="button" value="나가기" id="<%=i %>" class ="btn_type4 BTN_CLOSE">
										</li>
									</ul>
								</div>
							</div>
							</div>
							
						</div><%}
						}%>
							</li>
						</ul>
								
				<!-- 버튼 css 부분 -->	
				<div class="btn_btm_center" >
					<ul>
						<li class="adm_btn_cancle">
							<input type="button" value="입고하기" onclick="bookwrite();" class ="btn_type4 BTN_IF_LIST b">
						</li>
						<li class="adm_btn__left">
							<input type="button" value="희망도서목록" onclick="hbooklist();" class ="btn_type4 BTN_IF_LIST">
						</li>
					</ul>
						</div>	
				
				<!-- 버튼 css 부분 -->	
						<div class="paginate">
						
						<a href="./AdminBookSearch.am?pageNum=1&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>" class="prev2"><span class="hide">페이지처음</span></a>
						<%
						if(pageCount < endPage)	endPage = pageCount;
						if(startPage > pageBlock)	{ %><a href="./AdminBookSearch.am?pageNum=<%=startPage - pageBlock%>&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>" class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong id="currentPage" title="현재 페이지"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="./AdminBookSearch.am?pageNum=<%=p%>&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){	%><a href="./AdminBookSearch.am?pageNum=<%=startPage+pageBlock%>&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>" class="next"><span class="hide">다음 페이지</span></a><% }
						%>
						<a href="./AdminBookSearch.am?pageNum=<%=pageCount%>&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>" class="next2"><span class="hide">페이지끝</span></a>
						 </div>
</div>

<script type="text/javascript">
			// JQUERY★
			function bookwrite(){
				location.href="./AdminBookWrite.am";
			}
			
			function hbooklist(){
				location.href="./AdminHBookList.am";
			}



$(document).ready(function(){
	var bookListSize = "${booksearchList.size()}";
				//admin 대출,예약,책상태 
				for(var i=0;i<bookListSize;i++){
					$('#Borrow' + i).dialog({ 
						autoOpen: false, 
						width: 400, 
						modal: true, 
					});
				}
				
				$(".info").click(function() {
					var listvalue = $(this).attr("id");
					$('#Borrow' + listvalue).dialog("open");
				});
				
				$(".BTN_CLOSE").click(function() {
					var listvalue = $(this).attr("id");
					$('#Borrow' + listvalue).dialog("close");
				});
});
</script>
					</div>
					</div>
			</article>

		</section>

		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>