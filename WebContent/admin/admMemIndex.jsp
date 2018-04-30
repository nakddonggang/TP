<%@page import="net.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../css/jquery.fullpage" rel="stylesheet" type="text/css">
<link href="../css/import.css?ver=1" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery.bxslider.min.js"></script>
<script src="../js/jquery.fullpage.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/fullpage.js"></script>
</head>
<body>
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


	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- container -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">
				<h2 class="hide">Main</h2>

				<!-- left_content -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //left_content -->
				<article class="rgt_con section SECTION">
					<!-- 본문 공간 -->
					<h2>
						member 목록 [<%=count%>]
					</h2>
					<%
						if (count == 0) {
							out.print("가입자가 없습니다");
						}
					%>
					<table border="1">
						<tr>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>가입일</th>
							<!--리스트에서는 필요한 항목만 보이게끔 -->
						</tr>
						<%
							for (int i = 0; i < memberList.size(); i++) {
								MemberDTO mt = memberList.get(i);
						%>
						<tr
							onclick="location.href='./AdminMemberInfo.am?member_id=<%=mt.getMember_id()%>&pageNum=<%=pageNum%>'">
							<td><%=mt.getMember_id()%></td>
							<td><%=mt.getMember_pass()%></td>
							<td><%=mt.getMember_name()%></td>
							<td><%=mt.getMember_phone()%></td>
							<td><%=mt.getMember_date()%></td>
						</tr>
						<%
							}
						%>
					</table>

					<%
						if (count != 0) {

							//이전
							if (startPage > pageBlock) {
					%><a href="./admMemberIndex.am?pageNum=<%=startPage - pageBlock%>">[이전]</a>
					<%
						}
							// 1~10 11~20 21~30
							for (int i = startPage; i <= endPage; i++) {
					%><a href="./admMemberIndex.am?pageNum=<%=i%>"><%=i%></a>
					<%
						}
							//다음
							if (endPage < pageCount) {
					%><a href="./admMemberIndex.am?pageNum=<%=startPage + pageBlock%>">[다음]</a>
					<%
						}
						}
					%>





					<!-- // 본문 공간 -->
				</article>
			</section>
		</div>
		<!-- //container -->
	</div>
</body>
</html>