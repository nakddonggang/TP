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
<!-- 수정덜함수정덜함 -->
<style>

</style>

<script>
	$(document).ready(function(){
		$("#book_pic_hv").hover(function(){
			$(".book_info_layer").css('display', 'block');
		});
	
		$("#book_pic_btn").click(function(){
			$("#book_pic_div").show();
			$("#book_cont_div").hide();
		});
	
		$("#book_pic_btn").click(function(){
			$("book_pic_div").hide();
			$("book_cont_div").show();
		});
	});
</script>
<!-- 수정덜함수정덜함 -->

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
					<div class="content">
					
						<div class="adms" >
							<h1 class="adm_h_1">&lt; 혜윰나래 도서관 통합검색 &gt;</h1>
							<p>
								Total_<span><%=count%></span>	
							</p>	
							
							<div id="adm_select_box3">
									<select name="sort" id="book_sort">
											<option value="" selected="selected">정렬</option>
											<option value="./BookSort.bk?sort=book_subject">제목순</option>
											<option value="./BookSort.bk?sort=book_author">저자순</option>
											<option value="./BookSort.bk?sort=book_number">인기순</option>
											<option value="./BookSort.bk?sort=book_pubDate">신작순</option>
											<option value="./BookSort.bk?sort=book_date">입고순</option>
									</select>
							</div>
							
			<!-- 시험용 버튼 -->
			<input type="button" value="갤러리" id="book_pic_btn"><input type="button" value="게시판" id="book_cont_btn">
			
			<!-- ★갤러리로 보여지는 통합검색 -->
					<ul class="brd_txt_lst" id="book_pic_div">
							<li class="view_lst">
						<% if (count == 0) { %>
						<ul>
							<li class="col_tit"><p>책 목록이 없습니다</p></li>
						</ul> <%
						} else { for (BookDTO bookLists  : bookList){ %>
						<%SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd"); %>
						<div class="con_lst">
							<ul class="no_scroll" onclick="location.href='./BookInfo.bk?book_number=<%=bookLists.getBook_number()%>'">
								<li id="book_pic_hv"><img src="./upload/<%=bookLists.getBook_file()%>">
									<dl class="book_info_layer">
										<dt><span><%=bookLists.getBook_subject()%></span></dt>
										<dd>
										<dl class=""> 
											<dt>저자</dt><dd><%=bookLists.getBook_author()%></dd>                                                                   			        
											<dt>출판사</dt><dd><%=bookLists.getBook_publisher()%></dd>                                                          			        
											<dt>출판년도</dt><dd><%=date.format(bookLists.getBook_pubDate())%></dd>                                                        			        
											<dt>반납상태</dt><dd><%=bookLists.getBbook_bstate()%></dd>																   			        
										</dl>                                                                                      		   
										</dd>                                                                                          		   
									</dl>

								</li>
							</ul>
						</div> <%}
						}%>
							</li>
						</ul>
					<!-- ★갤러리로 보여지는 통합검색 -->
			
					<!-- ★게시판으로 보여지는 통합검색 -->
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
							<ul class="no_scroll title_t">
								<li class="adm_col_rc">번호</li>
								<li class="adm_col_type">사진</li>
								<li class="adm_col_subs">제목</li>
								<li class="adm_col_date">저자</li>
								<li class="adm_col_type">출판사</li>
								<li class="adm_col_rc">반납상태</li>
								<li class="adm_col_rc">예약상태</li>
								<li class="adm_col_rc">예약일자</li>
							</ul>
							</div>
						<%
							if (count == 0) {
						%><ul>
							<li class="col_tit"><p>책 목록이 없습니다</p></li>
						</ul>
						<%
							} else {
								for (BookDTO bookLists  : bookList){
						%>
						<div class="con_lst">
							<ul class="no_scroll" onclick="location.href='./BookInfo.bk?book_number=<%=bookLists.getBook_number()%>'">
								<li class="adm_col_rc" id="adm_book_high"><%=bookLists.getBook_number()%></li>
								<li class="adm_col_type" id="adm_book_high"><img src="./upload/<%=bookLists.getBook_file()%>" width="70px" height="80px"></li>
								<li class="adm_col_subs" id="adm_book_high"><%=bookLists.getBook_subject()%></li>
								<li class="adm_col_date" id="adm_book_high"><%=bookLists.getBook_author()%></li>
								<li class="adm_col_type" id="adm_book_high"><%=bookLists.getBook_publisher()%></li>
								<li class="adm_col_rc" id="adm_book_high"><%=bookLists.getBbook_bstate()%></li>
								<li class="adm_col_rc" id="adm_book_high"><%=bookLists.getRbook_check()%></li>
								<li class="adm_col_rc" id="adm_book_high"><%=bookLists.getRbook_date()%></li>
							</ul>
						</div><%}
						}%>
							</li>
						</ul>
								
				<!-- 버튼 css 부분 -->	
				<div class="btn_btm_center" >			
				<% // count = 전체 글의 개수
				if (count != 0) {
					// 이전페이지 // if (startPage와 pageBlock을 비교)
					if (startPage > pageBlock) {
						%><a href="./BookIndex.bk?pageNum=<%=startPage - pageBlock%>">[이전]</a><%
					}
					// 1~10		11~20		21~30
					for (int i = startPage; i <= endPage; i++) {%>
					<a href="./BookIndex.bk?pageNum=<%=i%>">[<%=i%>]</a><%		
					}
					// 다음 // if (endPage와 pageCount를 비교)
					if (endPage<pageCount){%>
						<a href="./BookIndex.bk?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
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