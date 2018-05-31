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
	
	$('#book_sort').change(function(){
		var sort = $("#book_sort > option:selected").val();	
		if(sort!=""){
			$(location).attr('href', sort);
		} else { }
	});
	
});
</script>
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
						
<form action="./AdminBookSearch.am" method="get" id="SearchForm">
		<fieldset id="adm_field">
			<legend>&nbsp;통합검색&nbsp;</legend>
	
		<div id="admin_select_box">
				<select name="category1" id="admin_select1">
					<option value="all" >전체</option>
					<option value="book_subject">제목</option>
					<option value="book_author">저자</option>
					<option value="book_publisher">출판사</option>
					<option value="book_isbn">국제표준번호</option>
					<option value="book_classification">분류기호</option>
				</select>
				<input type="text" id="search1" name="search1" placeholder="입력하세요" class="adm_inp_search"><input type="button" value="검색" class="adm_btn_search" >

				<select name="opt1" id="admin_select2">
					<option value="and">and</option>
					<option value="or">or</option>
				</select>
		</div>
				
		<div id="admin_select_box" >
		<select name="category2" id="admin_select1">
					<option value="book_subject">제목</option>
					<option value="book_author">저자</option>
					<option value="book_publisher">출판사</option>
					<option value="book_isbn">국제표준번호</option>
					<option value="book_classification">분류기호</option>
		</select>
		<input type="text" id="search2" name="search2" placeholder="입력하세요" class="adm_inp_search"><input type="button" value="검색" class="adm_btn_search" >
				
				<select name="opt2" id="admin_select2">
					<option value="and">and</option>
					<option value="or">or</option>
				</select>
		</div>
				
		<div id="admin_select_box">
		<select name="category3" id="admin_select1">
					<option value="book_subject">제목</option>
					<option value="book_author">저자</option>
					<option value="book_publisher">출판사</option>
					<option value="book_isbn">국제표준번호</option>
					<option value="book_classification">분류기호</option>
				</select>
				<input type="text" id="search3" name="search3" placeholder="입력하세요" class="adm_inp_search"><input type="button" value="검색" class="adm_btn_search" >
		</div>
		<div id="admin_select_box2">
			<p>&nbsp;발행일</p>
				<select name="pubDate" id="admin_select2">
					<option value="all">전체</option>
					<option value="1">최근 1년</option>
					<option value="2">최근 2년</option>
					<option value="5">최근 5년</option>
					<option value="10">최근 10년</option>
					<option value="20">최근 20년</option>
				</select>
		</div>
		<div id="admin_sort_submit">
			<input type="submit" class="adm_btn_type4" value="상세검색">
			<input type="reset" class="adm_btn_type5" value="입력 초기화">		
		</div>
		</fieldset>
</form>
								
						<div class="adms">	
							<h4>&lt;통합도서관리시스템 &gt;</h4>
							<p>
								Total_<span><%=count%></span>
							</p>
							<div id="adm_select_box3">
									<select name="sort"  id="book_sort">
											<option value=""  <%if(sort.equals("")){%>selected<%}%>>정렬</option>
											<option value="./AdminBookSort.am?sort=book_subject" <%if(sort.equals("book_subject")) {%>selected<%}%>>제목순</option>
											<option value="./AdminBookSort.am?sort=book_author" <%if(sort.equals("book_author")) {%>selected<%}%>>저자순</option>
											<option value="./AdminBookSort.am?sort=book_number" <%if(sort.equals("book_number")) {%>selected<%}%>>인기순</option>
											<option value="./AdminBookSort.am?sort=book_pubDate" <%if(sort.equals("book_pubDate")) {%>selected<%}%>>신작순</option>
											<option value="./AdminBookSort.am?sort=book_date" <%if(sort.equals("book_date")) {%>selected<%}%>>입고순</option>
									</select>
							</div>		
							<%SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd"); %>
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
								for (int i=0; i<booksortList.size(); i++){
									BookDTO booksortLists = booksortList.get(i);
						%>
						<div class="con_lst">
							<ul class="no_scroll" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksortLists.getBook_number()%>'">
							<li class="adm_num" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksortLists.getBook_number()%>'"><%=booksortLists.getBook_number()%></li>
								<li class="adm_pic" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksortLists.getBook_number()%>'"><img src="./upload/book/<%=booksortLists.getBook_file()%>" width="70px" height="80px"></li>
								<li class="adm_subs2" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksortLists.getBook_number()%>'"><%=booksortLists.getBook_subject()%></li>
								<li class="adm_name" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksortLists.getBook_number()%>'"><%=booksortLists.getBook_author()%></li>
								<li class="adm_ten" id="adm_book_high" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksortLists.getBook_number()%>'"><%=booksortLists.getBook_publisher()%></li>
								<li class="adm_ten"><input type="button" id="<%=i %>" value="보기" class ="bbutton info" ></li>
							</ul>
							
							<div id="Borrow<%=i%>">
								<div class="join_form">
								<h3>시설관리</h3>
								<ul>
									<li class="row">
										<ul class="row_sub">
										<li class="title">대출현황</li>
										<li class="inp_form"><%if (Integer.parseInt(booksortLists.getBbook_bstate())==0){ %> 대출가능 <% }
											else { %><%=date.format(booksortLists.getBbook_bdate())%>~<%=date.format(booksortLists.getBbook_rdate())%> 대출중
											<%}%></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
										<li class="title">예약상태</li>
										<li class="inp_form"><%
									if(Integer.parseInt(booksortLists.getRbook_check())>=3)	out.print("예약 불가");
									else out.print("예약 가능");
								%></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
										<li class="title">책상태</li>
										<li class="inp_form"><%if (booksortLists.getDbook_state().equals("0")) %> 상태양호 <%
									else { %> <%=booksortLists.getDbook_state()%> <%}%></li>
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
						%><a href="./AdminBookSort.am?sort=<%=sort%>&pageNum=<%=startPage - pageBlock%>">[이전]</a><%
					}
					// 1~10		11~20		21~30
					for (int i = startPage; i <= endPage; i++) {%>
					<a href="./AdminBookSort.am?sort=<%=sort%>&pageNum=<%=i%>">[<%=i%>]</a><%		
					}
					// 다음 // if (endPage와 pageCount를 비교)
					if (endPage<pageCount){%>
						<a href="./AdminBookSort.am?sort=<%=sort%>&pageNum=<%=startPage+pageBlock%>">[다음]</a><%
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
	<script type="text/javascript">
$(window).on('load', function() {
	var bookListSize = "${booksortList.size()}";
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
</body>
</html>