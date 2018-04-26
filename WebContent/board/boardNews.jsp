<%@page import="net.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer)request.getAttribute("count")).intValue();

		String pageNum =  (String)request.getAttribute("pageNum");
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		List<BoardDTO> board = (List<BoardDTO>)request.getAttribute("board");
		
		if (pageNum == null) 	pageNum = "1";
	%>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- top_link -->
		<jsp:include page="../include/topmenu.jsp" />
		<!-- //top_link -->

		<!-- container -->
		<div class="container">
			<section class="sub_con_half SEC_HALF">
				<h2 class="hide">Title</h2>
				<article>
					<!-- left_content -->
					<jsp:include page="../include/submenu.jsp" />
					<!-- //left_content -->
	
					<!-- right content -->
					<div class="rgt_con">
						<div class="rgt_con_txt">
							<h3>공지사항</h3>
							
							<!-- 리스트 -->
							<div class="lst_bx">
							
								<!-- 검색 -->
								<div class="search_bx">
									<input type="text" placeholder="공지사항을 검색해 보세요." class="inp_search" id="TXT_SEARCH_VALUE" value="" onkeydown="if (event.keyCode == 13) SearchPage();" /> 
									<input type="button" value="검색" class="btn_search" onclick="SearchPage()" />
								</div>
								<!-- //검색 -->
								
								<!-- 조회수 -->
								<div class="view_cnt">
									<p>Total_<span>28</span></p>
								</div>
								<!-- //조회수 -->
								
								<ul class="brd_txt_lst">
									<!-- 글목록 -->
									<li class="view_lst">
									<%
										for (BoardDTO bDTO : board) {
											out.print(
													"<div class='con_lst DIV_CON_LST'>" + 
														"<ul>" + 
															"<li class='col_tit'><a href='#'><p>" + bDTO.getCur_num() + "</p><p>" + bDTO.getCur_subject() + "</p></a></li>" +
															"<li class='col_date'><span class='tit_date'>조회수 : </span><span>"  + bDTO.getCur_readcount() +"</span></li>" + 
															"<li class='col_date'><span class='tit_date'>작성자 : </span><span>"  + bDTO.getCur_name() +"</span></li>" + 
															"<li class='col_date'><span class='tit_date'>타입 : </span><span>"  + bDTO.getCur_type() +"</span></li>" + 
														"</ul>" + 
														"<div class='con_detail DIV_CON_DETAIL'>" + 
															"<p>" + 
																"<p>"	+ bDTO.getCur_content() + "</p>" + 
																"<p>이미지 첨부<img src='" + bDTO.getCur_file() + "' style='height: 528px; width: 753px' /></p>" + 
															"</p>" + 
														"</div>" + 
													"</div>"
											);
										}
									%>
									</li>
									<!-- //글목록 -->
								</ul>
							</div>
							<!-- //리스트 -->

							<!-- 페이징 작업부분 -->
							<div class="paginate pc_pg">
							<%
								if(pageCount < endPage)	endPage = pageCount;
							
								if(startPage > pageBlock)	{ %><a href="BoardList.bo?pageNum=<%=startPage-pageBlock%>"class="prev"><span class="hide">이전 페이지</span></a><%	}
								for (int p = startPage; p <= endPage; p++) {	
									if(p==Integer.parseInt(pageNum)) {%><strong title="현재 페이지"><%=p %></strong>><%}
									else {%><a href="BoardList.bo?pageNum=<%=p%>"><%=p %></a><%}
								}
								if(endPage < pageCount){	%><a href="BoardList.bo?pageNum=<%=startPage+pageBlock%>" class="next"><span class="hide">다음 페이지</span></a><% }
							%>
							</div>
							<!-- //페이징 작업부분 -->
							
						</div>
					</div>
					<!-- //right content -->
				</article>
			</section>
		</div>
	</div>
</body>
</html>