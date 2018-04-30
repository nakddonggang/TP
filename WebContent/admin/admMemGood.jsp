<%@page import="net.member.db.MemberDTO"%>
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
<%
String member_id = request.getParameter("member_id");
String pageNum = request.getParameter("pageNum");
MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
%>


<body>
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
					<h2>우수회원 정보보기</h2>

					<table border="1">
						<tr>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>우편번호</th>
							<th>기본주소</th>
							<th>상세주소</th>
							<th>전화번호</th>
							<th>E-mail</th>
							<th>대출 횟수</th>
							<th>가입일</th>
						</tr>
						<tr>
							<td><%=mDTO.getMember_id()%></td>
							<td><%=mDTO.getMember_pass()%></td>
							<td><%=mDTO.getMember_name()%></td>
							<td><%=mDTO.getMember_post()%></td>
							<td><%=mDTO.getMember_address1()%></td>
							<td><%=mDTO.getMember_address2()%></td>
							<td><%=mDTO.getMember_phone()%></td>
							<td><%=mDTO.getMember_email()%></td>
							<td><%=mDTO.getBorrow_count()%></td>
							<td><%=mDTO.getMember_date()%></td>
						</tr>
						<tr>
							<td colspan="10">
							<input type="button" value="글목록" onclick="location.href='./AdminMemberRank.am?pageNum=<%=pageNum%>'">
							<input type="button" value="블랙리스트전환" onclick="location.href='./.am?member_id=<%=mDTO.getMember_id()%>&pageNum=<%=pageNum%>'">
							<input type="button" value="일반전환" onclick="location.href='./.am?member_id=<%=mDTO.getMember_id()%>&pageNum=<%=pageNum%>'">
							</td>
						</tr>
					</table>
					<!-- // 본문 공간 -->
				</article>
			</section>
		</div>
		<!-- //container -->
	</div>
</body>
</html>