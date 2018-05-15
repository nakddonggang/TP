<%@page import="net.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.member.action.MemberBasketList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<body>
	<!-- member/myUseBasket.jsp / MyUseIndex >> 책바구니 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
<%-- 			<jsp:include page="../include/footer.jsp" /> --%>
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
				<%
				List MemberBasketList = (List)request.getAttribute("MemberBasketList");
				
				for(int i=0; i<MemberBasketList.size(); i++){
					MemberDTO mDTO = (MemberDTO)MemberBasketList.get(i);
					%>
				<tr>
					<td><%=mDTO.getBook_number() %>책 번호</td>
					<td><%=mDTO.getBasket_number() %>예약번호</td>
					<td>대출신청/삭제<input type="checkbox"></td>
				</tr>
					<%
				}
				%>

<!-- 				<tr> -->
<!-- 					<td>책 번호</td> -->
<!-- 					<td>예약번호</td> -->
<!-- 					<td>대출신청/삭제<input type="checkbox"></td> -->
<!-- 				</tr> -->
			</table>

			<div>
				<input type="button" value="선택한 도서 예약하기"> 
				<input type="button" value="삭제하기">
			</div>

		</article>
	</div>
</body>
</html>