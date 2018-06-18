<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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
	// 주소창에 Get방식으로 받아온 request값 스크립트에서 사용하기 위한 함수
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
	var selected = Request("selected");
	if(pageNum == "") pageNum=1;

	pageLoad(pageNum,selected);
	
	function pageLoad(pageNum,selected){
		selected = "all";
		$("#faq_select option:eq(0)").prop("selected", true);
		loadAjax(pageNum, selected);
	}
	
	$("#faq_select").change(function() {
		history.pushState(null,null,"BoardFaqList.fa");
		$('.view_lst').empty();
		$('.paginate').empty();
		$('#count').html();
		pageNum="1";
		selectBox();
	});
	
	function selectBox(){
		selected = $('#faq_select').val();
		loadAjax(pageNum, selected);
	}
	
	function loadAjax(pageNum, selected){
		$.ajax({
			url:"./BoardFaqAjax.fa",
			type:'POST',
			data:{'selected':selected, 'pageNum':pageNum},
			dataType:'json',
			success:function(result){
				var jsonData = JSON.parse("["+result+"]");
				var count = 0;
				pageNum = jsonData[jsonData.length-5].pageNum;
				var pageCount = jsonData[jsonData.length-4].pageCount;
				var pageBlock = jsonData[jsonData.length-3].pageBlock;
				var startPage = jsonData[jsonData.length-2].startPage;
				var endPage = jsonData[jsonData.length-1].endPage;

				if(jsonData.length != 0){
					count = jsonData[jsonData.length-6].count
				}
				
				$('#count').html(count);
				$("#faq_select").val(selected).prop("selected", true);
				
				/***********	게시판 리스트	**************/
				if(jsonData.length > 6){
					for(var i=0; i<jsonData.length-6; i++){
						var file = "";
						var faq_content = jsonData[i].faq_content;
						faq_content = faq_content.replace(/\r\n/gi, "<br>");
						faq_content = faq_content.replace(/\u0020/gi, "&nbsp;");
						
						var test = "<div class='con_lst DIV_CON_LST'><ul><li class='col_rcFAQ'><a href=''>"+jsonData[i].faq_num+"</a></li><li class='col_type'><a href='#'><p>"
						+jsonData[i].faq_type+"</p></a></li><li class='col_title'><a href='#'><p>"+jsonData[i].faq_subject
						+"</p></a></li></ul><div class='con_detail DIV_CON_DETAIL' id='con_detail"+i+"'>";
						$('.view_lst').append(test);
						
						/***********	이미지 처리 부분		**************/
						if(jsonData[i].faq_file != null){
							file = jsonData[i].faq_file;
							var test2 = "<p><img src='./upload/faq/"+jsonData[i].faq_file+"' width='100' height='100'></p>";
							$('#con_detail'+i).append(test2);
						}
						var test3 = "<p>"+faq_content+"</p><div class='file'><span>첨부파일</span><ul>"+file+"</ul></div>"
						$('#con_detail'+i).append(test3);
						
						/***********	수정,삭제 버튼	**************/
						if("admin"=="${member_id}"){
							var test5 = "<div class='btn_btm_board'>"+
										"<ul>"
											+"<li class='btn_con_right'>"
												+"<input type='button' class='btn_type4' value='글수정' onclick='location.href=\"./BoardFaqUpdate.fa?faq_num="
														+jsonData[i].faq_num+"&pageNum="+pageNum+"\"'>"
												+"<input type='button' class='btn_type4 deleteBoard' value='글삭제' rel='"+jsonData[i].faq_num+"'>"
											+"</li>"
										+"</ul>"
										+"</div>"
							$('#con_detail'+i).append(test5);
						}
						$('#con_detail'+i).append("</div></div>");
					}
				}else{	// 게시글 없을 때
					var test4 = "<ul><li class='col_tit'><p>게시글이 없습니다.</p></li></ul>";
					$('.view_lst').append(test4);
				}
				
				/***********	글쓰기 버튼 	**************/
				if("admin"=="${member_id}"){
					
					var test6 = "<input type='button' class='btn_type1' value='글쓰기' onclick='writeMove();'>";
					$('.btn_btm_center1').append(test6);
				}
				
				/***********	슬라이드 부분	**************/
				$("div.DIV_CON_LST > ul").click(function ()
				{
					if ($(this).hasClass('active'))
					{
					   	$(this).removeClass('active');
					    $(this).siblings("div.DIV_CON_DETAIL").stop(true, false).slideUp("fast");
					}
					else
					{
					    $("div.DIV_CON_DETAIL").slideUp("fast");
					    $("div.DIV_CON_LST > ul").removeClass("active");
					    $(this).siblings("div.DIV_CON_DETAIL").stop(true, false).slideDown("fast");
					    $(this).addClass('active');
					};
				});
					
				$('.deleteBoard').each(function(index){
					$(this).attr('id','delete'+index);
					$('#delete'+index).click(function(){
						$.Confirm(
							'정말 삭제하시겠습니까?',
							function(){
				 				location.href = './BoardFaqDelete.fa?faq_num=' + $('#delete'+index).attr('rel') + '&pageNum="${pageNum}"';
							}
						);
					});
				});
				
				/***********	페이징 처리 부분		**************/
				var prev2 = "<a href='./BoardFaqList.fa?pageNum=1&selected="+selected+"' class='prev2'><span class='hide'>페이지처음</span></a>";
				$('.paginate').append(prev2);
				
				if(pageCount < endPage) endPage = pageCount;
				if (startPage > pageBlock) {
					var prev = "<a href='./BoardFaqList.fa?pageNum="+(startPage-pageBlock)+
								"&selected="+selected+"' class='prev'><span class='hide'>이전 페이지</span></a>";
					$('.paginate').append(prev);
				}
				for (var p = startPage; p <= endPage; p++) {
					if (p == parseInt(pageNum)) {
						var current1 = "&nbsp;<strong title='현재 페이지' id='currentPage'>"+p+"</strong> &nbsp;";
						$('.paginate').append(current1);
					} else {
						var current2 = "&nbsp;<a href='./BoardFaqList.fa?pageNum="+p+"&selected="+selected+"'>"+p+"</a>&nbsp;";
						$('.paginate').append(current2);
					}
				}

				if (endPage < pageCount) {
					var next = "<a href='./BoardFaqList.fa?pageNum="+(startPage+pageBlock)+
								"&selected="+selected+"' class='next'><span class='hide'>다음 페이지</span></a>";
					$('.paginate').append(next);
				}
				var next2 = "<a href='./BoardFaqList.fa?pageNum="+pageCount+"&selected="+selected+"' class='next2'><span class='hide'>페이지끝</span></a>";
				$('.paginate').append(next2);

			}// success 끝
		});
	}
	
	
});
</script>
</head>
<body>
<%String pageNum = (String) request.getAttribute("pageNum");%>
<!-- board/boardFaq.jsp FAQ 게시판  페이지 -->
	<div class="wrapper">

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
						<div class=board style="word-break: break-all;">
							<h3>자주 하는 질문</h3>
							<div class="dl_box">
							<dl>
							<dt>Read It</dt>
							<dd>도서관 이용에 관한 궁금한 점은 "FAQ"에서 먼저 확인하시고</dd>
							<dd>추가로 문의할 내용은 "Q&A"에서 작성하시기 바랍니다</dd>
							</dl>
							</div>
				
							<div class="view_cnt">
								<p>Total_<span id="count"></span></p>
								<select name="choice" id="faq_select">
									<option value="all">전체</option>
									<option value="buy">자료구입</option>
									<option value="book">대출/반납/예약</option>
									<option value="library">도서관 이용</option>
									<option value="original">원문이용/상호대차</option>
									<option value="etc">기타</option>
								</select>
							</div>
							<ul class="brd_txt_lst">
								<!-- 글목록 -->
								<li class="view_lst">
			
								</li>
							</ul>
							<script type="text/javascript">
							
							</script>

								<div class="paginate">

								</div>
								
								 <div class="btn_btm_center1">
								 <script type="text/javascript">
								 	function writeMove(){
										location.href="./BoardFaqWrite.fa";
									}
								 </script>
								</div>
						</div>
					</div>

				</article>
				<!-- //메인 페이지-->
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
<script type="text/javascript">

</script>

</body>
</html>