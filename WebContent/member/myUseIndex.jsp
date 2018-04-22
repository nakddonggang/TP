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
	<!-- member/myUseIndex.jsp 이용현황 목록 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
			<jsp:include page="../include/footer.jsp" />
		</div>

		<!-- 본문 시작되는 곳 -->
		<article>

			<div>
				<!-- myUseBasket.jsp : 책바구니 -->
				<h2>책 바구니</h2>
				<input type="button" value="상세보기"
					onclick="location.href='myUseBasket.jsp'">
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
			</div>
			<hr>

			<div>
				<!-- myUseBook.jsp : 도서 대출 목록 -->
				<h2>대출중인 도서 목록</h2>
				<input type="button" value="상세보기"
					onclick="location.href='myUseBook.jsp'">
				<table>
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
				<!-- myUseFacility.jsp : 시설 이용 현황 -->
				<h2>시설 이용 목록</h2>
				<input type="button" value="상세보기"
					onclick="location.href='myUseFacility.jsp'">
				<table>
					<tr>
						<td>자리번호</td>
						<td>시작시간</td>
						<td>종료시간</td>
						<td>자리유형</td>
					</tr>
				</table>
			</div>

		</article>
	</div>
</body>
</html>