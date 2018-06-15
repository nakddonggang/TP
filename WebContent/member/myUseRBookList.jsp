<%@page import="java.util.List"%>
<%@page import="net.book.db.BookDTO"%>
<%@page import="net.member.action.MemberMyUseBookList"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	$('.cancelRes').each(function(index){
		$(this).attr('id','cancelRes'+index);
		$('#cancelRes'+index).click(function(){
			$.Confirm(
				'정말 취소하시겠습니까?',
				function(){
					location.href = './CancelReservation.me?book_number=' + $('#cancelRes'+index).attr('rel') + '&pageNum=${pageNum}';
				}
			);
		});
	});
	
	$('.borrow').each(function(index){
		$(this).attr('id','borrow'+index);
		$('#borrow'+index).click(function(){
			$.Confirm(
				'대출신청 하시겠습니까?',
				function(){
					location.href = './BorrowBookAction.me?book_number=' + $('#borrow'+index).attr('rel') + '&pageNum=${pageNum}';
				}
			);
		});
	});
});
</script>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
List<BookDTO> rbList = (List<BookDTO>)request.getAttribute("rbList");
int count = ((Integer)request.getAttribute("count")).intValue();
String member_id = (String) session.getAttribute("member_id");
String pageNum =  (String)request.getAttribute("pageNum");
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
%>
 <!-- member/myUseBook.jsp / MyUseIndex >> 대출예약조회 페이지 -->
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
						
							<h3>예약중인 도서</h3>
							<div class="view_cnt">
							<p>Total_<span><%=count %></span></p>
							</div>
							<ul class="brd_txt_lst">
								<!-- 글목록 -->
								<li class="view_lst">
								<div class="con_lst">
									<ul class="no_scroll title_t">
										<li class="my_p">사진</li>
										<li class="my_p">제목</li>
										<li class="my_p">저자</li>
										<li class="my_p">예약일자</li>
										<li>신청버튼</li>
									</ul>
								</div>
					
								<%
								if(rbList.size()==0){%><ul><li class="col_tit"><p>예약중인 도서가 없습니다.</p></li></ul><%	}
								else{
									SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
									for(int i=0; i<rbList.size(); i++){
										BookDTO bDTO =(BookDTO)rbList.get(i);
										%>					
								<div class="con_lst">
									<ul class="no_scroll">
									
										<li class="my_p"><a href="./BookInfo.bk?book_number=<%=bDTO.getBook_number() %>"><img src="./upload/book/<%=bDTO.getBook_file()%>"width="70px" height="80px"></a></li>
										<li class="my_ppp"><a href="./BookInfo.bk?book_number=<%=bDTO.getBook_number() %>"><%=bDTO.getBook_subject() %></a></li>
										<li class="my_pp"><a href="./BookInfo.bk?book_number=<%=bDTO.getBook_number() %>"><%=bDTO.getBook_author() %></a></li>
										<li class="my_pp"><a href="./BookInfo.bk?book_number=<%=bDTO.getBook_number() %>"><%=date.format(bDTO.getRbook_date()) %></a></li>
										<li><input type="button" value="예약취소" id="" class="cancelRes" rel="<%=bDTO.getBook_number() %>">
										<%if(bDTO.getBbook_bstate()==null && bDTO.getRbook_num()==1){
												%><input type="button" value ="대출신청" id="" class="borrow" rel="<%=bDTO.getBook_number() %>">
											<%} %></li>
									</ul>
								</div>
										<%
									}
								}
								%>
					
							</li>
						</ul>
						
					<div class="paginate">
						
						<a href="./MemberMyUseRBookList.me?pageNum=1" class="prev2"><span class="hide">페이지처음</span></a>
						<%
						if(pageCount < endPage)	endPage = pageCount;
						if(startPage > pageBlock)	{ %><a href="./MemberMyUseRBookList.me?pageNum=<%=startPage - pageBlock%>" class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong id="currentPage" title="현재 페이지"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="./MemberMyUseRBookList.me?pageNum=<%=p%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){	%><a href="./MemberMyUseRBookList.me?pageNum=<%=startPage+pageBlock%>" class="next"><span class="hide">다음 페이지</span></a><% }
						%>
						<a href="./MemberMyUseRBookList.me?pageNum=<%=pageCount%>" class="next2"><span class="hide">페이지끝</span></a>
				  </div>
						 
						 <div class="btn_btm_center">
					
						<input type="button"  class="btn_type5" value="목록" onclick="location.href='./MemberUseIndex.me'">
						
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