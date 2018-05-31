<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberDTO"%>
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
	<%
		String member_id = (String)session.getAttribute("member_id");
		if ((member_id == null) || !(member_id.equals("admin"))) {
			response.sendRedirect("./Main.fp");
		}
	%>
<%
request.setCharacterEncoding("UTF-8");
int count = ((Integer) request.getAttribute("count")).intValue();

String pageNum = (String) request.getAttribute("pageNum");
String pageType = "Good";
int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer) request.getAttribute("startPage")).intValue();
int endPage = ((Integer) request.getAttribute("endPage")).intValue();

List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
%>


<body class="if_board">
	<div class="wrapper">
		<!-- 본문 컨테이너 -->
	
			<section class="fullpage SECTION_FULL_PAGE01">
				<!-- 메인 페이지 -->
					<article class="mainmenu section SECTION">
						<div class=board>
						<h3>우수회원 리스트</h3>
						<div class="view_cnt">
							<p>
								Total_<span><%=count%></span>
							</p>
						</div>
						
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
							<ul class="no_scroll title_t">
								<li class="col_daten">아이디</li>
								<li class="col_daten">비밀번호</li>
								<li class="col_daten">이름</li>
								<li class="col_calln">전화번호</li>
								<li class="col_daten">대출 횟수</li>
							</ul>
							</div>
						<%
							if (memberList == null) {
						%><ul>
							<li class="col_tit"><p>우수회원이 없습니다</p></li>
						</ul>
						<%
							} else {
								for (int i = 0; i < memberList.size(); i++) {
									MemberDTO mt = memberList.get(i); //제너릭 사용해서 형변환 할 필요없음
									String gm_check = mt.getGm_check();
									if(gm_check.equals("1")){
						%>
						<div class="con_lst">
							<ul
								onclick="location.href='./AdminMemberInfo.am?member_id=<%=mt.getMember_id()%>&pageNum=<%=pageNum%>&pageType=<%=pageType %>'"  class="no_scroll">
								<li class="col_daten"><a href="#"><p><%=mt.getMember_id()%></p></a></li>
								<li class="col_daten"><a href="#"><p><%=mt.getMember_pass()%></p></a></li>
								<li class="col_daten"><a href="#"><%=mt.getMember_name()%></li>
								<li class="col_calln"><a href="#"><%=mt.getMember_phone()%></a></li>
								<li class="col_daten"><a href="#"><%=mt.getBorrow_count()%></a></li>
							</ul>
						</div>
						<%}}}%>
							</li>
						</ul>
						<div class="paginate">
						<%if (count != 0) {//이전
								if (startPage > pageBlock) {
						%><a href="./AdminMemberGood.am?pageNum=<%=startPage - pageBlock%>" class="prev"><span class="hide">이전 페이지</span></a>
						<%}// 1~10 11~20 21~30
							for (int i = startPage; i <= endPage; i++) {
						%><a href="./AdminMemberGood.am?pageNum=<%=i%>"> &nbsp;<strong id="currentPage" title="현재 페이지"><%=i %></strong> &nbsp;</a>
						<%}//다음
								if (endPage < pageCount) {
						%><a href="./AdminMemberGood.am?pageNum=<%=startPage + pageBlock%>"class="next"><span class="hide">다음 페이지</span></a>
						<%}}%>
						</div>
						</div>

					</article>

		</section>
	
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>