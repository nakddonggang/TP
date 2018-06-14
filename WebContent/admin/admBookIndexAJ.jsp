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
<script type="text/javascript">

$(document).ready(function(){
	
	function Request(valuename){
		var rtnval;
		var nowAddress = unescape(location.href);
		var parameters = new Array();
		parameters = (nowAddress.slice(nowAddress.indexOf("?")+1,nowAddress.length)).split("&");
			for(var i = 0 ; i < parameters.length ; i++){
				if(parameters[i].split("=")[0] == valuename){
					rtnval = parameters[i].split("=")[1];
					if(rtnval == undefined || rtnval == null){
						rtnval = "";
					}
					return rtnval;
				}
			}
	}	
	
	var pageNum = Request("pageNum");
	var sort = Request("sort");
	if (pageNum=="") pageNum=1;
	if (sort="") sort="book_number";
	firstFunc(pageNum, sort);
	
	// 책 정렬
	$('#book_sorts').change(function(){
		pageNum=1;
		sort = $("#book_sorts > option:selected").val();
		firstFunc(pageNum, sort);
	}); // function selectBook 함수

	// Ajax 함수
	function firstFunc(pageNum, sort){
		$('.AdAjaxTest').empty(); // div 영역 비우기
		$.ajax({
			url:"./AdminBookIndex.am",
			type:'POST',
			data:{'sort':sort, "pageNum":pageNum},
			dataType:'json',
			success:function(result){
				$.Alert(result, function(){ });
			
				// ajax 변수 
				var JSDT = JSON.parse("["+result+"]");
				var count=JSDT[JSDT.length-7].count;
				var sort=JSDT[JSDT.length-6].sort;
				pageNum=JSDT[JSDT.length-5].pageNum;
				var pageCount=JSDT[JSDT.length-4].pageCount;
				var pageBlock=JSDT[JSDT.length-3].pageBlock;
				var startPage=JSDT[JSDT.length-2].startPage;
				var endPage=JSDT[JSDT.length-1].endPage;				
				
			}
	
	
}); // END OF JQUERY

</script>
</head>
<body>
<%
	String member_id = (String)session.getAttribute("member_id");
	if ((member_id == null) || !(member_id.equals("admin"))) {
		response.sendRedirect("./Main.fp");
	}
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
					
						<div class="adms" >
							<h3>&lt; 통합도서관리시스템 &gt;</h3>	
							
							<div id="adm_select_box3">
									<select name="sort" id="book_sorts">
									<option value="book_number">정렬</option>
									<option value="book_subject">제목순</option>
									<option value="book_author">저자순</option>
									<option value="book_popul">인기순</option>
									<option value="book_pubDate">신작순</option>
									<option value="book_date">입고순</option>
									</select>
							</div>
							
<%SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd"); %>

<div class="AdAjaxTest">		
			
</div>
							<script type="text/javascript">
							for(var i=0; i<JSdata.length-7; i++){
			 					$('#Borrow' + i).dialog({ 
			 						autoOpen: false, 
			 						width: 400, 
			 						modal: true, 
			 					});
			 				}
			 				$(".info_bbutton2").click(function() {
			 					var listvalue = $(this).attr("id");
			 					$('#Borrow' + listvalue).dialog("open");
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