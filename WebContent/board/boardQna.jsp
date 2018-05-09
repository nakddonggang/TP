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
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer)request.getAttribute("count")).intValue();
		String member_id = (String)session.getAttribute("member_id");

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
						<div class=board>
						
						<h1>Q&A</h1>
						
						<div class="search_bx">
							<form action="./BoardQnaSearch.qn" method="post">
								<input type="text" name="search" placeholder="공지사항을 검색해 보세요." class="inp_search"><input type="submit" value="검색" class="btn_search" >
							</form>
						</div>
						
						<div class="view_cnt">
							<p>Total_<span><%=count %></span></p>
						</div>
						<p class="sub_txt">
							신청일로부터 주말 제외 3일 이내에 방문 신청이 승인되지 않았거나 신청 취소를 원하시면 지혜의숲(031-955-0082)번으로 연락 부탁드립니다.
						</p>
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="col_qna">
								<ul>
									<li class="col_num">번호</li>
									<li class="col_id">작성자</li>
									<li class="col_title">제목</li>
									<li class="col_date"><span class="tit_date">작성일</span></li>
									<li class="col_rc">조회수</li>
									<li class="col_check">답변여부</li>
								</ul>
							<%
								if(qnaList==null){	%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul><%	}
								else{
									for(int i=0; i<qnaList.size(); i++){
										BoardDTO bDTO = qnaList.get(i);
										String check = bDTO.getQna_check();
										if(check.equals("1")){check="답변완료";}
										else {check="답변대기";}
									%>
										<div class="con_lst DIV_CON_LST">
											<ul>
												<li class="col_num"><a href="#"><p><%=bDTO.getMember_id() %></p></a></li>
												<li class="col_id"><a href="#"><p><%=bDTO.getMember_id() %></p></a></li>
												<li class="col_title"><a href="#"><p><%=bDTO.getQna_subject() %></p></a></li>
												<li class="col_date"><span class="tit_date">작성일 :&nbsp;</span><span><%=bDTO.getQna_date() %></span></li>
												<li class="col_rc"><a href="#"><%=bDTO.getQna_readcount() %></a></li>
												<li class="col_check"><a href="#"><%=check %></a></li>
											</ul>
											
											<div class="con_detail DIV_CON_DETAIL">
												<p><%=bDTO.getNotice_content() %></p>		
												
												<%
												if (bDTO.getMember_id().equals(member_id)) {
													%><div class="fix">
														<ul>
															<li><input type="button" value="글수정" onclick="location.href='./BoardQnaUpdate.qn?qna_num=<%=bDTO.getQna_num()%>&pageNum=<%=pageNum%>'"></li>
															<li><input type="button" value="글삭제" onclick="location.href='./BoardQnaDeleteAction.qn?qna_num=<%=bDTO.getQna_num()%>&pageNum=<%=pageNum%>'"></li>
															<%
															if("admin".equals(member_id)){
																%>
																<li><input type="button" value="답변하기" onclick="location.href='./BoardReply.qn?qna_ref=<%=bDTO.getQna_ref() %>&pageNum=<%=pageNum %>'"></li>
																<%
															}
															%>
														</ul>
													</div><%
												}
												if(bDTO.getQna_check().equals("1")){
												%>
												<div class="con_lst DIV_CON_LST">
													<ul>
														<li class="col_type"><a href="#"><p><%=bDTO.getRep_name() %></p></a></li>
														<li class="col_type"><a href="#"><p><%=bDTO.getRep_email() %></p></a></li>
													</ul>
													
													<div class="con_detail DIV_CON_DETAIL">
														<p><%=bDTO.getRep_content() %></p>
														<%
														if("admin".equals(member_id)){
															%><div class="fix">
																<ul>
																	<li><input type="button" value="답변수정" onclick="location.href='./BoardReplyUpdate.qn?qna_num=<%=bDTO.getQna_num()%>&pageNum=<%=pageNum%>&qna_ref=<%=bDTO.getQna_ref() %>'"></li>
																	<li><input type="button" value="답변삭제" onclick="location.href='./BoardReplyDeleteAction.qn?qna_ref=<%=bDTO.getQna_ref()%>&pageNum=<%=pageNum%>'"></td></li>
																</ul>
															</div>
															<%
														}
														%>
													</div>
												</div>
												
											</div>
										</div>
										<%	}	%>
									<%	}	%>
								<%	}	%>
							</li>
						</ul>
						
						<input type="button" value="글쓰기" onclick="location.href='./BoardQnaWrite.qn'">
					
						<%
						if(pageCount < endPage)	endPage = pageCount;
					
						if(startPage > pageBlock)	{ %><a href="BoardQnaList.qn?pageNum=<%=startPage-pageBlock%>"class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong title="현재 페이지"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="BoardQnaList.qn?pageNum=<%=p%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){ %><a href="BoardQnaList.qn?pageNum=<%=startPage+pageBlock%>" class="next"><span class="hide">다음 페이지</span></a><%	}

						%>
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