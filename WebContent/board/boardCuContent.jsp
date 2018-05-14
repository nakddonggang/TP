<%@page import="java.text.SimpleDateFormat"%>
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
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String member_id = (String) session.getAttribute("member_id");
		String pageNum =  (String)request.getAttribute("pageNum");
		BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO");
	%>
<!-- board/boardNews.jsp Notice 게시판  페이지 -->
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				
				<!-- 메인 페이지 -->
				<article class="mainmenu_no_sub section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					
					<div class="content">
						<div class=board>
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							
								<div class="con_lst DIV_CON_LST">
									<ul class="no_scroll">
									<%
									SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
									String cur_content = bDTO.getCur_content();
									cur_content = cur_content.replaceAll("\r\n", "<br>");
									cur_content = cur_content.replaceAll("\u0020", "&nbsp;");
									%>
									
										<li class="cu_col_title"><a href="#"><p><%=bDTO.getCur_subject() %></p></a></li>
										<li class="cu_col_date">작성일 :&nbsp;<span><%=date.format(bDTO.getCur_date()) %></span></li>
										<li class="cu_col_rc"><span class="tit_date">조회수 :&nbsp;</span><span><%=bDTO.getCur_readcount() %></span></li>
										  <div class="cu_col_thm">
								           <img src="./upload/<%=bDTO.getCur_file()%>" width="700" height="700">
								          </div>
								        <p class="cu_col_content"><%=bDTO.getCur_content() %></p>
								        <p class="cu_col_file">첨부파일 :&nbsp;<span><%=bDTO.getCur_file() %></span></p>	
							       
						            </ul>
			
						        </div>
							</li>
						</ul>
						
							   
						
						
					      	          
							<div class="btn_btm_board">
								<ul>
									<li class="btn_con_left">
										<input type="button" class="btn_type4" value="목록" onclick="location.href='./BoardCurList.cu?pageNum=<%=pageNum %>'">
									</li>
									  <%	if("admin".equals(member_id)) {
										%><li class="btn_con_right">
											<input type="button" value="글수정" class ="btn_type4"onclick="location.href='./BoardCurUpdate.cu?cur_num=<%=bDTO.getCur_num()%>&pageNum=<%=pageNum%>'">
											<input type="button" value="글삭제" class ="btn_type4" onclick="location.href='./BoardCurDeleteAction.cu?cur_num=<%=bDTO.getCur_num()%>&pageNum=<%=pageNum%>'">				
										  </li>
										<%	}	%>
								 </ul>
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