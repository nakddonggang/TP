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
		var sort = $("select option:selected").val();	
		if(vv!=""){
			self("about:blank").location.href=sort;
		}
	})
	
});
</script>
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
							<h2>통합도서관리시스템</h2>
							<p>
								Total_<span><%=count%></span>
							</p>
						<div class="adm">			
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
							<ul class="no_scroll title_t">
								<li class="adm_col_rc">고유번호</li>
								<li class="adm_col_date">사진</li>
								<li class="adm_col_type">제목</li>
								<li class="adm_col_type">저자</li>
								<li class="adm_col_type">출판사</li>
								<li class="adm_col_rc">도서상태</li>
								<li class="adm_col_type">반납상태</li>
								<li class="adm_col_rc">예약일자</li>
								<li class="adm_col_rc">예약현황</li>
							</ul>
							</div>
						<%
							if (count == 0) {
						%><ul>
							<li class="col_tit"><p>책 목록이 없습니다</p></li>
						</ul>
						<%
							} else {
								for (BookDTO booksortLists  : booksortList){
						%>
						<div class="con_lst">
							<ul class="no_scroll" onclick="location.href='./AdminBookInfo.am?book_number=<%=booksortLists.getBook_number()%>'">
								<li class="adm_col_rc"><%=booksortLists.getBook_number()%></li>
								<li class="adm_col_date"><img src="./upload/<%=booksortLists.getBook_file()%>" width="70px" height="60px"></li>
								<li class="adm_col_type"><%=booksortLists.getBook_subject()%></li>
								<li class="adm_col_type"><%=booksortLists.getBook_author()%></li>
								<li class="adm_col_type"><%=booksortLists.getBook_publisher()%></li>
								<li class="adm_col_rc"><%=booksortLists.getDbook_state()%></li>
								<li class="adm_col_type"><%=booksortLists.getBbook_bstate()%></li>
								<li class="adm_col_rc"><%=booksortLists.getRbook_date()%></li>
								<li class="adm_col_rc"><%=booksortLists.getRbook_check()%></li>
							</ul>
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

</body>
</html>