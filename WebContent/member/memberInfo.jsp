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
	<!-- member/memberInfo.jsp 개인정보관리 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
			<jsp:include page="../include/footer.jsp" />
		</div>

		<!-- 본문 시작되는 곳 -->
		<article>
			<h1>개인정보관리</h1>
			<table class="">
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" value="" readonly></td>
				</tr>
				<tr>
					<th>Name</th>
					<td><input type="text" name="name" value="" readonly>
					</td>
				</tr>
				<tr>
					<th>Post</th>
					<td><input type="text" name="post" value="" readonly>
					</td>
				</tr>
				<tr>
					<th>Address</th>
					<td><input type="text" name="address" value="" readonly>
						<input type="text" name="address2" value="" readonly></td>
				</tr>
				<tr>
					<th>Phone</th>
					<td><input type="text" name="phone" value="" readonly>
					</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" name="email" value="" readonly>
					</td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td><input type="text" name="date" value="" readonly>
					</td>
				</tr>
				<tr>
					<th colspan="2"><a href="memberUpdate.jsp"><input
							type="button" value="회원수정"></a> <a href="memberDelete.jsp"><input
							type="button" value="회원탈퇴"></a></th>
				</tr>
			</table>
			
		</article>
	</div>
</body>
</html>