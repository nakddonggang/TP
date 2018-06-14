<%@page import="java.net.URLDecoder"%>
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
	
var pageNum = "${pageNum}";
var view =  Request("view");
var category1="${category1}";
var search1="${search1}";
var category2="${category2}";
var search2="${search2}";
var opt1=Request("opt1");
var opt2=Request("opt2");
var category3="${category3}";
var search3="${search3}";
var pubDate=Request("pubDate");
var sort=Request("sort");
if (view==null) view="1";
if(pageNum=="") pageNum="1";
// $.Alert(pageNum+", "+view+", "+category1+", "+category2+", "+category3+", "+search1+", "+search2+", "+search3,function(){});

// 책바구니 이동 Jquery
		$('#basket_Fr').submit(function(){
			if ($('.bncheck').is(":checked") == false){
				$.Alert("책을 선택해주세요",function(){ });
				return false;
			}else {
				$.Confirm(
					"책바구니에 담으시겠습니까?",
					function(){ $("#basket_Fr").submit; });
			} 
		});		
		
		// direct값이 1이면 바구니에 정상적으로 들어간 것  
		var direct = Request("direct");
		if(direct=="1"){
			$.Confirm(
					'책바구니로 이동하시겠습니까?',
					function(){ location.replace('./MemberBasketList.me'); });
			return false;
		} else{}

// 갤러리, 게시판 띄워주는 버튼
if (view==0){
	$('#book_pic_div').show();
	$('.btn_btm_center').hide();
	$('#book_cont_div').hide();
} else if (view==1){
	$('#book_pic_div').hide();
	$('#book_cont_div').show();
}

$('#book_pic_btn').click(function(){
// 	pageNum=1;
	view=0;
	onload(pageNum, view, sort);
});

$('#book_cont_btn').click(function(){
// 	pageNum=1;
	view=1;
	onload(pageNum, view, sort);
});

// 갤러리 형식 hover 효과주기
$('#book_pic_hv').hover(function() {
$('.book_lst > li').mouseenter(function() {
	$("dl", this).addClass("bil_on"); }).mouseleave(function(){
	$("dl", this).removeClass("bil_on");
});
$('.book_lst > li').focusin(function() {
	$("dl", this).addClass("bil_on");}).focusout(function() {
	$("dl", this).removeClass("bil_on");
});
});

// 대출 버튼 Jquery
$(".bbutton").click(function(){
	var book_number = $(this).attr("rel");
	$.Confirm(
			"대출신청을 하시겠습니까?", function(){
			var url = book_number;
			$(location).attr('href', './BorrowBookAction.me?book_number='+url);
	});
});

