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
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<!-- 수정덜함수정덜함 -->
<script type="text/javascript">
	$(document).ready(
			function() {

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

				$('#book_pic_div').css('display', 'none');
				$('#book_cont_div').css('display', 'block');
			});

	$(document).ready(function() {
		$('#book_pic_btn').click(function() {
			$('#book_pic_div').css('display', 'block');
			$('#book_cont_div').css('display', 'none');
		});
	});

	$(document).ready(function() {
		$('#book_cont_btn').click(function() {
			$('#book_pic_div').css('display', 'none');
			$('#book_cont_div').css('display', 'block');
		});
	});
</script>

</head>
<body>
	<%
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
									<div class="box_thm01 DIV_BOX_THM01" id="book_divv">
										<div id="for_book_div">
											<form action="./AdminBookSearch.am" method="get"
												id="SearchForm">
												<fieldset id="book_field">
													<legend>&nbsp;통합검색&nbsp;</legend>
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

															<div id="book_date_box">
																<p>발행일</p>
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
												</fieldset>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
				<!-- //서브메뉴 -->

				<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
					<jsp:include page="../include/topbar.jsp" />
					<div class="content">

						<div class="adms">
							<h1 class="adm_h_1">&lt; 혜윰나래 도서관 통합검색 &gt;</h1>
							<p>
								Total_<span><%=count%></span>
							</p>

							<div id="adm_select_box3">
								<select name="sort" id="book_sort">
									<option value="" <%if (sort.equals("")) {%> selected <%}%>>정렬</option>
									<option value="./BookSort.bk?sort=book_subject"
										<%if (sort.equals("book_subject")) {%> selected <%}%>>제목순</option>
									<option value="./BookSort.bk?sort=book_author"
										<%if (sort.equals("book_author")) {%> selected <%}%>>저자순</option>
									<option value="./BookSort.bk?sort=book_number"
										<%if (sort.equals("book_number")) {%> selected <%}%>>인기순</option>
									<option value="./BookSort.bk?sort=book_pubDate"
										<%if (sort.equals("book_pubDate")) {%> selected <%}%>>신작순</option>
									<option value="./BookSort.bk?sort=book_date"
										<%if (sort.equals("book_date")) {%> selected <%}%>>입고순</option>
								</select>
							</div>

							<!-- ★게시판으로 보여지는 통합검색 -->
							<ul class="brd_txt_lst" id="book_cont_div">
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
									</div> <%
 	if (count == 0) {
 %><ul>
										<li class="col_tit"><p>책 목록이 없습니다</p></li>
									</ul> <%
 	} else {
 		for (BookDTO booksortLists : booksortList) {
 %>
									<div class="con_lst">
										<ul class="no_scroll"
											onclick="location.href='./BookInfo.bk?book_number=<%=booksortLists.getBook_number()%>'">
											<li class="adm_col_rc" id="adm_book_high"><%=booksortLists.getBook_number()%></li>
											<li class="adm_col_type" id="adm_book_high"><img
												src="./upload/book/<%=booksortLists.getBook_file()%>"
												width="70px" height="80px"></li>
											<li class="adm_col_subs" id="adm_book_high"><%=booksortLists.getBook_subject()%></li>
											<li class="adm_col_date" id="adm_book_high"><%=booksortLists.getBook_author()%></li>
											<li class="adm_col_type" id="adm_book_high"><%=booksortLists.getBook_publisher()%></li>
											<li class="adm_col_rc" id="adm_book_high"><%=booksortLists.getBbook_bstate()%></li>
											<li class="adm_col_rc" id="adm_book_high"><%=booksortLists.getRbook_check()%></li>
											<li class="adm_col_rc" id="adm_book_high"><%=booksortLists.getRbook_date()%></li>
										</ul>
									</div> <%
 	}
 	}
 %>
								</li>
							</ul>
							<!-- ★게시판으로 보여지는 통합검색 -->

							<!-- ★갤러리로 보여지는 통합검색 -->
							<ul class="brd_txt_lst" id="book_pic_div">
								<li class="view_lst">
									<%
										if (count == 0) {
									%>
									<ul>
										<li class="col_tit"><p>책 목록이 없습니다</p></li>
									</ul> <%
 	} else {
 		for (BookDTO booksortLists : booksortList) {
 %>
									<ul>
										<li><a
											href="./BookInfo.bk?book_number=<%=booksortLists.getBook_number()%>">
												<img src="./upload/book/<%=booksortLists.getBook_file()%>">
												<span><%=booksortLists.getBook_subject()%></span>
										</a>
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
											</dl></li>
									</ul> <%
 	}
 	}
 %>
								</li>
							</ul>
							<!-- ★갤러리로 보여지는 통합검색 -->


							<!-- 버튼 css 부분 -->
							<div class="btn_btm_center">
								<%
									// count = 전체 글의 개수
									if (count != 0) {
										// 이전페이지 // if (startPage와 pageBlock을 비교)
										if (startPage > pageBlock) {
								%><a
									href="./BookSort.bk?sort=<%=sort%>&pageNum=<%=startPage - pageBlock%>">[이전]</a>
								<%
									}
										// 1~10		11~20		21~30
										for (int i = startPage; i <= endPage; i++) {
								%>
								<a
									href="./BookSort.bk?sort=<%=sort%>&pageNum=<%=startPage - pageBlock%>">[<%=i%>]
								</a>
								<%
									}
										// 다음 // if (endPage와 pageCount를 비교)
										if (endPage < pageCount) {
								%>
								<a
									href="./BookSort.bk??sort=<%=sort%>&pageNum=<%=startPage - pageBlock%>">[다음]</a>
								<%
									}
									} // if count 괄호
								%>
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