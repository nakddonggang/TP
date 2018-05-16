<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String anonymous = "알수없음";
		String member_id = (String)session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO");
		BoardDTO bDTO1 = (BoardDTO)request.getAttribute("bDTO1");
	%>
<!-- board/boardNews.jsp Notice 게시판  페이지 -->
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
					<div class="text_top">
							<h3>Q&A</h3>
							<div class="dl_box">
								<dl>
									<dt>Read It</dt>
									<dd>게시 전 검색을 먼저 해주시고,</dd>
									<dd>타인에 대한 욕설 및 비방글은 삼가주시기 바랍니다.</dd>
								</dl>
							</div>
						</div>
						<div class=board>
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
								<div class="con_lst">
									<ul class="no_scroll">
										<li class="col_con_title"><%=bDTO.getQna_subject() %></li>
									<%
									SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
									String qna_content = bDTO.getQna_content();
									qna_content = qna_content.replaceAll("\r\n", "<br>");
									qna_content = qna_content.replaceAll("\u0020", "&nbsp;");
									%>
									</ul>
									<ul class="no_scroll">
										<%
										if(bDTO.getMember_id()==null){
											%><li class="col_con_id"><p>작성자-<%=anonymous %></p></li><%
										}else{
											%><li class="col_con_id"><p>작성자-<%=bDTO.getMember_id() %></p></li><%
										}
										%>	
										<li class="col_con_avg"><p>조회수-<%=bDTO.getQna_readcount() %></p></li>
										<li class="col_con_date"><p>등록일-<%=date.format(bDTO.getQna_date()) %></p></li>	
									</ul>
										
									<div class="con_detail_block">
										<p><%=qna_content %></p>		
										<%
											if(bDTO.getMember_id()==null){}											
											else{
												if(bDTO.getMember_id().equals(member_id)) {
												%><div class="btn_btm_board">
													<ul>
														<li class="btn_con_right">
															<input type="button" value="글수정" class ="btn_type4" onclick="location.href='./BoardQnaUpdate.qn?qna_num=<%=bDTO.getQna_num()%>&pageNum=<%=pageNum%>'">
															<input type="button" value="글삭제" class ="btn_type4" id="deleteBoard" onclick="location.href='./BoardQnaDeleteAction.qn?qna_num=<%=bDTO.getQna_num()%>&pageNum=<%=pageNum%>'">				
														</li>
													</ul>
												</div>
												<% } %>
										<%	}	%>
									</div>
								</div>
							</li>
						</ul>
						<ul class="brd_txt_lst">
							<li class="view_lst">
								<div class="con_lst">
									<%if(bDTO1!=null){
										%>
									<ul class="no_scroll">
										<li class="col_con_id1"><p>담당자-<%=bDTO1.getRep_name() %></p></li>
										<li class="col_con_email"><p>담당자 연락처-<%=bDTO1.getRep_email() %></p></li>
									</ul>
									<div class="con_detail_block">
										<p><%=bDTO1.getRep_content() %></p>
										<%
											if ("admin".equals(member_id)) {
												%><div class="btn_btm_board">
													<ul>
														<li class="btn_con_right">
															<input type="button"  class="btn_type4" value="답변수정" onclick="location.href='./BoardReplyUpdate.qn?qna_ref=<%=bDTO.getQna_ref() %>&pageNum=<%=pageNum %>'">
															<input type="button"  class="btn_type4" value="답변삭제" id="deleteBoardRe" onclick="location.href='./BoardReplyDeleteAction.qn?qna_ref=<%=bDTO.getQna_ref() %>&pageNum=<%=pageNum %>'">				
														</li>
													</ul>
												</div>
										<%	}	%>
									</div>
									<% } %>
								</div>
							</li>
						</ul>
							<div class="btn_btm_board">
								<ul>
									<li class="btn_con_left">
										<input type="button" class="btn_type4" value="목록" onclick="location.href='./BoardQnaList.qn?pageNum=<%=pageNum %>'">
									</li>
										<%		
										if ("admin".equals(member_id) && bDTO.getQna_check().equals("0")) {
										%>
									<li class="btn_con_right">
										<input type="button"  class="btn_type4" value="답변하기" onclick="location.href='./BoardReply.qn?qna_ref=<%=bDTO.getQna_ref() %>&pageNum=<%=pageNum %>'">
									</li>
										<%} %>
								</ul>
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
$(document).ready(function(){
	var pageNum = "<%=pageNum %>";
	var qna_num = "<%=bDTO.getQna_num() %>";
	
	$("#deleteBoard").click(function(){
		var result = confirm('정말 삭제하시겠습니까?');
		if(result){}
		else{location.replace("./BoardQnaContent.qn?qna_num="+qna_num+"&pageNum="+pageNum); }
	});
	$("#deleteBoardRe").click(function(){
		var result = confirm('정말 삭제하시겠습니까?');
		if(result){}
		else{location.replace("./BoardQnaContent.qn?qna_num="+qna_num+"&pageNum="+pageNum); }
	});
});
</script>
</body>
</html>