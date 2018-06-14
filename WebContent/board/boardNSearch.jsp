<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">
$(document).ready(function(){
	$("#search").autocomplete({
        source : function(request, response){
					$.ajax({
						type: 'POST',
						url: './BoardNoticeAjax.no',
						dataType: 'json',
						data: { 'search' : request.term },
						success: function(data) {
							var jsonData = JSON.parse("["+data+"]");
							response(
								$.map(jsonData, function(item) {
									return {
										label: item.notice_subject,
										value: item.notice_subject
									}
								})
							);
						}
					});
		},
    //조회를 위한 최소글자수
        minLength: 1,
        select:function(event,ui){},
    });
});
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String search = request.getParameter("search");
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
		List<BoardDTO> searchList = (List<BoardDTO>) request.getAttribute("searchList");
		String file ="";
	%>
	<!-- board/boardNSearch.jsp Notice 게시판 글 검색 페이지 -->
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
						<div class="text_top">
							<h3>공지사항</h3>
								<div class="dl_box">
									<dl>
										<dt>Read It</dt>
										<dd>이용자분들께 신속히 알려드릴필요성이 있는 정보 및 자료를 제공해 드립니다</dd>
									</dl>
								</div>
						</div>			
						<div class=board>
							<div class="view_cnt">
								<p>Search_<span><%=count%></span></p>
							</div>
							<p class="sub_txt">이용자분들께 신속히 알려드릴 필요성이 있는 정보 및 자료를 제공해 드립니다.</p>

							<ul class="brd_txt_lst">
								<!-- 글목록 -->
								<li class="view_lst">
									<%
										if (searchList == null) {
									%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul>
									<% }else {
											SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
											for (int i = 0; i < searchList.size(); i++) {
												BoardDTO bDTO = searchList.get(i);
												String notice_content = bDTO.getNotice_content();
												notice_content = notice_content.replaceAll("\r\n", "<br>");
												notice_content = notice_content.replaceAll("\u0020", "&nbsp;");
												String word = bDTO.getNotice_subject();
												word = word.replaceAll(search, "<mark>" + search + "</mark>");
											%>
											<div class="con_lst DIV_CON_LST">
												<ul>
													<li class="col_typeNo"><a href="#"><p><%=bDTO.getNotice_type()%></p></a></li>
													<li class="col_titleNo"><a href="#"><p><%=word%></p></a></li>
													<li class="col_date"><span class="tit_date">작성일 :&nbsp;</span><span><%=date.format(bDTO.getNotice_date()) %></span></li>
												</ul>
										
												<div class="con_detail DIV_CON_DETAIL">
												<%if(bDTO.getNotice_file()!=null){
													if(bDTO.getNotice_file().split(",")[0].equals("null")) file="";
													else file = bDTO.getNotice_file().split(",")[0];
											
													if(!(bDTO.getNotice_file().split(",")[1].equals("null"))){
														%><p><img src="./upload/<%=bDTO.getNotice_file().split(",")[1]%>" width="100" height="100"></p><%
													}
												}
												%>
													<p><%=notice_content%></p>
													<div class="file"><span>첨부파일</span><ul><a href="#" class="down"><%=file %></a></ul></div>
											
													<%
													if ("admin".equals(member_id)) {
														%><div class="btn_btm_board">
															<ul>
																<li class="btn_con_right">
											 		             <input type="button" value="글수정" class ="btn_type4" onclick="location.href='./BoardNoticeUpdate.no?notice_num=<%=bDTO.getNotice_num()%>&pageNum=<%=pageNum%>'">
														          <input type="button" value="글삭제" class ="btn_type4 deleteBoard" rel="<%=bDTO.getNotice_num()%>">
											 		  		    </li>
															</ul>
														 </div>
													<% } %>
												</div>
											</div>
									
										<%
											}
										}
										%>
										</li>
									</ul>
								
											
											<div class="paginate">
											<%
												if (pageCount < endPage) endPage = pageCount;
											%>
											<a href="BoardNoticeList.no?pageNum=1">[처음]</a>
											<%
												if (startPage > pageBlock) { %><a href="BoardNoticeSearch.no?pageNum=<%=startPage - pageBlock%>&search=<%=search%>"
												class="prev"><span class="hide">이전 페이지</span></a>
											<% }
												for (int p = startPage; p <= endPage; p++) {
													if (p == Integer.parseInt(pageNum)) {%>&nbsp;<strong title="현재 페이지" id="currentPage"><%=p%></strong> &nbsp;<% } 
													else {%> &nbsp;<a href="BoardNoticeSearch.no?pageNum=<%=p%>&search=<%=search%>"><%=p%></a> &nbsp;<% }
												}
												if (endPage < pageCount) {%><a href="BoardNoticeSearch.no?pageNum=<%=startPage + pageBlock%>&search=<%=search%>"
												class="next"><span class="hide">다음 페이지</span></a>
											<% } %>
											<a href="BoardNoticeList.no?pageNum=<%=pageCount %>">[끝]</a>
											</div>
											
											<div class="btn_btm_center1">
											<%
											 if ("admin".equals(member_id)) {
											%><input type="button" class="btn_type1" value="글쓰기" onclick="location.href='./BoardNoticeWrite.no'">
											<% } %>
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
	var pageNum = "<%=pageNum %>";
	var search = "<%=search %>";
	
	$('.deleteBoard').each(function(index){
		$(this).attr('id','delete'+index);
		$('#delete'+index).click(function(){
			$.Confirm(
					'정말 삭제하시겠습니까?',
					'경고',
					function(){
						location.href = './BoardNoticeDeleteAction.no?notice_num=' + $('#delete'+index).attr('rel') + '&pageNum="${pageNum}"';
					}
				);
		});
	});
});
</script>
</body>
</html>