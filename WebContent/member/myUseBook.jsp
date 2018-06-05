<%@page import="java.util.List"%>
<%@page import="net.book.db.BookDTO"%>
<%@page import="net.member.action.MemberMyUseBookList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/css/jquery.fullpage.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/jquery.toast.min.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/jQuery.Alert-1.0.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
List<BookDTO> bbList = (List<BookDTO>)request.getAttribute("bbList");
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
				<h1>대출중인 도서 목록</h1>
				<table>
					<tr>
						<td>책 번호</td>
						<td>책 제목</td>
						<td>대출일자</td>
						<td>반납할 일자</td>
					</tr>
					<%
					if(bbList.size()==0){%><p>게시글이 없습니다</p><%	}
					else{
						SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
						for(int i=0; i<bbList.size(); i++){
							BookDTO bDTO =(BookDTO)bbList.get(i);
					%>					
					<tr>
						<td>책 번호<%=bDTO.getBook_number() %></td>
						<td>책 제목<%=bDTO.getBook_subject() %></td>
						<td>대출일자<%=bDTO.getBbook_bdate() %></td>
						<td>반납할 일자<%=bDTO.getBbook_rdate() %></td>
					</tr>
					<%
					}
					}
					%>
					
				</table>
			</div>
			<div>
				<h1>예약중인 도서 목록</h1>
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