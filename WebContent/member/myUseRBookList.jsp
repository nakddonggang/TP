<%@page import="java.util.List"%>
<%@page import="net.book.db.BookDTO"%>
<%@page import="net.member.action.MemberMyUseBookList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet"	type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
List<BookDTO> rbList = (List<BookDTO>)request.getAttribute("rbList");
 %>
 <!-- member/myUseBook.jsp / MyUseIndex >> 대출예약조회 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
<%-- 			<jsp:include page="../include/footer.jsp" /> --%>
		</div>

		<!-- 본문 시작되는 곳 -->
		<article>
			<div>
				<h1>예약중인 도서 목록</h1>
				<ul>
					<li>
						<ul>
						<li>책 번호</li>
						<li>책 제목</li>
						<li>예약일자</li>
						</ul>
					
					<%
					if(rbList.size()==0){%><p>예약중인 도서가 없습니다.</p><%	}
					else{
						SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
						for(int i=0; i<rbList.size(); i++){
							BookDTO bDTO =(BookDTO)rbList.get(i);
					%>					
					<ul>
						<li>책 번호<%=bDTO.getBook_number() %></li>
						<li>책 제목<%=bDTO.getBook_subject() %></li>
						<li>예약일자<%=bDTO.getRbook_date() %></li>
					</ul>
					<%
					}
					}
					%>
					
				</li>
				</ul>
			</div>
			

		</article>
	</div>
</body>
</html>