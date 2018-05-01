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
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer)request.getAttribute("count")).intValue();
		String id = (String)session.getAttribute("id");

		String pageNum =  (String)request.getAttribute("pageNum");
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		List<BoardDTO> qnaList = (List<BoardDTO>)request.getAttribute("qnaList");
	%>
<!-- board/boardQna.jsp Q&A 게시판 페이지 -->
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
					<div class=""></div>
			
					<h1>Q&A [전체글개수 : <%=count %>]</h1>
					<table border="1">
						<tr><td>번호</td><td>작성자</td><td>제목</td><td>내용</td><td>작성일</td><td>조회수</td><td>답변유무</td><td></td></tr>
						<%
						if(qnaList==null){
							%><tr><td colspan="8">게시물이 없습니다.</td></tr><%
						}else{
							for(int i=0; i<qnaList.size(); i++){
								BoardDTO bDTO = qnaList.get(i);
								String check = bDTO.getQna_check();
								if(check.equals("1")){check="답변완료";}
								else {check="답변대기";}
								%>
								<tr><td><%=bDTO.getQna_num() %></td><td><%=id %></td>
								<td><%=bDTO.getQna_subject() %></td><td><%=bDTO.getQna_content() %></td>
								<td><%=bDTO.getQna_date() %></td><td><%=bDTO.getQna_readcount() %></td>
								<td><%=check %></td>
								<td><input type="button" value="글수정" onclick="location.href='./BoardQnaUpdate.qn?qna_num=<%=bDTO.getQna_num()%>&pageNum=<%=pageNum%>'"> 
									<input type="button" value="글삭제" onclick="location.href='./BoardQnaDeleteAction.qn?qna_num=<%=bDTO.getQna_num()%>&pageNum=<%=pageNum%>'">
									<input type="button" value="답변하기" onclick="location.href='./BoardReply.qn?qna_ref=<%=bDTO.getQna_ref() %>&pageNum=<%=pageNum %>'"></td></tr>
								<tr><td><%=bDTO.getRep_name() %></td><td colspan="3"><%=bDTO.getRep_email() %></td><td colspan="3"><%=bDTO.getRep_content() %></td>
								<td><input type="button" value="답변수정" onclick="location.href='./BoardReplyUpdate.qn?qna_num=<%=bDTO.getQna_num()%>&pageNum=<%=pageNum%>&qna_ref=<%=bDTO.getQna_ref() %>'"> 
									<input type="button" value="답변삭제" onclick="location.href='./BoardReplyDeleteAction.qn?qna_ref=<%=bDTO.getQna_ref()%>&pageNum=<%=pageNum%>'">
								</td></tr>
						<%	
							}
						}
						%>
					</table>

					<input type="button" value="글쓰기" onclick="location.href='./BoardQnaWrite.qn'">
					<form action="./BoardQnaSearch.qn" method="post">
						<input type="text" name="search"> <input type="submit" value="검색">
					</form>
					
					<%
						if(pageCount < endPage)	endPage = pageCount;
							
						if(startPage > pageBlock)	{ %><a href="BoardQnaList.qn?pageNum=<%=startPage-pageBlock%>"class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%><strong title="현재 페이지"><%=p %></strong>><%}
							else {%><a href="BoardQnaList.qn?pageNum=<%=p%>"><%=p %></a><%}
						}
						if(endPage < pageCount){	%><a href="BoardQnaList.qn?pageNum=<%=startPage+pageBlock%>" class="next"><span class="hide">다음 페이지</span></a><% }
					%>

				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>