// 예약 버튼 Jquery
$('.rbutton').click(function() {
	var book_number = $(this).attr("rel");
	$.Confirm(
			"대출예약 하시겠습니까?", function(){
			var url = book_number;
			$(location).attr('href', './MemberBasketResAction.me?book_number='+url);
	});
});

	// 책 정렬
	$('#book_sort').change(function(){
		pageNum=1;
		sort = $("#book_sort > option:selected").val();
		onload(pageNum, view, sort);
	}); // function selectBook 함수
			
	// Ajax 함수
	function onload(pageNum, view, sort){
		$('.AjaxTest').empty(); // div 영역 비우기
		$.ajax({
			url:"./BookSearchAJ.bk",
			type:'POST',
			data:{'pageNum':pageNum, 'sort':sort, 'view':view, 'category1':category1, 'search1':search1, 'opt1':opt1, 'category2':category2, 'search2':search2, 'opt2':opt2, 'category3':category3, 'search3':search3, 'pubDate':pubDate},
			dataType:'json',
			success:function(result){

				// 책바구니 이동 Jquery
				$('#basket_Fr').submit(function(){
					if ($('.bncheck').is(":checked") == false){
						$.Alert("책을 선택해주세요",function(){ });
						return false;
					}else {
						$.Confirm(
							"책바구니에 담으시겠습니까?",
							function(){ $("#basket_Fr").submit; });
					} 
				});	
				
				// direct값이 1이면 바구니에 정상적으로 들어간 것  
				var direct = Request("direct");
				if(direct=="1"){
					$.Confirm(
							'책바구니로 이동하시겠습니까?',
							function(){ location.replace('./MemberBasketList.me'); });
				} else{}

// 				$.Alert("접니다",function(){ });
				// ajax 변수 
				var JSdata = JSON.parse("["+result+"]");
				var count=JSdata[JSdata.length-17].count;
				var search1=JSdata[JSdata.length-16].search1;
				var search2=JSdata[JSdata.length-15].search2;
				var search3=JSdata[JSdata.length-14].search3;
				var category1=JSdata[JSdata.length-13].category1;
				var category2=JSdata[JSdata.length-12].category2;
				var category3=JSdata[JSdata.length-11].category3;
				var opt1=JSdata[JSdata.length-10].opt1;
				var opt2=JSdata[JSdata.length-9].opt2;
				var pubDate=JSdata[JSdata.length-8].pubDate;
				var sort=JSdata[JSdata.length-7].sort;
				pageNum=JSdata[JSdata.length-6].pageNum;
				var pageCount=JSdata[JSdata.length-5].pageCount;
				var pageBlock=JSdata[JSdata.length-4].pageBlock;
				var startPage=JSdata[JSdata.length-3].startPage;
				var endPage=JSdata[JSdata.length-2].endPage;
				view=JSdata[JSdata.length-1].view;

// 				$.Alert(JSdata,function(){ });
// 				$.Alert(view,function(){ });
// 				$.Alert(pageNum,function(){ });
				var member_id="${member_id}";
					
				// content 내용 넣기
				var text = "<p>Total_<span>"
				+count+"</span></p><ul class='brd_txt_lst' id='book_cont_div'><li class='view_lst' id='text3_ap'><div class='con_lst'><ul class='no_scroll title_t' id='text2_ap'><li class='adm_col_rrc'>목록</li><li class='adm_col_date'>사진</li><li class='adm_col_sub'>제목</li><li class='adm_col_type'>저자</li><li class='adm_col_sub'>출판사</li><li class='adm_col_sub' id='text2_ap'>대출/예약 현황</li>";
				$('.AjaxTest').append(text);
				
				var text3 = "</ul></div>";
				$('#text3_ap').append(text3);
											
				if(count ==0 ){
					var text4= "<div class='con_lst'><ul><li class='col_tit'><p>책 목록이 없습니다</p></li></ul></div>";
					$('#text3_ap').append(text4);
				} else {
					for(var i=0; i<JSdata.length-17; i++){
						var text4="<div class='con_lst' id='mod_div"+i+"'><ul class='no_scroll'><li class='adm_col_rrc' id='adm_book_high'><input type='checkbox' name='basket_check' class='bncheck' value='"
							+JSdata[i].book_number+"'></li><li class='adm_col_date' id='adm_book_high'  onclick='location.href=\"./BookInfo.bk?book_number="
							+JSdata[i].book_number+"\"\'><img src='./upload/book/"
							+JSdata[i].book_file+"' width='70px' height='80px'></li><li class='adm_col_sub' id='adm_book_high'>"
							+JSdata[i].book_subject+"</li><li class='adm_col_type  over_dot' id='adm_book_high'>"
							+JSdata[i].book_author+"</li><li class='adm_col_sub over_dot' id='adm_book_high'>"
							+JSdata[i].book_publisher+"</li><li class='adm_col_sub' id='adm_book_high'><input type='button' id='"
							+i+"' value='상세보기' class ='info_bbutton2' ></li></ul>";
							$('#text3_ap').append(text4);
							
							if (JSdata[i].bbook_bstate==0) {
								var mod1 = "<div class='BookMod"+i+"' id='book_mod'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>대출가능</li></ul></li><li><ul class='row_sub''><li class='title'>대출</li><li class='inp_form'><input type='button' rel='"
								+JSdata[i].book_number+"' class='bbutton' value='대출신청' id='borrowBook'></li></ul></li><li><ul class='row_sub'><li class='title'>예약</li><li class='inp_form'><input type='button' rel='"
								+JSdata[i].book_number+"' class='rbutton' value='대출예약' id='borrowBook'></li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
								+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
								$('#mod_div'+i).append(mod1);
							} else {
								var mod1 = "<div class='BookMod"+i+"' id='book_mod'><div class='join_form'><h3>책관리</h3><ul><li class='row'><ul class='row_sub'><li class='title'>대출현황</li><li class='inp_form'>대출가능</li></ul></li><li><ul class='row_sub''><li class='title'>대출</li><li class='inp_form'><input type='button' rel='"
								+JSdata[i].book_number+"' class='bbutton2' value='대출불가'></li></ul></li><li><ul class='row_sub'><li class='title'>예약</li><li class='inp_form'><input type='button' rel='"
								+JSdata[i].book_number+"' class='rbutton' value='대출예약' id='borrowBook'></li></ul></li></ul><div class='btn_btm_center'><ul><li class='adm_btn_cancle'><input type='button' value='나가기' id='"
								+i+"' class ='btn_type4 BTN_CLOSE'></li></ul></div></div></div>";
								$('#mod_div'+i).append(mod1);
							}

							var mod2="</div>";
							$('.text3_ap').append(mod2);
							
				}
			}
				
				var text8="</li></ul>";
				$('.AjaxTest').append(text8);
							
							var pic1="<ul class='book_lst' id='book_pic_div'>";
							$('.AjaxTest').append(pic1);
							
							if(count==0){
								var pic2="<li><dl class='book_info_layer'><dt>책 목록이 없습니다</dt><dd></dd></dl></li> ";
								$('#book_pic_div').append(pic2);
							} else {
								for(var k=0; k<JSdata.length-17; k++){
									var pic2="<li><a href='./BookInfo.bk?book_number="
									+JSdata[k].book_number+"'><img src='./upload/book/"
									+JSdata[k].book_file+"' class='book_lst_img'><span id='bk_li_subs'>"
									+JSdata[k].book_subject+"</span><dl class='book_info_layer'><dt><span>"
									+JSdata[k].book_subject+"</span></dt><dd><dl><dt>저자</dt><dd>"
									+JSdata[k].book_author+"</dd><dt>출판사</dt><dd>"
									+JSdata[k].book_publisher+"</dd><dt>출판년도</dt><dd>"
									+JSdata[k].book_pubDate+"</dd></dl></dd></dl></a></li>";
									$('#book_pic_div').append(pic2);
								}
							}						
							var pic3="</ul>";
							$('.AjaxTest').append(pic3);

							if (member_id!=null){
								var text9="<div class='btn_btm_center' id='text10'><ul><li><input type='submit' value='책바구니' id='basket_Fr_btn' class='btn_type4 BTN_IF_LIST'></li></ul></div>";
								$('.AjaxTest').append(text9);
							}
							
							var text10 = "<div class='paginate'><a href='./BookSearch.bk?pageNum=1&category1="+category1+"&search1="+search1+"&opt1="
									+opt1+"&category2="+category2+"&search2="+search2+"&opt2="+opt2+"&category3="+category3+"&search3="
									+search3+"&pubDate="+pubDate+"&view="+view+"&sort="+sort+"' class='prev2'><span class='hide'>페이지처음</span></a>";
							$('.AjaxTest').append(text10);
								
							if(pageCount < endPage)	endPage = pageCount;
							
							if(startPage>pageBlock) {
								var text11="<a href='./BookSearch.bk?pageNum="+(startPage-pageBlock)+"&category1="+category1+"&search1="+search1+"&opt1="
								+opt1+"&category2="+category2+"&search2="+search2+"&opt2="+opt2+"&category3="+category3+"&search3="
								+search3+"&pubDate="+pubDate+"&view="+view+"&sort="+sort+"' class='prev'><span class='hide'>이전 페이지</span></a>";
								$('.paginate').append(text11);
							}
							
							for (var i=startPage; i<=endPage; i++){
								if (i==pageNum){
									var text12="&nbsp;<strong id='currentPage' title='현재 페이지'>"+i+"</strong> &nbsp;";
									$('.paginate').append(text12);
								} else{
									var text12="&nbsp;<a href='./BookSearch.bk?pageNum="+i+"&category1="+category1+"&search1="+search1+"&opt1="
									+opt1+"&category2="+category2+"&search2="+search2+"&opt2="+opt2+"&category3="+category3+"&search3="
									+search3+"&pubDate="+pubDate+"&view="+view+"&sort="+sort+"'>"+i+"</a> &nbsp";
									$('.paginate').append(text12);
								}
							}
							
							if(endPage < pageCount) { 
								var text13="<a href='./BookSearch.bk?pageNum="+(startPage+pageBlock)+"&category1="+category1+"&search1="+search1+"&opt1="
								+opt1+"&category2="+category2+"&search2="+search2+"&opt2="+opt2+"&category3="+category3+"&search3="
								+search3+"&pubDate="+pubDate+"&view="+view+"&sort="+sort+"' class='next'><span class='hide'>다음 페이지</span></a id='text14_ap'>";
								$('.paginate').append(text13);
							}

							var text14="<a href='./BookSearch.bk?pageNum="+pageCount+"&category1="+category1+"&search1="+search1+"&opt1="
							+opt1+"&category2="+category2+"&search2="+search2+"&opt2="+opt2+"&category3="+category3+"&search3="
							+search3+"&pubDate="+pubDate+"&view="+view+"&sort="+sort+"' class='next2'><span class='hide'>페이지끝</span></a>";
							$('.paginate').append(text14);
							
							var text15="</div>";
							$('.AjaxTest').append(text15);
							
							
						// jQuery 구문들	
							// 갤러리, 게시판 띄워주는 버튼
							if (view==0){
								$('#book_pic_div').show();
								$('.btn_btm_center').hide();
								$('#book_cont_div').hide();
							} else if (view==1){
								$('#book_pic_div').hide();
								$('#book_cont_div').show();
							}

						// 갤러리 형식 hover 효과주기
						$('#book_pic_hv').hover(function() {
							$('.book_lst > li').mouseenter(function() {
								$("dl", this).addClass("bil_on"); }).mouseleave(function(){
								$("dl", this).removeClass("bil_on");
							});
							$('.book_lst > li').focusin(function() {
								$("dl", this).addClass("bil_on");}).focusout(function() {
								$("dl", this).removeClass("bil_on");
							});
						});
						
						// 대출 버튼 Jquery
						$(".bbutton").click(function(){
							var book_number = $(this).attr("rel");
							$.Confirm(
									"대출신청을 하시겠습니까?", function(){
									var url = book_number;
									$(location).attr('href', './BorrowBookAction.me?book_number='+url);
							});
						});
						
						// 예약 버튼 Jquery
						$('.rbutton').click(function() {
							var book_number = $(this).attr("rel");
							$.Confirm(
									"대출예약 하시겠습니까?", function(){
									var url = book_number;
									$(location).attr('href', './MemberBasketResAction.me?book_number='+url);
							});
						});
						
						// 반납 버튼 Jquery
						$('.rebutton').click(function() {
							var book_number = $(this).attr("rel");
							$.Confirm(
									"책 반납을 하시겠습니까?", function(){
										var url = book_number;
										$(location).attr('href', './MemberBasketResAction.me?book_number='+url);
								});
						});
						
						// 모달창 띄우기
						//admin 대출,예약,책상태 
						for(var i=0;i<JSdata.length-17;i++){
							$('.BookMod' + i).dialog({ 
								autoOpen: false, 
								width: 400, 
								modal: true, 
							});
						}
						$(".info_bbutton2").click(function() {
							var listvalue = $(this).attr("id");
							$('.BookMod' + listvalue).dialog("open");
						});
						
						$(".BTN_CLOSE").click(function() {
							var listvalue = $(this).attr("id");
							$('.BookMod' + listvalue).dialog("close");
						});
							
				}, // Ajax 데이터 값 받기 성공
				error:function(request,status,error){
//				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			  	} // error 발생시
		}); // Ajax
	}
});
</script>
</head>
<body><%
String member_id = (String)session.getAttribute("member_id");
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

