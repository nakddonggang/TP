<%@page import="net.book.db.BookDTO"%>
<%@page import="net.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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
<%
request.setCharacterEncoding("UTF-8");
String pageNum =  (String)request.getAttribute("pageNum");
List<BoardDTO> noticeList = (List<BoardDTO>)request.getAttribute("noticeList");
List<BoardDTO> curationList = (List<BoardDTO>)request.getAttribute("curationList");
List<BookDTO> popularList = (List<BookDTO>)request.getAttribute("popularList");
String member_id = (String)session.getAttribute("member_id");
if(member_id != null) {
	boolean admincheck = (boolean)session.getAttribute("admincheck");
} else {
	session.removeAttribute("admincheck");
}
%>


<body>
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
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
				<div class="content">
				
			<!-- 	인기도서	 -->
				<div class="main_conpop main_div">
					<%
					if(popularList==null){
						%><ul><li>게시물이 없습니다.</li></ul><%
					}else{
						for(int i=0; i<popularList.size(); i++){ 
						BookDTO bkDTO = popularList.get(i);
						%><ul>
							<li>제목 : <%=bkDTO.getBook_subject() %></li>
							<li>저자 : <%=bkDTO.getBook_author() %></li>
							<li>발행처 : <%=bkDTO.getBook_publisher() %></li>
							<li>발행일 : <%=bkDTO.getBook_pubDate() %></li>
						</ul><%
						}
					}%>		
				</div>
					
 			<!--  통계   -->
 			
		
			<!-- 큐레이션 -->
					<div class="main_concur main_div">
					<div class="main_box">
					 <h2>Events</h2>
					<ul>
						<%
						if(curationList==null){
							%><li>게시물이 없습니다.</li><%
						}else{ 
							for(int i=0; i<curationList.size(); i++){
								BoardDTO bDTO = curationList.get(i);
							%>
								<li onclick="location.href='./?curNum=<%=bDTO.getCur_num()%>&pageNum=<%=pageNum%>">
								  <div class="main_box_img">
								  	<img src="./upload/<%=bDTO.getCur_file()%>" width="100" height="100">
								  </div>
								  <div class="main_box_tit">
								  <p class=tit><%=bDTO.getCur_subject() %></p>
								  <p class=disc><%=bDTO.getCur_content() %></p>
								  </div>
							    </li>	
							<%	
							}
						}
						%>
					</ul>
					</div>
					</div> 	
			<!-- 	공지사항		 -->
					<div class="main_connot main_div">
					<div class="main_box">
						<h2>Notice</h2>
						<ul>
							<!-- 글목록 -->
							<li>
							<%
								if(noticeList==null){	%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul><%	}
								else{
									for(int i=0; i<noticeList.size(); i++){
										BoardDTO bDTO = noticeList.get(i);	//제너릭 사용해서 형변환 할 필요없음
									%>
									<li>
									 <a href="#">
										<p class="tit"><%=bDTO.getNotice_type() %>     <%=bDTO.getNotice_subject() %></p>
									    <span class="date"><%=bDTO.getNotice_date() %></span>
									</a>	
										</li>
									<%	}	%>
								<%	}	%>
							
						</ul>
						</div>
					</div>
					 
				</div>
				<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>