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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	var selected = "";
	function selectBox(){
		selected = $('#faq_select').val();
		$.ajax({
			url:"./BoardFaqAjax.fa",
			type:'POST',
			data:{'selected':selected},
			dataType:'json',
			success:function(result){
				var jsonData = JSON.parse("["+result+"]");
				if(jsonData.length != 0){
					for(var i=0; i<jsonData.length; i++){
						function updateMove(){
							var pageNum = "${pageNum}";
							location.href="./BoardFaqUpdate.fa?faq_num="+jsonData[i].faq_num+"&pageNum="+pageNum;
						}
						function deleteMove(){
							var pageNum = "${pageNum}";
							location.href="./BoardFaqDelete.fa?faq_num="+jsonData[i].faq_num+"&pageNum="+pageNum;
						}
						
						var faq_content = jsonData[i].faq_content;
						faq_content = faq_content.replace(/\r\n/, "<br>");
						faq_content = faq_content.replace(/\u0020/, "&nbsp;");
						
						var test = "<div class='con_lst DIV_CON_LST'><ul><li class='col_rcFAQ'><a href='#'>"+jsonData[i].faq_num+"</a></li><li class='col_type'><a href='#'><p>"
						+jsonData[i].faq_type+"</p></a></li><li class='col_title'><a href='#'><p>"+jsonData[i].faq_subject
						+"</p></a></li></ul><div class='con_detail DIV_CON_DETAIL'>";
						$('.view_lst').append(test);
						
						if(jsonData[i].faq_file != null){
							var test2 = "<p><img src='./upload/"+jsonData[i].faq_file+"' width='100' height='100'></p>";
							$('.con_detail').append(test2);
						}else{
							var test3 = "<p>"+faq_content+"</p><div class='file'><span>첨부파일</span><ul>"+jsonData[i].faq_file+"</ul></div>"
							$('.con_detail').append(test3);
							
							if("admin"=="${member_id}"){
								var test5 = "<div class='btn_btm_board'>"+
											"<ul>"+
												+"<li class='btn_con_right'>"
													+"<input type='button' class='btn_type4' value='글수정' onclick=updateMove()>"
													+"<input type='button' class='btn_type4 deleteBoard' value='글삭제' onclick=deleteMove()>"
												+"</li>"
											+"</ul>"
											+"</div>"
								$('.con_detail').append(test5);
							}
							$('.con_detail').append("</div></div>");
						}
						
					}
				}else{
					var test4 = "<ul><li class='col_tit'><p>게시글이 없습니다.</p></li></ul>";
					$('.view_lst').append(test4);
				}

				if("admin"=="${member_id}"){
					
					var test6 = "<input type='button' class='btn_type1' value='글쓰기' onclick='writeMove();'>";
					$('.btn_btm_center').append(test6);
				}
			}
		});
	}
	selectBox();
	$("#faq_select").change(function() {
		$('.con_lst').empty();
		$('.con_detail').empty();
		$('.view_lst').children('ul').empty();
		selectBox();
	});
	
});
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
		List<BoardDTO> faqList = (List<BoardDTO>) request.getAttribute("faqList");
	%>
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
						<div class=board>
							<h3>자주 하는 질문</h3>
							<div class="dl_box">
							<dl>
							<dt>Read It</dt>
							<dd>도서관 이용에 관한 궁금한 점은 "FAQ"에서 먼저 확인하시고</dd>
							<dd>추가로 문의할 내용은 "Q&A"에서 작성하시기 바랍니다</dd>
							</dl>
							</div>
				
							<div class="view_cnt">
								<p>Total_<span><%=count%></span></p>
								<select name="choice" id="faq_select">
									<option value="all">전체</option>
									<option value="buy">자료구입</option>
									<option value="book">대출/반납/예약</option>
									<option value="library">도서관 이용</option>
								</select>
							</div>
							<ul class="brd_txt_lst">
								<!-- 글목록 -->
								<li class="view_lst">
									
									
										
										
									
								</li>
							</ul>
								
								<div class="paginate">
<%-- 							<% --%>
<!-- // 								if (pageCount < endPage) endPage = pageCount; -->
<!-- // 								if (startPage > pageBlock) { -->
<%-- 							%><a --%>
<%-- 								href="./BoardFaqList.fa?pageNum=<%=startPage - pageBlock%>" --%>
<!-- 								class="prev"><span class="hide">이전 페이지</span></a> -->
<%-- 							<% --%>
<!-- // 								} -->

<!-- // 								for (int p = startPage; p <= endPage; p++) { -->
<!-- // 									if (p == Integer.parseInt(pageNum)) { -->
<%-- 										%> --%>
<%-- 										&nbsp;<strong title="현재 페이지" id="currentPage"><%=p%></strong> &nbsp;<% --%>
<!-- //  									} else { -->
<%--  										%>&nbsp;<a href="./BoardFaqList.fa?pageNum=<%=p%>"><%=p%></a>&nbsp;<% --%>
<!-- //  									} -->
<!-- //  								} -->

<!-- // 							 	if (endPage < pageCount) { -->
<%--  									%><a --%>
<%-- 									href="./BoardFaqList.fa?pageNum=<%=startPage + pageBlock%>" --%>
<!-- 									class="next"><span class="hide">다음 페이지</span></a> -->
<%-- 								<% --%>
<!-- // 								} -->
<%-- 								%> --%>
								</div>
								 <div class="btn_btm_center">
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
<!-- // $(document).ready(function(){ -->
<%-- <%-- 	var pageNum = "<%=pageNum %>"; --%>
	
<!-- // 	$('.deleteBoard').each(function(index){ -->
<!-- // 		$(this).attr('id','delete'+index); -->
<!-- // 		$('#delete'+index).click(function(){ -->
<!-- // 			var result = confirm('정말 삭제하시겠습니까?'); -->
<!-- // 			if(result){} -->
<!-- // 			else{location.replace("./BoardFaqList.fa?pageNum="+pageNum);	} -->
<!-- // 		}); -->
<!-- // 	}); -->
<!-- // }); -->
</body>
</html>