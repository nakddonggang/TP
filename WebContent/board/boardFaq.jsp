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
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet"	type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
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
							<h1>FAQ</h1>
							<div class="view_cnt">
								<p>Total_<span><%=count%></span></p>
							</div>
							<p class="sub_txt">도서관 이용에 관한 궁금한 점은 "FAQ"에서 먼저 확인하시고, 추가로 문의할 내용은 "Q&A"에서 작성하시기 바랍니다</p>

							<ul class="brd_txt_lst">
								<!-- 글목록 -->
								<li class="view_lst">
								<%
									if (faqList == null) {
								%><ul>
									<li class="col_tit"><p>게시글이 없습니다</p></li>
								</ul>
								<%
 								} else {
 									for (int i = 0; i < faqList.size(); i++) {
 										BoardDTO bDTO = faqList.get(i); //제너릭 사용해서 형변환 할 필요없음
 										String faq_content = bDTO.getFaq_content();
										faq_content = faq_content.replaceAll("\r\n", "<br>");
										faq_content = faq_content.replaceAll("\u0020", "&nbsp;");
 										String file = "";
 								%>
									<div class="con_lst DIV_CON_LST">
										<ul>
											<li class="col_rc"><a href="#"><%=bDTO.getFaq_num()%></a></li>
											<li class="col_type"><a href="#"><p><%=bDTO.getFaq_type()%></p></a></li>
											<li class="col_title"><a href="#"><p><%=bDTO.getFaq_subject()%></p></a></li>
										</ul>

										<div class="con_detail DIV_CON_DETAIL">
											<%if(bDTO.getFaq_file()!=null){
												file = bDTO.getFaq_file();
												%><p><img src="./upload/<%=bDTO.getFaq_file()%>" width="100" height="100"></p><%
											}
											%>
											<p><%=bDTO.getFaq_content()%></p>
											<div class="file"><span>첨부파일</span><ul><%=file %></ul></div>
											<%
												if ("admin".equals(member_id)) {
											%><div class="btn_btm_board">
												<ul>
													<li class="btn_con_right">
														<input type="button" class="btn_type4" value="글수정"
														onclick="location.href='./BoardFaqUpdate.fa?faq_num=<%=bDTO.getFaq_num()%>&pageNum=<%=pageNum%>'">
														<input type="button" class="btn_type4 deleteBoard" value="글삭제"
														onclick="location.href='./BoardFaqDelete.fa?faq_num=<%=bDTO.getFaq_num()%>&pageNum=<%=pageNum%>'">
													</li>
												</ul>
											</div>
											<%
												}
											%>
										</div>
									</div>
									<%
 									}
							 	}
 								%>
								</li>
							</ul>
								<%
								if ("admin".equals(member_id)) {
								%>
								<input type="button" class="btn_type1" value="글쓰기"	onclick="location.href='./BoardFaqWrite.fa'">
								<%
								}
								%>
							<%
								if (pageCount < endPage) endPage = pageCount;
								if (startPage > pageBlock) {
							%><a
								href="./BoardFaqList.fa?pageNum=<%=startPage - pageBlock%>"
								class="prev"><span class="hide">이전 페이지</span></a>
							<%
								}

								for (int p = startPage; p <= endPage; p++) {
									if (p == Integer.parseInt(pageNum)) {
										%>
										&nbsp;<strong title="현재 페이지" id="currentPage"><%=p%></strong> &nbsp;<%
 									} else {
 										%>&nbsp;<a href="./BoardFaqList.fa?pageNum=<%=p%>"><%=p%></a>&nbsp;<%
 									}
 								}

							 	if (endPage < pageCount) {
 									%><a
									href="./BoardFaqList.fa?pageNum=<%=startPage + pageBlock%>"
									class="next"><span class="hide">다음 페이지</span></a>
								<%
								}
								%>
						</div>
					</div>

				</article>
				<!-- //메인 페이지-->
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
<script type="text/javascript">
$(document).ready(function(){
	var pageNum = "<%=pageNum %>";
	
	$('.deleteBoard').each(function(index){
		$(this).attr('id','delete'+index);
		$('#delete'+index).click(function(){
			var result = confirm('정말 삭제하시겠습니까?');
			if(result){}
			else{location.replace("./BoardFaqList.fa?pageNum="+pageNum);	}
		});
	});
});
</script>
</body>
</html>