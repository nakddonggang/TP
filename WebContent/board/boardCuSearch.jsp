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
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				
				<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					
					<h1>Curation [검색결과 : <%=count %>]</h1>
					<table border="1">
						<tr><td>번호</td><td>종류</td><td>작성자</td><td>제목</td><td>내용</td><td>파일</td><td>조회수</td><td></td></tr>
					<%
						for(int i=0; i<searchList.size(); i++){
							BoardDTO bDTO = searchList.get(i);
							String word = bDTO.getCur_subject();
							word = word.replaceAll(search, "<mark>"+search+"</mark>");
					%>
						<tr><td><%=bDTO.getCur_num() %></td><td><%=bDTO.getCur_type() %></td><td><%=bDTO.getCur_name() %></td>
							<td><%=word %></td><td><%=bDTO.getCur_content() %></td>
							<td><img src="./upload/<%=bDTO.getCur_file()%>" width="100" height="100"></td>
							<td><%=bDTO.getCur_readcount() %></td>
							<td><input type="button" value="글수정" onclick="location.href='./BoardCurUpdate.cu?cur_num=<%=bDTO.getCur_num()%>&pageNum=<%=pageNum%>'"> 
								<input type="button" value="글삭제" onclick="location.href='./BoardCurDelete.cu?cur_num=<%=bDTO.getCur_num()%>&pageNum=<%=pageNum%>'"></td></tr>
					<%	
						}
					%>
					</table>
					
					<input type="button" value="글쓰기" onclick="location.href='./BoardCurWrite.cu'">

					<form action="./BoardCurSearch.cu" method="post">
						<input type="text" name="search"> <input type="submit" value="검색">
					</form>
	
					<%
					if(count != 0){
		
						//이전
						if(startPage > pageBlock){
						%><a href="./BoardCurSearch.cu?pageNum=<%=startPage-1 %>&search=<%=search %>">[이전]</a>&nbsp;<%
						}
	
						//1~10	11~20	21~30
						for(int i=startPage; i<=endPage; i++){
						%>&nbsp;<a href="./BoardCurSearch.cu?pageNum=<%=i %>&search=<%=search %>"><%=i %></a>&nbsp;<%
						}
	
						//다음
						if(endPage < pageCount){
						%>&nbsp;<a href="./BoardCurSearch.cu?pageNum=<%=startPage+pageBlock %>&search=<%=search %>">[다음]</a><%
						}
					}
					%>

				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>