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
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer)request.getAttribute("count")).intValue();
		String search = request.getParameter("search");
		
		String member_id = (String) session.getAttribute("member_id");

		String pageNum =  (String)request.getAttribute("pageNum");
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		List<BoardDTO> searchList = (List<BoardDTO>)request.getAttribute("searchList");
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
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class="content">
					
					<h1>Notice [<%=search %>에 대한 검색결과 : <%=count %>]</h1>
					<table border="1">
						<tr><td>번호</td><td>종류</td><td>제목</td><td>내용</td><td>파일</td><td>날짜</td><td>조회수</td><td></td></tr>
						<%
						if(searchList==null){
							%><tr><td colspan="8">게시물이 없습니다.</td></tr><%
						}else{
							for(int i=0; i<searchList.size(); i++){
								BoardDTO bDTO = searchList.get(i);
								String word = bDTO.getNotice_subject();
								word = word.replaceAll(search, "<mark>"+search+"</mark>");
							%>
								<tr><td><%=bDTO.getNotice_num() %></td><td><%=bDTO.getNotice_type() %></td>
									<td><%=word %></td><td><%=bDTO.getNotice_content() %></td>
									<td><img src="./upload/<%=bDTO.getNotice_file()%>" width="100" height="100"></td><td><%=bDTO.getNotice_date() %></td>
									<td><%=bDTO.getNotice_readcount() %></td>
								  <%
									if ("admin".equals(member_id)) {
								  %>
									<td><input type="button" value="글수정" onclick="location.href='./BoardNoticeUpdate.no?notice_num=<%=bDTO.getNotice_num()%>&pageNum=<%=pageNum%>'"> 
										<input type="button" value="글삭제" onclick="location.href='./BoardNoticeDeleteAction.no?notice_num=<%=bDTO.getNotice_num()%>&pageNum=<%=pageNum%>'"></td></tr>
						          <%} %>
						<%	
							}
						}
						%>
					</table>
						<%
						if ("admin".equals(member_id)) {
						%>
					<input type="button" value="글쓰기" onclick="location.href='./BoardNoticeWrite.no'">
					 <%} %>

					<form action="./BoardNoticeSearch.no" method="post">
						<input type="text" name="search"> <input type="submit" value="검색">
					</form>
					
					<%
					if(pageCount < endPage)	endPage = pageCount;
					
					if(startPage > pageBlock)	{ %><a href="BoardNoticeSearch.no?pageNum=<%=startPage-pageBlock%>&search=<%=search%>"class="prev"><span class="hide">이전 페이지</span></a><%	}
					for (int p = startPage; p <= endPage; p++) {	
						if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong title="현재 페이지"><%=p %></strong> &nbsp;<%}
						else {%> &nbsp;<a href="BoardNoticeSearch.no?pageNum=<%=p%>&search=<%=search%>"><%=p %></a> &nbsp;<%}
					}
					if(endPage < pageCount){	%><a href="BoardNoticeSearch.no?pageNum=<%=startPage+pageBlock%>&search=<%=search%>" class="next"><span class="hide">다음 페이지</span></a><% }
					%>
					</div>

				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>