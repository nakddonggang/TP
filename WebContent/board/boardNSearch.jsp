<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDTO"%>
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
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String search = request.getParameter("search");

		String member_id = (String) session.getAttribute("member_id");

		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
		List<BoardDTO> searchList = (List<BoardDTO>) request.getAttribute("searchList");
	%>
	<!-- board/boardNSearch.jsp Notice 게시판 글 검색 페이지 -->
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

							<h1>Notice</h1>

							<div class="search_bx">
								<form action="./BoardNoticeSearch.no" method="post">
									<input type="text" name="search" placeholder="공지사항을 검색해 보세요."
										class="inp_search"><input type="submit" value="검색"
										class="btn_search">
								</form>
							</div>

							<div class="view_cnt">
								<p>
									Total_<span><%=count%></span>
								</p>
							</div>

							<ul class="brd_txt_lst">
								<!-- 글목록 -->
								<li class="view_lst">
									<%
										if (searchList == null) {
									%><ul>
										<li class="col_tit"><p>게시글이 없습니다</p></li>
									</ul>
									<%
										} else {
											SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
											for (int i = 0; i < searchList.size(); i++) {
												BoardDTO bDTO = searchList.get(i);
												String word = bDTO.getNotice_subject();
												word = word.replaceAll(search, "<mark>" + search + "</mark>");
									%>
									<div class="con_lst DIV_CON_LST">
										<ul>
											<li class="col_type"><a href="#"><p><%=bDTO.getNotice_type()%></p></a></li>
											<li class="col_title"><a href="#"><p><%=word%></p></a></li>
											<li class="col_date"><span class="tit_date">작성일 :&nbsp;</span><span><%=date.format(bDTO.getNotice_date()) %></span></li>
											<li class="col_rc"><a href="#"><%=bDTO.getNotice_readcount()%></a></li>
										</ul>
										
										<div class="con_detail DIV_CON_DETAIL">
											<p><img src="./upload/<%=bDTO.getNotice_file()%>" width="100" height="100"></p>
											<p><%=bDTO.getNotice_content()%></p>
											<div class="file"><span>첨부파일</span><ul><!-- 첨부파일 들어가는 부분 --></ul></div>
											
											<%
												/* if ("admin".equals(member_id)) { */
											%><div class="btn_btm_board">
													<ul>
														<li>
											              <input type="button" value="글수정" class ="btn_type4" onclick="location.href='./BoardNoticeUpdate.no?notice_num=<%=bDTO.getNotice_num()%>&pageNum=<%=pageNum%>'">
												          <input type="button" value="글삭제" class ="btn_type4" onclick="location.href='./BoardNoticeDeleteAction.no?notice_num=<%=bDTO.getNotice_num()%>&pageNum=<%=pageNum%>'">
											   		    </li>
													</ul>
											  </div>
											<%
								             /*   } */
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
												/* if ("admin".equals(member_id)) { */
											%>
											<input type="button" class="btn_type1" value="글쓰기"
												onclick="location.href='./BoardNoticeWrite.no'">
											<%
												/* } */
											%>

			

											<%
												if (pageCount < endPage) endPage = pageCount;

												if (startPage > pageBlock) { %><a href="BoardNoticeSearch.no?pageNum=<%=startPage - pageBlock%>&search=<%=search%>"
												class="prev"><span class="hide">이전 페이지</span></a>
											<% }
												for (int p = startPage; p <= endPage; p++) {
													if (p == Integer.parseInt(pageNum)) {%>&nbsp;<strong title="현재 페이지"><%=p%></strong> &nbsp;<% } 
													else {%> &nbsp;<a href="BoardNoticeSearch.no?pageNum=<%=p%>&search=<%=search%>"><%=p%></a> &nbsp;<% }
												}
												if (endPage < pageCount) {%><a href="BoardNoticeSearch.no?pageNum=<%=startPage + pageBlock%>&search=<%=search%>"
												class="next"><span class="hide">다음 페이지</span></a>
											<% } %>
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