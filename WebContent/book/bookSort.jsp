<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="net.book.db.BookDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	var book_img=<%=request.getParameter("view")%>;
	if (book_img==null){	book_img="1";		} 
	if (book_img==0){
		$('#book_pic_div').show();
		$('#book_cont_div').hide();
	} else if (book_img==1){
		$('#book_pic_div').hide();
		$('#book_cont_div').show();
	}
	
	$('#adm_select_box3 > :input').click(function(){
		book_img=$(this).index();
			if (book_img==0){
				$('#book_pic_div').show();
				$('#book_cont_div').hide();
			} else if (book_img==1){
				$('#book_pic_div').hide();
				$('#book_cont_div').show();
			}
	});
	
			$('#SearchForm').submit(
					function() {
						if ($('#search1').val() == ""
								&& $('#search2').val() == ""
								&& $('#search3').val() == "") {
							alert("검색어를 입력해주세요");
							$('#search1').focus();
							return false;
						} else {
						}
				});

			$('#book_sort').change(function() {
				var sort = $("#book_sort > option:selected").val();
				if (sort != "") {
					$(location).attr('href', sort);
				} else {
				}
			});

			$('#book_pic_hv').hover(function() {
				$('.book_lst > li').mouseenter(function() {
					$("dl", this).addClass("bil_on");
				}).mouseleave(function() {
					$("dl", this).removeClass("bil_on");
				});

				$('.book_lst > li').focusin(function() {
					$("dl", this).addClass("bil_on");
				}).focusout(function() {
					$("dl", this).removeClass("bil_on");
				});
			});
		});

$(document).ready(function() {
$('#basket_Fr').submit(function(){
		var con = confirm("책바구니에 담으시겠습니까?");
		if (con==true){
			$("#basket_Fr").submit;
		} else { return false; }
});
});

$(document).ready(function(){

});
</script>

