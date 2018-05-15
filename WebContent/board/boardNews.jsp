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
		int count = ((Integer)request.getAttribute("count")).intValue();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum =  (String)request.getAttribute("pageNum");
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		List<BoardDTO> noticeList = (List<BoardDTO>)request.getAttribute("noticeList");
	%>
<!-- board/boardNews.jsp Notice 게시판  페이지 -->
<iframe id="ifrm_filedown" style="position:absolute; z-index:1; visibility:hidden;"></iframe>   
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
						
						<h1>Notice</h1>
						
						<div class="search_bx">
							<form action="./BoardNoticeSearch.no" method="post">
								<input type="text" name="search" placeholder="공지사항을 검색해 보세요." class="inp_search"><input type="submit" value="검색" class="btn_search" >
							</form>
						</div>
						
						<div class="view_cnt">
							<p>Total_<span><%=count %></span></p>
						</div>
						<p class="sub_txt">이용자분들께 신속히 알려드릴 필요성이 있는 정보 및 자료를 제공해 드립니다.</p>
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							   <%
								if(noticeList==null){	%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul><%	}
								else{
									SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
									for(int i=0; i<noticeList.size(); i++){
										BoardDTO bDTO = noticeList.get(i);	//제너릭 사용해서 형변환 할 필요없음
										String notice_content = bDTO.getNotice_content();
										notice_content = notice_content.replaceAll("\r\n", "<br>");
										notice_content = notice_content.replaceAll("\u0020", "&nbsp;");
										String file = "";
									%>
										<div class="con_lst DIV_CON_LST">
											<ul>
												<li class="col_type"><a href="#"><p><%=bDTO.getNotice_type() %></p></a></li>
												<li class="col_title"><a href="#"><p><%=bDTO.getNotice_subject() %></p></a></li>
												<li class="col_date"><span class="tit_date">작성일 :&nbsp;</span><span><%=date.format(bDTO.getNotice_date()) %></span></li>
											</ul>
											
											<div class="con_detail DIV_CON_DETAIL">
												<%if(bDTO.getNotice_file()!=null){
													file = bDTO.getNotice_file();
													%><p><img src="./upload/<%=bDTO.getNotice_file()%>" width="100" height="100"></p><%
												}
												%>
												<p><%=notice_content %></p>	
												<div class="file"><span>첨부파일</span><ul><a href="#" class="down"><%=file %></a></ul></div>
									<%
										if ("admin".equals(member_id)) {
											%><div class="btn_btm_board">
													<ul>
														<li class="btn_con_right">
															<input type="button" value="글수정" class ="btn_type4" onclick="location.href='./BoardNoticeUpdate.no?notice_num=<%=bDTO.getNotice_num()%>&pageNum=<%=pageNum%>'">
															<input type="button" value="글삭제" id="" class ="btn_type4 deleteBoard" onclick="location.href='./BoardNoticeDeleteAction.no?notice_num=<%=bDTO.getNotice_num()%>&pageNum=<%=pageNum%>'">				
														</li>
													</ul>
												</div>
										<%	 }	%>
											</div>
										</div>
									<%	}	%>
								<%	}	%>
							</li>
						</ul>
						
						<%		
						if ("admin".equals(member_id)) {
						%>
						<input type="button"  class="btn_type1" value="글쓰기" onclick="location.href='./BoardNoticeWrite.no'">
						<%  }  %>
						
	
						
	
						<%
						if(pageCount < endPage)	endPage = pageCount;
						
						if(startPage > pageBlock)	{ %><a href="BoardNoticeList.no?pageNum=<%=startPage-pageBlock%>" class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong id="currentPage" title="현재 페이지"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="BoardNoticeList.no?pageNum=<%=p%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){	%><a href="BoardNoticeList.no?pageNum=<%=startPage+pageBlock%>" class="next"><span class="hide">다음 페이지</span></a><% }
						%>
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
	var pageNum = "<%=pageNum %>";
	
	$('.deleteBoard').each(function(index){
		$(this).attr('id','delete'+index);
		$('#delete'+index).click(function(){
			var result = confirm('정말 삭제하시겠습니까?');
			if(result){}
			else{location.replace("./BoardNoticeList.no?pageNum="+pageNum);	}
		});
	});
	
	$('.down').each(function(index){
		$(this).attr('id','down'+index);
		var file = $('#down'+index).html();
		var url = "./FileDownloadAction.no?filename="+file;
		
		$('#down'+index).click(function(){
			$('#ifrm_filedown').attr('src',url);
		});
	});
});
</script>
</body>
</html>