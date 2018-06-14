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
$(document).ready(function() {	
	
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
if(pageNum=="") pageNum=1;
firstload(pageNum);

	function firstload(pageNum){
		onload(pageNum, sort);	
	}
	
	// 책 정렬
	$('#book_sort').change(function(){
		pageNum=1;
		sort = $("#book_sort > option:selected").val();
		onload(pageNum, sort);
	}); // function selectBook 함수
	
	// 모달창 띄우기
	for(var i=0; i<JSdata.length-7; i++){
		$('#Borrows' + i).dialog({ 
			autoOpen: false, 
			width: 400, 
			modal: true, 
		});
	}
	$(".bbutton_info").click(function() {
		var listvalue = $(this).attr("id");
		$('#Borrows' + listvalue).dialog("open");
	});
	
	$(".BTN_CLOSE").click(function() {
		var listvalue = $(this).attr("id");
		$('#Borrows' + listvalue).dialog("close");
	});
	
	// Ajax 함수
	function onload(pageNum, sort){
		$('.AdAjaxTest').empty(); // div 영역 비우기
		$.ajax({
			url:"./AdminBookIndex.am",
			type:'POST',
			data:{'sort':sort, "pageNum":pageNum},
			dataType:'json',
			success:function(result){
				
				// ajax 변수 
				var JSdata = JSON.parse("["+result+"]");
				var count=JSdata[JSdata.length-7].count;
				var sort=JSdata[JSdata.length-6].sort;
				pageNum=JSdata[JSdata.length-5].pageNum;
				var pageCount=JSdata[JSdata.length-4].pageCount;
				var pageBlock=JSdata[JSdata.length-3].pageBlock;
				var startPage=JSdata[JSdata.length-2].startPage;
				var endPage=JSdata[JSdata.length-1].endPage;
				
				var member_id="${member_id}";

					// content 내용 넣기
							var text = "<p>Total_<span>"
							+count+"</span></p><ul class='brd_txt_lst'><li class='view_lst' id='text3_ap'><div class='con_lst'><ul class='no_scroll title_t' id='text2_ap'><li class='adm_num'>번호</li><li class='adm_pic'>사진</li><li class='adm_subs'>제목</li><li class='adm_name'>저자</li><li class='adm_ten'>출판사</li><li class='adm_ten'>상세정보</li>";
							$('.AdAjaxTest').append(text);
							
							var text3 = "</ul></div>";
							$('#text3_ap').append(text3);
							
							if(count ==0 ){
								var text4= "<div class='con_lst'><ul><li class='col_tit'><p>책 목록이 없습니다</p></li></ul></div>";
								$('#text3_ap').append(text4);
							} else {
								for(var i=0; i<JSdata.length-7; i++){
									var text4="<div class='con_lst' id='mod_div"+i+"'><ul class='no_scroll'><li class='adm_num' id='adm_book_high' onclick='location.href=\"./AdminBookInfo.am?book_number="
									+JSdata[i].book_number+"\"\'>"
									+JSdata[i].book_number+"</li><li class='adm_pic' id='adm_book_high' onclick='location.href=\"./AdminBookInfo.am?book_number="
									+JSdata[i].book_number+"\"\'><img src='./upload/book/"
									+JSdata[i].book_file+"' width='70px' height='80px'></li><li class='adm_subs2' id='adm_book_high'onclick='location.href=\"./AdminBookInfo.am?book_number="
									+JSdata[i].book_number+"\"\'>"
									+JSdata[i].book_subject+"</li><li class='adm_name' id='adm_book_high' onclick='location.href=\"./AdminBookInfo.am?book_number="
									+JSdata[i].book_number+"\"\'>"
									+JSdata[i].book_author+"</li><li class='adm_ten' id='adm_book_high' onclick='location.href=\"./AdminBookInfo.am?book_number="
									+JSdata[i].book_number+"\"\'>"+JSdata[i].book_publisher+"</li><li class='adm_ten'><input type='button' id="
									+i+"' value='보기' class ='bbutton_info' ></li></ul>";
										$('#text3_ap').append(text4);

										if (JSdata[i].bbook_bstate==0) {
											if(JSdata[i].rbook_check>=3){
												if(JSdata[i].dbook_state==0){
													var mod1 = "<div id='Borrows"+i+"'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>대출가능</li></ul></li><li><ul class='row_sub''><li class='title'>예약상태</li><li class='inp_form'>예약불가</li></ul></li><li><ul class='row_sub'><li class='title'>책상태</li><li class='inp_form'>상태양호</li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
													+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
													$('#mod_div'+i).append(mod1);
												} else {
													var mod1 = "<div id='Borrows"+i+"'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>대출가능</li></ul></li><li><ul class='row_sub''><li class='title'>예약상태</li><li class='inp_form'>예약불가</li></ul></li><li><ul class='row_sub'><li class='title'>책상태</li><li class='inp_form'>"+JSdata[i].dbook_state+"</li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
													+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
													$('#mod_div'+i).append(mod1);
												}
											} else {
												if(JSdata[i].dbook_state==0){
													var mod1 = "<div id='Borrows"+i+"'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>대출가능</li></ul></li><li><ul class='row_sub''><li class='title'>예약상태</li><li class='inp_form'>예약가능</li></ul></li><li><ul class='row_sub'><li class='title'>책상태</li><li class='inp_form'>상태양호</li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
													+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
													$('#mod_div'+i).append(mod1);
												} else {
													var mod1 = "<div id='Borrows"+i+"'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>대출가능</li></ul></li><li><ul class='row_sub''><li class='title'>예약상태</li><li class='inp_form'>예약가능</li></ul></li><li><ul class='row_sub'><li class='title'>책상태</li><li class='inp_form'>"+JSdata[i].dbook_state+"</li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
													+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
													$('#mod_div'+i).append(mod1);
												}
											}
										} else {
											if(JSdata[i].rbook_check>=3){
												if(JSdata[i].dbook_state==0){
													var mod1 = "<div id='Borrows"+i+"'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>"
			 										JSdata[i].bbook_bdate+"~"+JSdata[i].bbook_rdate+"대출중</li></ul></li><li><ul class='row_sub''><li class='title'>예약상태</li><li class='inp_form'>예약불가</li></ul></li><li><ul class='row_sub'><li class='title'>책상태</li><li class='inp_form'>상태양호</li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
													+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
													$('#mod_div'+i).append(mod1);
												} else {
													var mod1 = "<div id='Borrows"+i+"'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>"
			 										JSdata[i].bbook_bdate+"~"+JSdata[i].bbook_rdate+"대출중</li></ul></li><li><ul class='row_sub''><li class='title'>예약상태</li><li class='inp_form'>예약불가</li></ul></li><li><ul class='row_sub'><li class='title'>책상태</li><li class='inp_form'>"+JSdata[i].dbook_state+"</li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
													+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
													$('#mod_div'+i).append(mod1);
												}
											} else {
												if(JSdata[i].dbook_state==0){
													var mod1 = "<div id='Borrows"+i+"'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>"
			 										JSdata[i].bbook_bdate+"~"+JSdata[i].bbook_rdate+"대출중</li></ul></li><li><ul class='row_sub''><li class='title'>예약상태</li><li class='inp_form'>예약가능</li></ul></li><li><ul class='row_sub'><li class='title'>책상태</li><li class='inp_form'>상태양호</li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
													+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
													$('#mod_div'+i).append(mod1);
												} else {
													var mod1 = "<div id='Borrows"+i+"'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>"
			 										JSdata[i].bbook_bdate+"~"+JSdata[i].bbook_rdate+"대출중</li></ul></li><li><ul class='row_sub''><li class='title'>예약상태</li><li class='inp_form'>예약가능</li></ul></li><li><ul class='row_sub'><li class='title'>책상태</li><li class='inp_form'>"+JSdata[i].dbook_state+"</li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
													+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
													$('#mod_div'+i).append(mod1);
												}
											}
										}
										
										var mod12="</div>";
										$('.text3_ap').append(mod12);
										
							}
						}
							
							var text8="</li></ul>";
							$('.AdAjaxTest').append(text8);
							
							var text9 = "<div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='입고하기' onclick='bookwrite();' class ='btn_type4 BTN_IF_LIST b'></li>&nbsp;<li class='adm_btn__left'><input type='button' value='희망도서목록' onclick='hbooklist();' class ='btn_type4 BTN_IF_LIST'></li></ul></div>";
							$('.AdAjaxTest').append(text9);
						
							var text10 = "<div class='paginate'><a href='./AdminIndex.am?pageNum=1&sort="+sort+"'><span>&lt;&lt;&nbsp;</span></a>";
							$('.AdAjaxTest').append(text10);
								
							if(pageCount < endPage)	endPage = pageCount;
							
							if(startPage>pageBlock) {
								var text11="<a href='./AdminIndex.am?pageNum="+(startPage-pageBlock)+"&sort="+sort+"' class='prev'><span class='hide'>이전 페이지</span></a>";
								$('.paginate').append(text11);
							}
							
							for (var i=startPage; i<=endPage; i++){
								if (i==pageNum){
									var text12="&nbsp;<strong id='currentPage' title='현재 페이지'>"+i+"</strong> &nbsp;";
									$('.paginate').append(text12);
								} else{
									var text12="&nbsp;<a href='./AdminIndex.am?pageNum="+i+"&sort="+sort+"'>"+i+"</a> &nbsp";
									$('.paginate').append(text12);
								}
							}
							
							if(endPage < pageCount) { 
								var text13="<a href='./AdminIndex.am?pageNum="+(startPage+pageBlock)+"&sort="+sort+"' class='next'><span class='hide'>다음 페이지</span></a id='text14_ap'>";
								$('.paginate').append(text13);
							}

							var text14="<a href='./AdminIndex.am?pageNum="+pageCount+"&sort="+sort+"'><span>&nbsp;&gt;&gt;</span></a>";
							$('.paginate').append(text14);
							
							var text15="</div>";
							$('.AdAjaxTest').append(text15);
							
							
							// JQUERY★
							function bookwrite(){
								location.href="./AdminBookWrite.am";
							}
							
							function hbooklist(){
								location.href="./AdminHBookList.am";
							}
							
							// 모달창 띄우기
							for(var i=0; i<JSdata.length-7; i++){
								$('#Borrows' + i).dialog({ 
									autoOpen: false, 
									width: 400, 
									modal: true, 
								});
							}
							$(".bbutton_info").click(function() {
								var listvalue = $(this).attr("id");
								$('#Borrows' + listvalue).dialog("open");
							});
							
							$(".BTN_CLOSE").click(function() {
								var listvalue = $(this).attr("id");
								$('#Borrows' + listvalue).dialog("close");
							});
							
				}, // Ajax 데이터 값 받기 성공
				error:function(request,status,error){ } // error 발생시
		}); // Ajax
	}
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
															<input type=submit class="adm_btn_type4" value="상세검색" >
															<input type="reset" class="adm_btn_type5" value="입력 초기화">
														</div>
													</div>
												</div>
											</form>
									</div>
					
						<div class="adms" >
							<h3>&lt; 통합도서관리시스템 &gt;</h3>	
							
							<div id="adm_select_box3">
									<select name="sort" id="book_sort">
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

					</div>
					</div>
			</article>

		</section>
		
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>