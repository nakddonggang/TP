<%@page import="net.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.member.action.MemberBasketList"%>
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
<body>
<%
	List MemberBasketList = (List)request.getAttribute("bList");
%>
	<!-- member/myUseBasket.jsp / MyUseIndex >> 책바구니 페이지 -->
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
						
						<h1>책 바구니</h1>
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
									<li class="col_num">책 번호</li>
									<li class="col_id">예약번호</li>
									<li class="col_title">대출신청/삭제</li>
								</ul>
							</div>
							<%
							if(MemberBasketList==null){	%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul><%	}
							else{
								for(int i=0; i<MemberBasketList.size(); i++){
									MemberDTO mDTO = (MemberDTO)MemberBasketList.get(i);
									%>
									<div class="con_lst">
										<ul>
											<li class="col_num"><%=mDTO.getBook_number() %></li>
											<li class="col_id"><%=mDTO.getBasket_number() %></li>
											<li class="col_title">대출신청/삭제</li>
										</ul>
									</div>
								<%
								}
							}
							%>
							</li>
						</ul>

						<div>
							<input type="button" value="선택한 도서 예약하기"> 
							<input type="button" value="삭제하기">
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