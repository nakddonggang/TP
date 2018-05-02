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

						<h1>
							게시판 글목록 [전체글개수 :
							<%=count%>]
						</h1>
						<table border="1">
							<tr>
								<td>번호</td>
								<td>종류</td>
								<td>제목</td>
								<td>내용</td>
								<td>파일</td>
								<td></td>
							</tr>
							<%
								if (faqList == null) {
							%><tr>
								<td colspan="6">게시물이 없습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < faqList.size(); i++) {
										BoardDTO bDTO = faqList.get(i); //제너릭 사용해서 형변환 할 필요없음
							%>
							<tr>
								<td><%=bDTO.getFaq_num()%></td>
								<td><%=bDTO.getFaq_type()%></td>
								<td><%=bDTO.getFaq_subject()%></td>
								<td><%=bDTO.getFaq_content()%></td>
								<td><img src="./upload/<%=bDTO.getFaq_file()%>" width="100"
									height="100"></td>
								<%
									if ("admin".equals(member_id)) {
								%>
								<td><input type="button" value="글수정"
									onclick="location.href='./BoardFaqUpdate.fa?faq_num=<%=bDTO.getFaq_num()%>&pageNum=<%=pageNum%>'">
									<input type="button" value="글삭제"
									onclick="location.href='./BoardFaqDelete.fa?faq_num=<%=bDTO.getFaq_num()%>&pageNum=<%=pageNum%>'"></td>
							</tr>
							<%
								}
							%>
							
							
							<%
								}
								}
							%>
						</table>
						<%
							if ("admin".equals(member_id)) {
						%><input type="button" value="글쓰기"
							onclick="location.href='./BoardFaqWrite.fa'">
						<%
							}
						%>
						<%
							if (count != 0) {

								//이전
								if (startPage > pageBlock) {
						%><a href="./BoardFaqList.fa?pageNum=<%=startPage - 1%>">[이전]</a>&nbsp;<%
							}

								//1~10	11~20	21~30
								for (int i = startPage; i <= endPage; i++) {
						%>&nbsp;<a href="./BoardFaqList.fa?pageNum=<%=i%>"><%=i%></a>&nbsp;<%
							}

								//다음
								if (endPage < pageCount) {
						%>&nbsp;<a href="./BoardFaqList.fa?pageNum=<%=startPage + pageBlock%>">[다음]</a>
						<%
							}
							}
						%>
					</div>
					<!-- //메인 페이지-->
				</article>

			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>
