<%@page import="net.facility.db.FacilityDTO"%>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
	<!-- member/myUseFacility.jsp / MyUseIndex >> 시설이용현황 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
<%-- 			<jsp:include page="../include/footer.jsp" /> --%>
		</div>

		<!-- 본문 시작되는 곳 -->
		<article>
		<%
			FacilityDTO fDTO = (FacilityDTO)request.getAttribute("fDTO"); 
		%>
			<h1>시설 이용 현황</h1>
			<table>
				<tr>
					<td>자리번호</td>
					<td>시작시간</td>
					<td>종료시간</td>
					<td>자리유형</td>
				</tr>
				<tr>
					<td><%=fDTO.getFacil_num() %></td>
					<td><%=fDTO.getFacil_stime() %></td>
					<td>종료시간</td>
					<td><%=fDTO.getFacil_type() %></td>
				</tr>
			</table>

		</article>
	</div>
</body>
</html>