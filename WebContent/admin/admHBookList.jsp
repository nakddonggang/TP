<%@page import="net.book.db.BookDTO"%>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
	<%
		String member_id = (String)session.getAttribute("member_id");
		if ((member_id == null) || !(member_id.equals("admin"))) {
			response.sendRedirect("./Main.fp");
		}
	%>
<%
request.setCharacterEncoding("utf-8");
//count, pageNum, boardList, pageCount, pageBlock, startPage, endPage 가져오기
int count = ((Integer)request.getAttribute("count")).intValue();
String pageNum = (String)request.getAttribute("pageNum");
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
List<BookDTO> hbookList = (List<BookDTO>)request.getAttribute("hbookList");
%>
	<div class="wrapper">
		<!-- 본문 컨테이너 -->
		
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
						<div class='join_form adminfo_join_form' >
							<h3>희망도서 신청 목록</h3>
							<p>
								Total_<span><%=count%></span>
							</p>
						<div class="adm">			
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
							<ul class="no_scroll title_t">
								<li class="adm_col_rch">아이디</li>
								<li class="adm_col_dateh">도서명</li>
								<li class="adm_col_nameh">저자</li>
								<li class="adm_col_rch">처리상태</li>
								<li class="adm_col_typeh">발행처</li>
								<li class="adm_col_exh">국제표준번호</li>
							</ul>
							</div>
						<%
							if (count == 0) {
						%><ul>
							<li class="col_tit"><p>희망도서 신청 목록이 없습니다</p></li>
						</ul>
						<%
							} else {
								for (BookDTO hbookLists : hbookList){
						%>
						<div class="con_lst">
							<ul class="no_scroll" onclick="location.href='./AdminHBookWrite.am?member_id=<%=hbookLists.getMember_id()%>&hbook_subject=<%=hbookLists.getHbook_subject()%>&hbook_author=<%=hbookLists.getHbook_author()%>'">
								<li class="adm_col_rch"><%=hbookLists.getMember_id()%></li>
								<li class="adm_col_dateh"><%=hbookLists.getHbook_subject()%></li>
								
								<li class="adm_col_nameh"><%=hbookLists.getHbook_author()%></li>
								<li class="adm_col_rch"><%=hbookLists.getHbook_check()%></li>
								<li class="adm_col_typeh"><%=hbookLists.getHbook_publisher()%></li>
								<li class="adm_col_exh"><%=hbookLists.getHbook_isbn()%></li>
							</ul>
						</div><%}
						}%>
							</li>
						</ul>
								
				
				<div class="paginate">
						 
							<% // count = 전체 글의 개수
							if (count != 0) {
							// 이전페이지 // if (startPage와 pageBlock을 비교)
							if (startPage > pageBlock) {
							%><a href="./AdminHBookList.am?pageNum=<%=startPage - pageBlock%>"class="prev"><span class="hide">이전 페이지</span></a><%
							}
							// 1~10		11~20		21~30
							for (int i = startPage; i <= endPage; i++) {%>
								<a href="./AdminHBookList.am?pageNum=<%=i%>">&nbsp;<strong title="현재 페이지" id="currentPage"><%=i %></strong> &nbsp;</a><%		
							}
								// 다음 // if (endPage와 pageCount를 비교)
							if (endPage<pageCount){%>
								<a href="./AdminHBookList.am?pageNum=<%=startPage+pageBlock%>"class="next"><span class="hide">다음 페이지</span></a><%
								}
							} // if count 괄호 %>		
						</div>
						
				<div class="btn_btm_center">
				<ul>
					<li class="btn_cancle">
						<input type="button" value="도서관리페이지" onclick="location.href='./AdminIndex.am'" class ="btn_type4 BTN_IF_LIST">
					</li>
				</ul>
				</div>
			
				
					
					</div>
				</div>
				</div>
			</article>

		</section>
		
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>