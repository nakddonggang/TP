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
				
				<!-- 서브메뉴 -->
				<div class="no_sub"></div>
				<!-- //서브메뉴 -->
				
				<!-- 메인 페이지 -->
				<article class="mainmenu_no_sub section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					
					<div class="content">
						<div class="board">
						<h3>Curation</h3>
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							
								<div class="con_lst">
									<ul class="no_scroll">
									<%
									SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
									String cur_content = bDTO.getCur_content();
									cur_content = cur_content.replaceAll("\r\n", "<br>");
									cur_content = cur_content.replaceAll("\u0020", "&nbsp;");
									%>
									
										<li class="cu_col_title"><%=bDTO.getCur_subject() %></li>
										<li class="cu_col_date">작성일 :&nbsp;<span><%=date.format(bDTO.getCur_date()) %></span></li>
										<li class="cu_col_rc"><span class="tit_date">조회수 :&nbsp;</span><span><%=bDTO.getCur_readcount() %></span></li>
									</ul>	
									<div class="cu_col_thm">
								    	<img src="./upload/curation/<%=bDTO.getCur_file()%>" width="700" height="700">
								    	<p class="cu_col_content"><%=cur_content%></p>
								    </div>
<!-- 								    <div class="file"> -->
<%-- 								    	<p class="cu_col_file">첨부파일 :&nbsp;<span><%=bDTO.getCur_file() %></span></p> --%>
<!-- 								    </div> -->
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
											<input type="button" value="글삭제" id="deleteBoard" class ="btn_type4" rel="<%=bDTO.getCur_num()%>">				
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
	
<script type="text/javascript">
$(document).ready(function(){
	var pageNum = "${pageNum}";
	
	$("#deleteBoard").click(function(){
		$.Confirm(
			'정말 삭제하시겠습니까?',
			function(){
				location.href = './BoardCurDeleteAction.cu?cur_num=' + $('#deleteBoard').attr('rel') + '&pageNum=${pageNum}';
			}
		);
	});
	
});
</script>
</body>
</html>