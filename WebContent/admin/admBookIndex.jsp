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
<script type="text/javascript">
	$(document).ready(function(){
		$('#SearchForm').submit(
			function(){
				if($('#search1').val()==""&&$('#search2').val()==""&&$('#search3').val()==""){
				alert ("검색어를 입력해주세요");
				$('#search1').focus();
				return false;
				} else { }
		});
	});
</script>
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
						<div class='join_form adminfo_join_form' >
							<h2>통합도서 관리 시스템</h2>
							<p>
								Total_<span><%=count%></span>
							</p>
						<div class="adm">
									
					<div style="border:2px solid red;">
					<form action="./AdminBookSearch.am" method="get" id="SearchForm">
						<fieldset style="border: 1px solid;">
							<legend>통합검색</legend>
							<select name="category1">
							<option value="all">전체</option>
							<option value="book_subject">제목</option>
							<option value="book_author">저자</option>
							<option value="book_publisher">출판사</option>
							<option value="book_isbn">국제표준번호</option>
							<option value="book_classification">분류기호</option>				
							</select>
								<input type="text" id="search1" name="search1" placeholder="입력하세요">
					
							<select name="opt1">
								<option value="and">and</option>
								<option value="or">or</option>
							</select><br>
					
							<select name="category2">
							<option value="book_subject">제목</option>
							<option value="book_author">저자</option>
							<option value="book_publisher">출판사</option>
							<option value="book_isbn">국제표준번호</option>
							<option value="book_classification">분류기호</option>				
							</select>
					 			<input type="text" id="search2" name="search2" placeholder="입력하세요">
					 			
							<select name="opt2">
								<option value="and">and</option>
								<option value="or">or</option>
							</select><br>
					
							<select name="category3">
							<option value="book_subject">제목</option>
							<option value="book_author">저자</option>
							<option value="book_publisher">출판사</option>
							<option value="book_isbn">국제표준번호</option>
							<option value="book_classification">분류기호</option>				
							</select>
					 		<input type="text" id="search3" name="search3" placeholder="입력하세요"><br> 		
						</fieldset>	
					
						<fieldset>
							<legend>발행년</legend>
							<select name="pubDate">
							<option value="all">전체</option>
							<option value="1">최근 1년</option>
							<option value="2">최근 2년</option>
							<option value="5">최근 5년</option>
							<option value="10">최근 10년</option>
							<option value="20">최근 20년</option>				
							</select>
						</fieldset>
					
							<input type="submit" value="상세검색">
							<input type="reset" value="입력 초기화">
					</form>
					</div>
					
					<div>
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
					</div>
					
					<%if(count==0){ out.print("책 목록이 없습니다"); } else {%>
					<ul class="brd_txt_lst" id="adm_brd_txt_lst">
						<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
									<li class="col_rc">고유번호</li>
									<li class="col_rc">사진</li>
									<li class="adm_col_sub">제목</li>
									<li class="adm_col_date">저자</li>
									<li class="adm_col_date">출판사</li>
									<li class="col_rc">도서상태</li> <!-- dbook -->
									<li class="adm_col_rc">반납상태</li> <!-- bbook -->
									<li class="col_rc">예약일자</li> <!-- rbook -->
									<li class="adm_col_rc">예약현황</li> <!-- rbook -->
								</ul>
							</div>
						<% for (BookDTO bookLists : bookList) { %>
							<div class="con_lst">
								<ul class="no_scroll">
									<li class="col_rc"><%=bookLists.getBook_number()%></li>
									<li class="col_type" onclick="location.href='./AdminBookInfo.am?book_number=<%=bookLists.getBook_number()%>'"><img src="./upload/<%=bookLists.getBook_file()%>" width="80px" height="70px"></li>
									<li class="adm_col_sub"><%=bookLists.getBook_subject()%></li>
									<li class="col_rc"><%=bookLists.getBook_author()%></li>
									<li class="col_rc"><%=bookLists.getBook_publisher()%></li>
									<li class="col_rc"><%=bookLists.getDbook_state()%></li>
									<li class="adm_col_rc"><%=bookLists.getBbook_bstate()%></li>
									<li class="col_rc"><%=bookLists.getRbook_date()%></li>
									<li class="adm_col_rc"><%=bookLists.getRbook_check()%></li>
								</ul>
								</div><%}%>
						</li>
					</ul>
					<%}%>
								
				
				<!-- 버튼 css 부분 -->	
				<div class="btn_btm_center" >
					<ul>
						<li class="adm_btn_cancle">
							<input type="button" value="입고하기" onclick="location.href='./AdminBookWrite.am'" class ="btn_type4 BTN_IF_LIST b">
						</li>
						<li class="adm_btn__left">
							<input type="button" value="예약관리" onclick="location.href='./AdminBookRes.am'" class ="btn_type4 BTN_IF_LIST">
						</li>
						<li class="adm_btn__left">
							<input type="button" value="희망도서목록" onclick="location.href='./AdminHBookList.am'" class ="btn_type4 BTN_IF_LIST">
						</li>
					</ul>
					
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