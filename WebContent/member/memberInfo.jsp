<%@page import="net.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<!-- member/memberInfo.jsp 개인정보관리 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
<%-- 			<jsp:include page="../include/footer.jsp" /> --%>
		</div>

		<!-- 본문 시작되는 곳 -->
		<article>
		<%
			String member_id = (String)session.getAttribute("member_id");
			MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
			if(member_id == null) {
				response.sendRedirect("./MemberLogin.me");
			}
		%>
			<h1>개인정보관리</h1>
			<table class="">
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" value="<%=member_id %>" readonly></td>
				</tr>
				<tr>
					<th>Name</th>
					<td><input type="text" name="name" value="<%=mDTO.getMember_name() %>" readonly>
					</td>
				</tr>
				<tr>
					<th>Post</th>
					<td><input type="text" name="post" value="<%=mDTO.getMember_post() %>"  readonly>
					</td>
				</tr>
				<tr>
					<th>Address</th>
					<td><input type="text" name="address" value="<%=mDTO.getMember_address1() %>" readonly>
						<input type="text" name="address2" value="<%=mDTO.getMember_address2() %>" readonly></td>
				</tr>
				<tr>
					<th>Phone</th>
					<td><input type="text" name="phone" value="<%=mDTO.getMember_phone() %>" readonly>
					</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" name="email" value="<%=mDTO.getMember_email() %>" readonly>
					</td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td><input type="text" name="date" value="<%=mDTO.getMember_date() %>" readonly>
					</td>
				</tr>
				<tr>
					<th colspan="2">
					<input type="button" value="회원수정" onclick = "location.href = './MemberUpdate.me'">
					<input type="button" value="회원탈퇴" onclick = "location.href = './MemberDelete.me'">
					<input type = "button" value = "로그아웃" onclick = "location.href = './MemberLogoutAction.me'"> <!--  잠시 사용할 버튼 -->
					</th>
				</tr>
			</table>
			
		</article>
	</div>
</body>
</html>