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
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<%
request.setCharacterEncoding("UTF-8");
int count = ((Integer) request.getAttribute("count")).intValue();

String pageNum = (String) request.getAttribute("pageNum");
int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer) request.getAttribute("startPage")).intValue();
int endPage = ((Integer) request.getAttribute("endPage")).intValue();

List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
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
				<!-- 메인 페이지 -->
					<h2>우수회원 목록보기</h2>
					<table border="1">
						<tr>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>대출 횟수</th>
							<th>가입일</th>
						</tr>
						<%
							if(memberList != null){
							for (int i = 0; i < memberList.size(); i++) {
								MemberDTO mt = memberList.get(i);
								String gm_check = mt.getGm_check();
							if(gm_check.equals("1")){
						%>
						<tr onclick="location.href='./AdminMemberInfo.am?member_id=<%=mt.getMember_id()%>&pageNum=<%=pageNum%>'">
							<td><%=mt.getMember_id()%></td>
							<td><%=mt.getMember_pass()%></td>
							<td><%=mt.getMember_name()%></td>
							<td><%=mt.getMember_phone()%></td>
							<td><%=mt.getBorrow_count()%></td>
							<td><%=mt.getMember_date()%></td>
						</tr>
						<%
							}
							}
							}else{
								%><td colspan='6'><%out.print("우수회원이 없습니다");%></td><%
							}
						%>

					</table>
					<%
						if (count != 0) {

							//이전
							if (startPage > pageBlock) {
					%><a href="./AdminMemberGood.am?pageNum=<%=startPage - pageBlock%>">[이전]</a>
					<%
						}
							// 1~10 11~20 21~30
							for (int i = startPage; i <= endPage; i++) {
					%><a href="./AdminMemberGood.am?pageNum=<%=i%>"><%=i%></a>
					<%
						}
							//다음
							if (endPage < pageCount) {
					%><a href="./AdminMemberGood.am?pageNum=<%=startPage + pageBlock%>">[다음]</a>
					<%
						}
						}
					%>
					<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>