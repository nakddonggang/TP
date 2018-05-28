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
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<style type="text/css">
#count {position: relative; top:10px; right: 10px;}
</style>
</head>
<%
request.setCharacterEncoding("UTF-8");
String pageNum =  (String)request.getAttribute("pageNum");
List<BoardDTO> noticeList = (List<BoardDTO>)request.getAttribute("noticeList");
List<BoardDTO> curationList = (List<BoardDTO>)request.getAttribute("curationList");
List<BookDTO> popularList = (List<BookDTO>)request.getAttribute("popularList");
String member_id = (String)session.getAttribute("member_id");
%>
<body>
<script type="text/javascript">
$(document).ready(function(){
	var member_id = "<%=member_id %>";
	$.ajax({
		url:"./MemberBbookCheck.me",
		type:'POST',
		data:{'member_id':member_id},
		success:function(result){
			if(result != "0"){
				$('#alarm').click(function(){
					$('#dialog').html('2일 이내 반납해야할 책 '+result+'권입니다.');
					$('#dialog').dialog({
						width:450,
						height:180,
						show:'slide',
						hide:'slide',
						buttons:[{
							text:"확인",
							click: function(){
								$(this).dialog("close");
							}
						}]
					});
				});
			}
		}
	});
});
</script>
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
<<<<<<< HEAD
				
		<!-- 	인기도서	 -->
				<div class="">
					<%
						for(int i=0; i<popularList.size(); i++){
							BookDTO bkDTO = popularList.get(i);
							%>
							<ol>
								<li>제목 : <%=bkDTO.getBook_subject() %></li>
								<li>저자 : <%=bkDTO.getBook_author() %></li>
								<li>발행처 : <%=bkDTO.getBook_publisher() %></li>
								<li>발행일 : <%=bkDTO.getBook_pubDate() %></li>
							</ol>
							<br>
=======
					
					<!-- 공지사항 -->
					<div class="">
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
>>>>>>> dc6ead9550b079a31b45114bca8d532110cf9160
							<%
						}
					%>		
				</div>
					
 			<!--  통계   -->
					
					
					
					
					
					
					
					
					
					<!-- 큐레이션 -->
					<div class="">
					<table border="1">
						<tr><td>번호</td><td>종류</td><td>작성자</td><td>제목</td><td>내용</td><td>파일</td><td>조회수</td><td></td></tr>
						<%
						if(curationList==null){
							%><tr><td colspan="8">게시물이 없습니다.</td></tr><%
						}else{
							for(int i=0; i<curationList.size(); i++){
								BoardDTO bDTO = curationList.get(i);
							%>
								<tr onclick="location.href='./?curNum=<%=bDTO.getCur_num()%>&pageNum=<%=pageNum%>">
								<td><%=bDTO.getCur_num() %></td><td><%=bDTO.getCur_type() %></td>
									<td><%=bDTO.getCur_name() %></td><td><%=bDTO.getCur_subject() %></td>
									<td><%=bDTO.getCur_content() %></td><td><img src="./upload/<%=bDTO.getCur_file()%>" width="100" height="100"></td>
									<td><%=bDTO.getCur_readcount() %></td>
							<%	
							}
						}
						%>
					</table>
					</div> 
					
		<!-- 	공지사항		 -->
					<div class="">
						<div class="brd_txt_lst">
							<!-- 글목록 -->
							<div class="view_lst">
							<%
								if(noticeList==null){	%><ul><div class="col_tit"><p>게시글이 없습니다</p></div></ul><%	}
								else{
									for(int i=0; i<noticeList.size(); i++){
										BoardDTO bDTO = noticeList.get(i);	//제너릭 사용해서 형변환 할 필요없음
									%>
										<div class="con_lst DIV_CON_LST">
											<div>
												<div class="col_type"><a href="#"><p><%=bDTO.getNotice_type() %></p></a></div>
												<div class="col_title"><a href="#"><p><%=bDTO.getNotice_subject() %></p></a></div>
												<div class="col_date"><span class="tit_date">작성일 :&nbsp;</span><span><%=bDTO.getNotice_date() %></span></div>
												<div class="col_rc"><a href="#"><%=bDTO.getNotice_readcount() %></a></div>
											</div>
											
											<div class="con_detail DIV_CON_DETAIL">
												<p><%=bDTO.getNotice_content() %></p>		
											</div>
										</div>
									<%	}	%>
								<%	}	%>
							</div>
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