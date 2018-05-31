<%@page import="net.facility.db.FacilityDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.book.db.BookDTO"%>
<%@page import="net.member.db.MemberDTO"%>
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
<link href="<c:url value="/css/jquery.fullpage.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/jquery.toast.min.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
	<!-- member/myUseIndex.jsp 이용현황 목록 페이지 -->
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
					<div class="content">
					<div class=board>
					<%
					int count = ((Integer)request.getAttribute("count")).intValue();
					String pageNum = (String)request.getAttribute("pageNum");
					int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
					int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
					int startPage = ((Integer)request.getAttribute("startPage")).intValue();
					int endPage = ((Integer)request.getAttribute("endPage")).intValue();
					List<FacilityDTO> fDTO_List = (List<FacilityDTO>)request.getAttribute("fDTO_List");
					%>
						<h4>대출중인 도서 목록</h4>
							<ul class="brd_txt_lst">
							<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
								<li class="col_mem_b">시설번호</li>
								<li class="col_mem_b">사용자</li>
								<li class="col_mem_b">사용시작시간</li>
								<li class="col_mem_b">사용끝낸시간</li>
							</ul>
							</div>
							<%
							if(count == 0) {
								%>
								<ul><li class="col_tit"><p>지금까지 시설을 이용하지 않았습니다.</p></li></ul>
								<%
							} else {
							SimpleDateFormat facility_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							for(FacilityDTO fDTO : fDTO_List) {
							%>
							<div class="con_lst">
							<ul class="no_scroll" >
								<li class="col_mem_b"><%=fDTO.getFacil_num() %></li>
								<li class="col_mem_b"><%=fDTO.getMember_id() %></li>
								<li class="col_mem_b"><%=facility_date.format(fDTO.getFacil_stime()) %></li>
								<li class="col_mem_b">
								<%if((fDTO.getFacil_etime())!=null) {
									out.print(facility_date.format(fDTO.getFacil_etime()));
								} else {
									out.print("현재 이용중인 자리입니다.");
								}
									%></li>

							</ul>
							</div>
							<%
							}
						}
							%>
							</li>
						</ul>
						 </div>
						 
						<div class="paginate">
							<%
							if (count != 0) {
								if (startPage > pageBlock) {
									%><a href="./AdminAllFacilityUserInfo.am?pageNum=<%=startPage - pageBlock%>"class="prev"><span class="hide">이전 페이지</span></a><%
								}
								for (int i = startPage; i <= endPage; i++) {%>
								<a href="./AdminAllFacilityUserInfo.am?pageNum=<%=i%>">&nbsp;<strong title="현재 페이지" id="currentPage"><%=i %></strong> &nbsp;</a><%		
								}
								if (endPage<pageCount){%>
									<a href="./AdminAllFacilityUserInfo.am?pageNum=<%=startPage+pageBlock%>"class="next"><span class="hide">다음 페이지</span></a><%
								}
							} %>		
						</div>
						
						<div class="btn_btm_center">
							<ul>
								<li class="btn_cancle">
								<input type="button" value="메인으로" onclick="location.href='./Main.fp'" class ="btn_type4 BTN_IF_LIST">
								</li>
							</ul>
						</div>
						 
					</div>
				</article>
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>