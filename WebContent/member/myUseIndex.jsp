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
	<div id="main_menu">
		<jsp:include page="../include/header.jsp" />
		<jsp:include page="../include/footer.jsp" />
	</div>

	<!-- 본문 시작되는 곳 -->
	<article>
		<div>
			<!-- myUseBasket.jsp : 책바구니 -->
			<jsp:include page="myUseBasket.jsp" />
		</div>
		<hr>
		<div>
			<!-- myUseBook.jsp : 도서 대출 목록 -->
			<jsp:include page="myUseBook.jsp" />
		</div>
		<hr>
		<div>
			<!-- myUseFacility.jsp : 시설 이용 현황 -->
			<jsp:include page="myUseFacility.jsp" />
		</div>
	</article>
</body>
</html>