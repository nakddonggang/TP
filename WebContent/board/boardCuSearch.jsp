<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDTO"%>
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
	$("#search").autocomplete({
        source : function(request, response){
					$.ajax({
						type: 'POST',
						url: './BoardCurAjax.cu',
						dataType: 'json',
						data: { 'search' : request.term },
						success: function(data) {
							var jsonData = JSON.parse("["+data+"]");
							response(
								$.map(jsonData, function(item) {
									return {
										label: item.cur_subject,
										value: item.cur_subject
									}
								})
							);
						}
					});
		},
    //조회를 위한 최소글자수
        minLength: 1,
        select:function(event,ui){},
    });
});
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer)request.getAttribute("count")).intValue();
		String search = request.getParameter("search");
		String member_id = (String)session.getAttribute("member_id");

		String pageNum =  (String)request.getAttribute("pageNum");
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		List<BoardDTO> searchList = (List<BoardDTO>)request.getAttribute("searchList");
	%>
<!-- board/boardCuSearch.jsp Curation 게시판 검색 페이지 -->
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">
				
				<!-- 서브메뉴 -->
				<div class="no_sub"></div>
				<!-- //서브메뉴 -->
				
				<!-- 메인 페이지 -->
				<article class="mainmenu_no_sub section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					
					<div class="content">
					  <div class=board>
						  <h3>Curation</h3>
						  <div class="search_bx cur_search">
							<form action="./BoardCurSearch.cu" method="post">
								<input type="text" name="search" id="search" placeholder="큐레이션을 검색해 보세요." class="inp_search"><input type="submit" value="검색" class="btn_search" >
							</form>
						  </div>
						
							<div class="view_cnt">
								<p>Search_<span><%=count %></span></p>
							</div>
				
							<ul class="cu_brd_txt_lst">
								<!-- 글목록 -->
								<li class="view_lst">
								<%
								if(searchList==null){
								%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul><%
								}else{
									SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
									for(int i=0; i<searchList.size(); i++){
									BoardDTO bDTO = searchList.get(i);
									String word = bDTO.getCur_subject();
									word = word.replaceAll(search, "<mark class='pinkMark'>"+search+"</mark>");
								%>
									<div class="con_lst_cu DIV_CON_LST">
									  <ul class="no_scroll" onclick="location.href='./BoardCurContent.cu?cur_num=<%=bDTO.getCur_num()%>&pageNum=<%=pageNum %>'">
									    <li class="cu_lst">
								    		<div class="cu_thm">
								   		 		<img src="./upload/curation/<%=bDTO.getCur_file()%>" width="428" height="197">
									    	</div>
						 				   	<div class="cu_txt">
									    		<h4><%=word %></h4>
						 				   		<p><%=bDTO.getCur_content() %></p>
						 				   		<div class="cu_btm_txt">
						  				  			<span class="tit_date">작성일 :&nbsp;</span><span class="date"><%=date.format(bDTO.getCur_date()) %></span>
						  				  			<span>조회수 <%=bDTO.getCur_readcount() %></span>
						  				  		</div>
						 				   	</div>
										</li>
				       				 </ul>
									</div>
					  				<%	
									}
								}
								%>
				  				</li>
				 			</ul>
						<div class="paginate">
						<%
						if(pageCount < endPage)	endPage = pageCount;
						%>
						<a href="BoardCurSearch.cu?pageNum=1" class="prev2"><span class="hide">[처음]</span></a>
						<%
						if(startPage > pageBlock)	{ %><a href="BoardCurSearch.cu?pageNum=<%=startPage-pageBlock%>" class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong id="currentPage" title="현재 페이지"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="BoardCurSearch.cu?pageNum=<%=p%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){	%><a href="BoardCurSearch.cu?pageNum=<%=startPage+pageBlock%>" class="next"><span class="hide">다음 페이지</span></a><% }
						%>
						<a href="BoardCurSearch.cu?pageNum=<%=pageCount %>" class="next2"><span class="hide">[끝]</span></a>
						 </div>
						 
						 <div class="btn_btm_center1">
						 <%		
						if ("admin".equals(member_id)) {
						%>
						<input type="button"  class="btn_type1" value="글쓰기" onclick="location.href='./BoardCurWrite.cu'">
						<%  }  %>
						 </div>
					
					</div>
							
					</div>

				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>