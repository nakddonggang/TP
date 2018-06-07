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
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
List<BookDTO> rbList = (List<BookDTO>)request.getAttribute("rbList");
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
						
							<h1>예약중인 도서 목록</h1>
							<ul class="brd_txt_lst">
								<!-- 글목록 -->
								<li class="view_lst">
								<div class="con_lst">
									<ul class="no_scroll title_t">
										<li class="adm_col_date">번호</li>
										<li class="adm_col_date">사진</li>
										<li class="adm_col_date">제목</li>
										<li class="adm_col_date">저자</li>
										<li class="adm_col_date">예약일자</li>
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
										<li class="adm_col_date"><%=bDTO.getBook_number() %></li>
										<li class="adm_col_date"><img src="./upload/book/<%=bDTO.getBook_file()%>"width="70px" height="80px"></li>
										<li class="adm_col_date"><%=bDTO.getBook_subject() %></li>
										<li class="adm_col_date"><%=bDTO.getBook_author() %></li>
										<li class="adm_col_date"><%=date.format(bDTO.getRbook_date()) %></li>
									</ul>
								</div>
										<%
									}
								}
								%>
					
							</li>
						</ul>
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