String view = request.getParameter("view");
if(view==null) view = "1";
%>
<script type="text/javascript">
alert("decode"+decode);
</script>
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
															<input type=submit class="book_btn_type4" value="상세검색" >
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
							
							<div id="adm_select_box3">
								<input type="button" value="갤러리" id="book_pic_btn"  class="book_btn">
								<input type="button" value="게시판" id="book_cont_btn"  class="book_btn" >
								<select name="sort" id="book_sort">
									<option value="book_number">정렬</option>
									<option value="book_subject">제목순</option>
									<option value="book_author">저자순</option>
									<option value="book_popul">인기순</option>
									<option value="book_pubDate">신작순</option>
									<option value="book_date">입고순</option>
								</select>
							</div>

<form action="./MemberBasketAdd.me" method="post" id="basket_Fr">		
<div class="AjaxTest">
							<p>
								Total_<span><%=count%></span>	
							</p>	
							
							<ul class="brd_txt_lst" id="book_cont_div">
								<!-- 글목록 -->
								<li class="view_lst">
									<div class="con_lst">
										<ul class="no_scroll title_t">
											<li class="adm_col_rrc">목록</li>
											<li class="adm_col_date">사진</li>
											<li class="adm_col_sub">제목</li>
											<li class="adm_col_type">저자</li>
											<li class="adm_col_sub">출판사</li>
											<li class="adm_col_sub">대출/예약 현황</li>
											<li >
										</ul>
									</div> <%
 	if (count == 0) {
 %><ul>
										<li class="col_tit"><p>책 목록이 없습니다</p></li>
									</ul> <%
 	} else {
 		for (int i=0; i<booksearchList.size(); i++) {
 			BookDTO booksearchLists = booksearchList.get(i);
 %>
									<div class="con_lst">
										<ul class="no_scroll">
											<li class="adm_col_rrc" id="adm_book_high"><input
												type="checkbox" name="basket_check"  class="bncheck" 
												value="<%=booksearchLists.getBook_number()%>" ></li>
											<li class="adm_col_date" id="adm_book_high"
												onclick="location.href='./BookInfo.bk?book_number=<%=booksearchLists.getBook_number()%>'"><img
												src="./upload/book/<%=booksearchLists.getBook_file()%>"
												width="70px" height="80px"></li>
											<li class="adm_col_sub" id="adm_book_high"
												onclick="location.href='./BookInfo.bk?book_number=<%=booksearchLists.getBook_number()%>'"><%=booksearchLists.getBook_subject()%></li>
											<li class="adm_col_type over_dot" id="adm_book_high"
												onclick="location.href='./BookInfo.bk?book_number=<%=booksearchLists.getBook_number()%>'"><%=booksearchLists.getBook_author()%></li>
											<li class="adm_col_sub over_dot" id="adm_book_high"
												onclick="location.href='./BookInfo.bk?book_number=<%=booksearchLists.getBook_number()%>'"><%=booksearchLists.getBook_publisher()%></li>
											<%if(member_id!=null){ %>
											<li class="adm_col_sub"><input type="button" id="<%=i %>" value=상세보기  class ='info_bbutton2' ></li><%
											}%>
										</ul>
						<%if(member_id!=null){ %>				
							<div class="BookMod<%=i%>">
								<div class="join_form">
								<h3>책관리</h3>
								<ul>
									<li class="row">
										<ul class="row_sub">
										<li class="title">대출현황</li>
										<li class="inp_form"><%if (Integer.parseInt(booksearchLists.getBbook_bstate())==0){ %> 대출가능 <% }
											else { %> 대출중
											<%}%></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
										<li class="title">대출</li>
										<li class="inp_form"><%if (Integer.parseInt(booksearchLists.getBbook_bstate())==0){ %>
										<input type='button' rel='<%=booksearchLists.getBook_number()%>' class='bbutton' value='대출신청' id='borrowBook'> 
										<% }else { %>
											<input type='button' rel='<%=booksearchLists.getBook_number()%>' class='bbutton2' value='대출불가'>
											<%}%></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
										<li class="title">예약</li>
										<li class="inp_form">
											<input type='button' rel="<%=booksearchLists.getBook_number()%>" class='rbutton' value='대출예약' id='borrowBook'>
										</li>
										</ul>
									</li>
								</ul>
								<div class="btn_btm_center" >
									<ul>
										<li class="adm_btn_cancle">
										<input type="button" value="나가기" id="<%=i%>" class ="btn_type4 BTN_CLOSE">
										</li>
									</ul>
								</div>
							</div>
						</div>
						<%}%>
					</div>
				<%}
 				}%>
								</li>
							</ul>
							<!-- ★게시판으로 보여지는 통합검색 -->

							<!-- ★갤러리로 보여지는 통합검색 -->
							<ul class="book_lst" id="book_pic_div">
								<li>
									<%
										if (count == 0) {
									%>
									<dl class="book_info_layer">
										<dt>책 목록이 없습니다</dt>
										<dd></dd>
									</dl>
									</li> <%
									 	} else {
 		for (BookDTO booksearchLists : booksearchList) {
 %>
				<li><a href="./BookInfo.bk?book_number=<%=booksearchLists.getBook_number()%>">
						<img src="./upload/book/<%=booksearchLists.getBook_file()%>" class="book_lst_img">
						<span id="bk_li_subs"><%=booksearchLists.getBook_subject()%></span>
					<dl class="book_info_layer">
						<dt>
							<span><%=booksearchLists.getBook_subject()%></span>
						</dt>
						<dd>
							<dl>
								<dt>저자</dt>
								<dd><%=booksearchLists.getBook_author()%>
								</dd>
								<dt>출판사</dt>
								<dd><%=booksearchLists.getBook_publisher()%></dd>
								<dt>출판년도</dt>
								<dd><%=booksearchLists.getBook_pubDate()%></dd>
							</dl>
						</dd>
					</dl>
					</a>
					</li>
					
				<%}
				}%>
	</ul>
	
