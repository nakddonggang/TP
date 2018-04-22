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
	<!-- member/myUseBook.jsp / MyUseIndex - 대출예약조회 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
			<jsp:include page="../include/footer.jsp" />
		</div>

		<!-- 본문 시작되는 곳 -->
		<article>
			<div>
				<h1>대출중인 도서 목록</h1>
				<table>
					<tr>
						<td>책 번호</td>
						<td>책 제목</td>
						<td>대출일자</td>
						<td>반납할 일자</td>
					</tr>
					<tr>
						<td>책 번호</td>
						<td>책 제목</td>
						<td>대출일자</td>
						<td>반납할 일자</td>
					</tr>
				</table>
			</div>
			<hr>
			<div>
				<h1>대출 전체 목록</h1>
				<table>
					<tr>
						<td>책 번호</td>
						<td>책 제목</td>
						<td>대출일자</td>
						<td>반납일자</td>
					</tr>
					<tr>
						<td>책 번호</td>
						<td>책 제목</td>
						<td>대출일자</td>
						<td>반납일자</td>
					</tr>
				</table>
			</div>
			
		</article>
	</div>
</body>
</html>