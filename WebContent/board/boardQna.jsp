<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDTO"%>
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
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script type="text/javascript">
$(function(){
	var data=[
		{value:"1차 테스트",label:"1차 테스트"},
		{value:"2차 테스트",label:"2차 테스트"},
		{value:"6차 테스트",label:"6차 테스트"},
	];
	$('.inp_search').autocomplete({
		source : data,
		minLength : 1
	});
});
</script>
</head>
<body>
	<%
		int count = ((Integer)request.getAttribute("count")).intValue();
		String member_id = (String)session.getAttribute("member_id");
		String anonymous = "알수없음";
		String pageNum =  (String)request.getAttribute("pageNum");
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		List<BoardDTO> qnaList = (List<BoardDTO>)request.getAttribute("qnaList");
	%>
<!-- board/boardQna.jsp Q&A 게시판 페이지 -->
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
						<div class="text_top">
							<h3>Q&A</h3>
							<div class="dl_box">
								<dl>
									<dt>Read It</dt>
									<dd>게시 전 검색을 먼저 해주시고,</dd>
									<dd>타인에 대한 욕설 및 비방글은 삼가주시기 바랍니다.</dd>
								</dl>
							</div>
						</div>
						
						<div class=board>
				
						<div class="view_cnt">
							<p>Total_<span><%=count %></span></p>
						</div>
						<div class="search_bx">
							<form action="./BoardQnaSearch.qn" method="post">
								<input type="text" name="search" placeholder="문의사항을 검색해 보세요." class="inp_search"><input type="submit" value="검색" class="btn_search" >
							</form>
						</div>
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
									<li class="col_num">번호</li>
									<li class="col_id">작성자</li>
									<li class="col_title">제목</li>
									<li class="col_date">작성일</li>
									<li class="col_rc">조회수</li>
									<li class="col_check">답변여부</li>
								</ul>
							</div>
							<%
								if(qnaList==null){	%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul><%	}
								else{
									SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
									for(int i=0; i<qnaList.size(); i++){
										BoardDTO bDTO = qnaList.get(i);
										String check = bDTO.getQna_check();
										if(check.equals("1")){check="답변완료";}
										else {check="답변대기";}
									%>
										<div class="con_lst">
											
											<ul class="no_scroll" onclick="location.href='./BoardQnaContent.qn?qna_num=<%=bDTO.getQna_num() %>&pageNum=<%=pageNum %>'">
												<li class="col_num"><p><%=bDTO.getQna_num() %></p></li>
												<%if(bDTO.getMember_id()==null){
													%><li class="col_id"><p><%=anonymous %></p></li><%
												}else{
													%><li class="col_id"><p><%=bDTO.getMember_id() %></p></li><%
												}%>
												<li class="col_title"><p><%=bDTO.getQna_subject() %></p></li>
												<li class="col_date"><span><%=date.format(bDTO.getQna_date()) %></span></li>
												<li class="col_rc"><p><%=bDTO.getQna_readcount() %></p></li>
												<li class="col_check"><p><%=check %></p></li>
											</ul>
											
										</div>
										<%	}	%>
									<%	}	%>
							</li>
						</ul>
						<div class="paginate">
						<%if(member_id != null){
							%><input type="button" value="글쓰기" class="btn_type1" onclick="location.href='./BoardQnaWrite.qn'"><%
						}%>
						<%
						if(pageCount < endPage)	endPage = pageCount;
					
						if(startPage > pageBlock)	{ %><a href="BoardQnaList.qn?pageNum=<%=startPage-pageBlock%>"class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong title="현재 페이지" id="currentPage"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="BoardQnaList.qn?pageNum=<%=p%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){ %><a href="BoardQnaList.qn?pageNum=<%=startPage+pageBlock%>" class="next"><span class="hide">다음 페이지</span></a><%	}

						%>
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