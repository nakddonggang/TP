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
</head>
<body>
	<!-- member/memberUpdate.jsp 개인정보수정 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
<%-- 			<jsp:include page="../include/footer.jsp" /> --%>
		</div>
		<%
			String member_id = (String)session.getAttribute("member_id");
			MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
			if(member_id == null) {
				response.sendRedirect("./MemberLogin.me");
			}
		%>
		<!-- 본문 시작되는 곳 -->
		<article>
			<h1>회원정보수정</h1>
			<form action="MemberUpdateAction.me" method="post" name="">
				<table class="">
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" value="<%=member_id %>" readonly></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><input type="text" name="name" value="<%=mDTO.getMember_name()%>"></td>
					</tr>
					<tr>
						<th>Post</th>
						<td><input type="text" name="post" value="<%=mDTO.getMember_post()%>"></td>
					</tr>
					<tr>
						<th>Address</th>
						<td><input type="text" name="address" value="<%=mDTO.getMember_address1()%>"> <input
							type="text" name="address2" value="<%=mDTO.getMember_address2()%>"></td>
					</tr>
					<tr>
						<th>Phone</th>
						<td><input type="text" name="phone" value="<%=mDTO.getMember_phone()%>"></td>
					</tr>
					<tr>
						<th>E-mail</th>
						<td><input type="text" name="email" value="<%=mDTO.getMember_email()%>"></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="회원수정"> <input
							type="reset" value="취소"></th>
					</tr>
				</table>
			</form>

		</article>
	</div>
</body>
</html>