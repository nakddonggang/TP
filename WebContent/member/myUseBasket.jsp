<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<!-- member/myUseBasket.jsp / MyUseIndex >> 책바구니 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
			<jsp:include page="../include/footer.jsp" />
		</div>

		<!-- 본문 시작되는 곳 -->
		<article>
			<h1>책 바구니</h1>
			<table>
				<tr>
					<td>책 번호</td>
					<td>예약번호</td>
					<td>대출신청/삭제<input type="checkbox"></td>
				</tr>
				<tr>
					<td>책 번호</td>
					<td>예약번호</td>
					<td>대출신청/삭제<input type="checkbox"></td>
				</tr>
			</table>

			<div>
				<input type="button" value="선택한 도서 예약하기"> <input
					type="button" value="삭제하기">
			</div>

		</article>
	</div>
</body>
</html>