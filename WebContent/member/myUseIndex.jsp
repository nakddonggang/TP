<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.book.db.BookDTO"%>
<%@page import="net.member.db.MemberDTO"%>
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
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#useIndexBtn").click(function(){
			if($('.checkbox').is(":checked")==false){
				$.Alert('반납할 책을 선택해 주세요', function(){ });
				return;
			}
			$("#returnBookform").submit();
		});
	});
</script>
	<!-- member/myUseIndex.jsp 이용현황 목록 페이지 -->
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
					<div class="content">
					<%
						String member_id = (String)session.getAttribute("member_id");
					%>
						
					<div class=board>
					<!-- myUseBasket.jsp : 책바구니 -->
						<h4>예약중인 도서목록</h4>
						
							
							<ul class="brd_txt_lst">
							<li class="view_lst">
								<div class="con_lst">
								<ul class="no_scroll title_t">
									<li class="col_mem_r">책 제목</li>
									<li class="col_mem_r">예약번호</li>
									<li class="col_mem_r">예약신청날짜</li>
									<li class="col_mem_r">신청버튼</li>
								</ul>
								</div>							
							
							<%
							List<BookDTO> bList2 = (List<BookDTO>)request.getAttribute("bList2");
							if(bList2.size()==0) {
								%>
								<ul><li class="col_tit"><p>예약중인 도서가 없습니다.</p></li></ul>
								<%
							} else {
								SimpleDateFormat rbook_rdate = new SimpleDateFormat("yyyy-MM-dd");
								for(BookDTO bDTO : bList2) {
									%>
									<div class="con_lst">
										<ul class="no_scroll" onclick="location.href='./MemberMyUseRBookList.me'">
											<li class="col_use"><%=bDTO.getBook_subject() %></li>
											<li class="col_mem_r"><%=bDTO.getRbook_num() %></li>
											<li class="col_mem_r"><%=rbook_rdate.format(bDTO.getRbook_date()) %></li>
											<li class="col_mem_r"><%if(bDTO.getBbook_bstate()==null && bDTO.getRbook_num()==1){
												%><input type="button" value ="대출신청" onclick="location.href='./BorrowBookAction.me?book_number=<%=bDTO.getBook_number()%>'" class="btn_type7">
											<%} %></li>
										</ul>
									</div>
									<%
								}
							}
							%>
							</li>
							</ul>
							
							<div class="btn_btm_center">
								<input type="submit" value="상세보기" class="btn_type5" onclick="location.href='./MemberMyUseRBookList.me'">
							</div>
					</div>
				
					
		
		
					<%
					List<BookDTO> bList = (List<BookDTO>)request.getAttribute("bList");
					%>
					<form action = "./ReturnBookAction.me" method = "post" name ="returnBookform" id="returnBookform">
					<div class=board>
						<!-- myUseBook.jsp : 도서 대출 목록 -->
						<h4>대출중인 도서 목록</h4>
							<ul class="brd_txt_lst">
							<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
								<li class="col_mem_r">목록</li>
								<li class="col_mem_r">책 제목</li>
								<li class="col_mem_r">대출일자</li>
								<li class="col_mem_r">반납할 일자</li>
							</ul>
							</div>
							<%
							if(bList.size()==0) {
								%>
								<ul><li class="col_tit"><p>대여중인 도서가 없습니다.</p></li></ul>
								<%
							} else {
							SimpleDateFormat bbook_bdate = new SimpleDateFormat("yyyy-MM-dd");
							for(BookDTO bDTO :  bList) {
							%>
							<div class="con_lst">
							<ul class="no_scroll" >
								<li class="col_che"><input type="checkbox" name = "returnBookCheckBox"  value ="<%=bDTO.getBook_number() %>" class = "checkbox"></li>
								<li class="col_use"><%=bDTO.getBook_subject() %></li>
								<li class="col_mem_r"><%=bbook_bdate.format(bDTO.getBbook_bdate()) %></li>
								<li class="col_mem_r"><%=bbook_bdate.format(bDTO.getBbook_rdate()) %></li>
							</ul>
							</div>
							<%
							}
						}
							%>
							</li>
						</ul>
						
						<div class="btn_btm_center">		
										<input type = "button" value = "반납하기"  id = "useIndexBtn" class="btn_type5">				
										<input type = "button" value ="대출내역보기"  class="btn_type5" onclick = "location.href ='./MemberMyUseBorrowBookList.me'">
								</div>
						 </div>
						 </form>
					</div>
				</article>
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>