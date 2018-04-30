<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<!-- member/memberInsert.jsp 회원가입 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />	<!-- div id=header -->
<%-- 			<jsp:include page="../include/footer.jsp" />	<!-- div id=footer --> --%>
		</div>
		<div id="sub_menu">
			<jsp:include page="../include/submenu_main.jsp"/>	<!-- div id=sub_menu -->
		</div>
		
		<!-- 본문 시작되는 곳 -->
		<article>
			<h1>회원가입</h1>
			<form action="MemberJoinAction.me"  method="post"  name="fr" >
				<table class="" >
					<tr>
						<th>ID</th>
						<td><input type="text" name="member_id" value=""></td>
					</tr>
					<tr>
						<th>Pass</th>
						<td><input type="text" name="member_pass" value=""></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><input type="text" name="member_name" value=""></td>
					</tr>
					<tr>
						<th>Post</th>
						<td><input type="text" name="member_post" value=""></td>
					</tr>
					<tr>
						<th>Address</th>
						<td><input type="text" name="member_address1" value=""> <input type="text" name="member_address2" value=""></td>
					</tr>
					<tr>
						<th>Phone</th>
						<td><input type="text" name="member_phone" value=""></td>
					</tr>
					<tr>
						<th>E-mail</th>
						<td><input type="text" name="member_email" value=""></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="회원가입"> <input type="reset" value="취소"></th>
					</tr>
				</table>
			</form>

		</article>
	</div>
</body>
</html>