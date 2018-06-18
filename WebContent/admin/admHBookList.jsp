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
<script src="<c:url value="/js/jQuery.Alert-1.0.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script>
function hb_delete(){
		$.Confirm(
			'희망도서를 삭제하시겠습니까?', function(){
				$('#hbdelete_fr').attr("action","./ADminHBookDelete.am");
				$('#hbdelete_fr').submit(); });
}
</script>
</head>
<body>
	<%
	String member_id = (String) session.getAttribute("member_id");
	if (member_id == null) {
		boolean admincheck = (boolean) session.getAttribute("admincheck");
		if(admincheck == false) {
				response.sendRedirect("./Main.fp");
		}
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
						<div class='adminfo_join_form' >
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
								<li class="admh_id">아이디</li>
								<li class="admh_ten">도서명</li>
								<li class="admh_ten">저자</li>
								<li class="admh_num">처리상태</li>
								<li class="admh_ten">발행처</li>
								<li class="adm_isbn">국제표준번호</li>
								<li class="admh_id">삭제</li>
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
						<form action="" method="post" id="hbdelete_fr">
						<input type="hidden" value="<%=hbookLists.getHbook_subject()%>" name="hbook_subject">
						<input type="hidden" value="<%=hbookLists.getHbook_author()%>" name="hbook_author">
						<input type="hidden" value="<%=hbookLists.getMember_id()%>" name="member_id">
						<div class="con_lst">
							<ul class="no_scroll" >
								<li class="admh_id" id="admh_book_high" onclick="location.href='./AdminHBookWrite.am?member_id=<%=hbookLists.getMember_id()%>&hbook_subject=<%=hbookLists.getHbook_subject()%>&hbook_author=<%=hbookLists.getHbook_author()%>'"><%=hbookLists.getMember_id()%></li>
								<li class="admh_ten over_dot"  id="admh_book_high" onclick="location.href='./AdminHBookWrite.am?member_id=<%=hbookLists.getMember_id()%>&hbook_subject=<%=hbookLists.getHbook_subject()%>&hbook_author=<%=hbookLists.getHbook_author()%>'"><%=hbookLists.getHbook_subject()%></li>								
								<li class="admh_ten over_dot"  id="admh_book_high" onclick="location.href='./AdminHBookWrite.am?member_id=<%=hbookLists.getMember_id()%>&hbook_subject=<%=hbookLists.getHbook_subject()%>&hbook_author=<%=hbookLists.getHbook_author()%>'"><%=hbookLists.getHbook_author()%></li>
								<li class="admh_num"  id="admh_book_high" onclick="location.href='./AdminHBookWrite.am?member_id=<%=hbookLists.getMember_id()%>&hbook_subject=<%=hbookLists.getHbook_subject()%>&hbook_author=<%=hbookLists.getHbook_author()%>'">
								<%if(hbookLists.getHbook_check().equals("wait")){ %>대기 <%}
								else if(hbookLists.getHbook_check().equals("in")){ %> 입고됨 <%}
								else if(hbookLists.getHbook_check().equals("not-in")) {%>입고불가 <%}%></li>
								<li class="admh_ten over_dot"  id="admh_book_high" onclick="location.href='./AdminHBookWrite.am?member_id=<%=hbookLists.getMember_id()%>&hbook_subject=<%=hbookLists.getHbook_subject()%>&hbook_author=<%=hbookLists.getHbook_author()%>'"><%=hbookLists.getHbook_publisher()%></li>
								<li class="adm_isbn" id="admh_book_high" ><%=hbookLists.getHbook_isbn()%></li>
								<li class="admh_id" id="admh_book_high" ><input type='button' onclick="hb_delete();" class='hb_button' value='삭제하기'></li>
							</ul>
						</div>
						</form><%}
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
					<li class="adm_btn_cancle">
								<input type="button" value="입고하기" onclick="location.href='./AdminBookWrite.am'" class ="btn_type4 BTN_IF_LIST">
					</li>
					<li class="adm_btn__left">
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