<script type="text/javascript">
$(window).on('load', function() {
	var booksearchList = "${booksearchList.size()}";
	//admin 대출,예약,책상태 
	for(var i=0; i<booksearchList; i++){
		$('.BookMod' + i).dialog({ 
			autoOpen: false, 
			width: 400, 
			modal: true, 
		});
	}
	$(".info_bbutton2").click(function() {
		var listvalue = $(this).attr("id");
		$('.BookMod' + listvalue).dialog("open");
	});
	
	$(".BTN_CLOSE").click(function() {
		var listvalue = $(this).attr("id");
		$('.BookMod' + listvalue).dialog("close");
	});
});
</script>	
							<!-- ★갤러리로 보여지는 통합검색 -->
							<%if(member_id!=null){ %>
							<div class="btn_btm_center">
								<ul>
									<li><input type="submit" value="책바구니" id="basket_Fr_btn"
										class="btn_type4 BTN_IF_LIST"></li>
								</ul>
							</div>
							<%}%>


				<!-- 버튼 css 부분 -->	
						<div class="paginate">
						<a href="./BookSearch.bk?pageNum=1&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>&view=<%=view%>" class="prev2"><span class="hide">페이지처음</span></a>
						<%
						if(pageCount < endPage)	endPage = pageCount;
						if(startPage > pageBlock)	{ %><a href="./BookSearch.bk?pageNum=<%=startPage - pageBlock%>&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>&view=<%=view%>" class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong id="currentPage" title="현재 페이지"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="./BookSearch.bk?pageNum=<%=p%>&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>&view=<%=view%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){	%><a href="./BookSearch.bk?pageNum=<%=startPage+pageBlock%>&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>&view=<%=view%>" class="next"><span class="hide">다음 페이지</span></a><% }
						%>
						<a href="./BookSearch.bk?pageNum=<%=pageCount%>&category1=<%=category1%>&search1=<%=search1%>&opt1=<%=opt1%>&category2=<%=category2%>&search2=<%=search2%>&opt2=<%=opt2%>&category3=<%=category3%>&search3=<%=search3%>&pubDate=<%=pubDate%>&view=<%=view%>" class="next2"><span class="hide">페이지끝</span></a>
						 </div>
		
</div>						 
</form>

						</div>
					</div>
				</article>

			</section>

		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>