</head>
<body>
	<%
		String member_id = (String)session.getAttribute("member_id");
		request.setCharacterEncoding("utf-8");
		//count, pageNum, boardList, pageCount, pageBlock, startPage, endPage 가져오기
		String sort = (String) request.getAttribute("sort");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
		List<BookDTO> booksortList = (List<BookDTO>) request.getAttribute("booksortList");
		
		String view = request.getParameter("view");
		if(view==null) view = "1";
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
				<article class="submenu section SECTION">
					<div class="slide DIV_SLIDE">
						<div class="intro1">
							<div class="slide_con">
								<div class="box_thm">
									<div id="book_divv" >
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="for_book_div">
											<form action="./BookSearch.bk" method="get" name="searchFr"
												id="SearchForm">
												<div id="book_field">
													<h1>통합검색</h1>
													<div class="DIV_CON_LST">
														<div id="book_select_box">
															<select name="category1" id="book_select1">
																<option value="all">전체</option>
																<option value="book_subject">제목</option>
																<option value="book_author">저자</option>
																<option value="book_publisher">출판사</option>
																<option value="book_isbn">국제표준번호</option>
																<option value="book_classification">분류기호</option>
															</select> <input type="text" id="search1" name="search1"
																placeholder="입력하세요" class="book_inp_search"><input
																type="button" value="검색" class="book_btn_search">
															<select name="opt1" id="book_select2">
																<option value="and">and</option>
																<option value="or">or</option>
															</select> <a href="#"><span class="book_btn_type3">▼</span></a>
														</div>
														<div class="book_media_bye">
															<div id="book_select_box">
																<select name="category2" id="book_select1">
																	<option value="book_subject">제목</option>
																	<option value="book_author">저자</option>
																	<option value="book_publisher">출판사</option>
																	<option value="book_isbn">국제표준번호</option>
																	<option value="book_classification">분류기호</option>
																</select> <input type="text" id="search2" name="search2"
																	placeholder="입력하세요" class="book_inp_search"><input
																	type="button" value="검색" class="book_btn_search">
																<select name="opt2" id="book_select2">
																	<option value="and">and</option>
																	<option value="or">or</option>
																</select>
															</div>

															<div id="book_select_box">
																<select name="category3" id="book_select1">
																	<option value="book_subject">제목</option>
																	<option value="book_author">저자</option>
																	<option value="book_publisher">출판사</option>
																	<option value="book_isbn">국제표준번호</option>
																	<option value="book_classification">분류기호</option>
																</select> <input type="text" id="search3" name="search3"
																	placeholder="입력하세요" class="book_inp_search"><input
																	type="button" value="검색" class="book_btn_search">
															</div>

															<div id="book_date_box" >
																<p>&nbsp;&nbsp;발행일</p>
																<select name="pubDate" id="book_date">
																	<option value="all">전체</option>
																	<option value="1">최근 1년</option>
																	<option value="2">최근 2년</option>
																	<option value="5">최근 5년</option>
																	<option value="10">최근 10년</option>
																	<option value="20">최근 20년</option>
																</select>
															</div>
														</div>
														<div id="book_sort_submit">
															<input type="submit" class="book_btn_type4" value="상세검색">
															<input type="reset" class="book_btn_type5" value="입력 초기화">
														</div>
													</div>
												</div>
											</form>
										</div>
				</article>
				<!-- //서브메뉴 -->

				<%SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd"); %>
				<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
					<jsp:include page="../include/topbar.jsp" />
					<div class="content">

						<div class="adms">
							<h3>&lt; 혜윰나래 도서관 통합검색 &gt;</h3>
							<p>
								Total_<span><%=count%></span>
							</p>

							<div id="adm_select_box3">
								<input type="button" value="갤러리" id="book_pic_btn"  class="book_btn">
								<input type="button" value="게시판" id="book_cont_btn"  class="book_btn" >
								<select name="sort" id="book_sort">
									<option value="" <%if (sort.equals("")) {%> selected <%}%>>정렬</option>
									<option value="./BookSort.bk?view=<%=view%>&sort=book_subject"
										<%if (sort.equals("book_subject")) {%> selected <%}%>>제목순</option>
									<option value="./BookSort.bk?view=<%=view%>&sort=book_author"
										<%if (sort.equals("book_author")) {%> selected <%}%>>저자순</option>
									<option value="./BookSort.bk?view=<%=view%>&sort=book_number"
										<%if (sort.equals("book_number")) {%> selected <%}%>>인기순</option>
									<option value="./BookSort.bk?view=<%=view%>&sort=book_pubDate"
										<%if (sort.equals("book_pubDate")) {%> selected <%}%>>신작순</option>
									<option value="./BookSort.bk?view=<%=view%>&sort=book_date"
										<%if (sort.equals("book_date")) {%> selected <%}%>>입고순</option>
								</select>
							</div>

							<!-- ★게시판으로 보여지는 통합검색 -->
						<form action="./MemberBasketAdd.me" method="post" id="basket_Fr">
							<ul class="brd_txt_lst" id="book_cont_div">
								<!-- 글목록 -->
								<li class="view_lst">
									<div class="con_lst">
										<ul class="no_scroll title_t">
											<li class="adm_col_rrc">목록</li>
											<li class="adm_col_date">사진</li>
											<li class="adm_col_sub">제목</li>
											<li class="adm_col_type">저자</li>
											<li class="adm_col_date">출판사</li>
											<li class="adm_col_date">대출현황</li>
											<%if(member_id!=null){ %>
											<li class="adm_col_rc">대출/예약 신청</li><%}%>
										</ul>
									</div> <%
 	if (count == 0) {
 %><ul>
										<li class="col_tit"><p>책 목록이 없습니다</p></li>
									</ul> <%
 	} else {
 		for (BookDTO booksortLists : booksortList) {
 %>
									<div class="con_lst">
										<ul class="no_scroll">
											<li class="adm_col_rrc" id="adm_book_high"><input
												type="checkbox" name="basket_check"  class="bncheck" 
												value="<%=booksortLists.getBook_number()%>" ></li>
											<li class="adm_col_date" id="adm_book_high"
												onclick="location.href='./BookInfo.bk?book_number=<%=booksortLists.getBook_number()%>'"><img
												src="./upload/book/<%=booksortLists.getBook_file()%>"
												width="70px" height="80px"></li>
											<li class="adm_col_sub" id="adm_book_high"
												onclick="location.href='./BookInfo.bk?book_number=<%=booksortLists.getBook_number()%>'"><%=booksortLists.getBook_subject()%></li>
											<li class="adm_col_type" id="adm_book_high"
												onclick="location.href='./BookInfo.bk?book_number=<%=booksortLists.getBook_number()%>'"><%=booksortLists.getBook_author()%></li>
											<li class="adm_col_date" id="adm_book_high"
												onclick="location.href='./BookInfo.bk?book_number=<%=booksortLists.getBook_number()%>'"><%=booksortLists.getBook_publisher()%></li>
											<li class="adm_col_date"  id="adm_book_high" onclick="location.href='./BookInfo.bk?book_number=<%=booksortLists.getBook_number()%>'">
											<%if (Integer.parseInt(booksortLists.getBbook_bstate())==0){ %> 대출가능 <% }
											else { %><%=date.format(booksortLists.getBbook_bdate())%>~<%=date.format(booksortLists.getBbook_rdate())%> 대출중
											<%}%>
											</li>
											<%if(member_id!=null){ %>
											<li class="adm_col_type"  id="adm_book_high">
												<%if (Integer.parseInt(booksortLists.getBbook_bstate())==0){ %>
													<input type="button" rel="<%=booksortLists.getBook_number()%>" class="bbutton" value="대출신청">
												<%} else {
													if (Integer.parseInt(booksortLists.getRbook_check())>=3) out.print("예약불가");
													else %> <input type="button" rel="<%=booksortLists.getBook_number()%>" class="rbutton" value="대출예약">
											<%}%>
											</li><%}%>
										</ul>
									</div>
									<%}
 								}%>
								</li>
							</ul>
							<!-- ★게시판으로 보여지는 통합검색 -->

							<!-- ★갤러리로 보여지는 통합검색 -->
							<ul class="book_lst" id="book_pic_div">
									<%
										if (count == 0) {
									%>
									<li>
									<dl class="book_info_layer">
										<dt>책 목록이 없습니다</dt>
										<dd></dd>
									</dl>
									</li> <%
									 	} else {
 		for (BookDTO booksortLists : booksortList) {
			 %>
				<li><a
					href="./BookInfo.bk?book_number=<%=booksortLists.getBook_number()%>">
						<img src="./upload/book/<%=booksortLists.getBook_file()%>" class="book_lst_img">
						<span id="bk_li_subs"><%=booksortLists.getBook_subject()%></span>
					<dl class="book_info_layer">
						<dt>
							<span><%=booksortLists.getBook_subject()%></span>
						</dt>
						<dd>
							<dl>
								<dt>저자</dt>
								<dd><%=booksortLists.getBook_author()%>>
								</dd>
								<dt>출판사</dt>
								<dd><%=booksortLists.getBook_publisher()%></dd>
								<dt>출판년도</dt>
								<dd><%=booksortLists.getBook_pubDate()%></dd>
								<dt>반납상태</dt>
								<dd><%=booksortLists.getBbook_bstate()%></dd>
							</dl>
						</dd>
					</dl>
					</a>
					</li>
				</a><%}
				}%>
	</ul>
							<!-- ★갤러리로 보여지는 통합검색 -->

							<%if(member_id!=null){ %>
							<div class="btn_btm_center">
								<ul>
									<li><input type="submit" value="책바구니" id="basket_Fr_btn"
										class="btn_type4 BTN_IF_LIST"></li>
								</ul>
							</div>
							<%}%>
						</form>

							<!-- 버튼 css 부분 -->
							<div class="paginate">
						
						<a href="./BookSort.bk?sort=<%=sort%>&pageNum=1&view=<%=view%>"><span>&lt;&lt;&nbsp;</span></a>
						<%
						if(pageCount < endPage)	endPage = pageCount;
						if(startPage > pageBlock)	{ %><a href="./BookSort.bk?sort=<%=sort%>&pageNum=<%=startPage - pageBlock%>&view=<%=view%>" class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong id="currentPage" title="현재 페이지"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="./BookSort.bk?sort=<%=sort%>&pageNum=<%=p%>&view=<%=view%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){	%><a href="./BookSort.bk?sort=<%=sort%>&pageNum=<%=startPage+pageBlock%>&view=<%=view%>" class="next"><span class="hide">다음 페이지</span></a><% }
						%>
						<a href="./BookSort.bk?sort=<%=sort%>&pageNum=<%=pageCount%>&view=<%=view%>"><span>&nbsp;&gt;&gt;</span></a>
						 </div>


						</div>
					</div>
				</article>

			</section>

		</div>
		<!-- //본문 컨테이너 -->
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$(".bbutton").click(function() {
				var book_number = $(this).attr("rel");
				var bbook = confirm("대출신청을 하시겠습니까?");
				if (bbook == true) {
					var url = book_number;
					$(location).attr('href', './MemberBasketAdd.me?book_number' + url);
					return false;
				} else {
				}
			});
		});
		
		$(document).ready(function() {
			$('.rbutton').click(function() {
				var book_number = $(this).attr("rel");
					var rbook = confirm("대출예약 하시겠습니까?");
					if (rbook == true) {
						var url = book_number;
						$(location).attr('href', './MemberBasketResAction.me?book_number' + url);
						return false;
					} else {}
			});
		});

</script>
</body>
</html>