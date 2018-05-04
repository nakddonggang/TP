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
</head>
<body>
<%
String member_id = (String)session.getAttribute("member_id");
if(member_id != null) {
	%>
	<script type="text/javascript">
		alert("로그인 한 후 사용하세요");
		location.href = "./MemberLogin.me";
	</script>
	<%
}
%>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
				
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					<!-- 본문 공간 -->
					<h2>희망도서 신청</h2>
					<form action="ServeBookAction.bk" method="post">
						<input type="hidden" value="대기" name="hbook_check">
						<table border="1">
							<tr>
								<th>아이디 : </th><td><input type="text" name="member_id" value="1111" readonly></td>
							</tr>
							<tr>	
								<th>도서명  : </th><td><input type="text" name="hbook_subject"></td>
							</tr>
							<tr>	
								<th>저자 : </th><td><input type="text" name="hbook_author"></td>
							</tr>
							<tr>	
								<th>발행처 : </th><td><input type="text" name="hbook_publisher"></td>
							</tr>						
							<tr>	
								<th>희망도서 설명 : </th><td><textarea cols="20" rows="10" name="hbook_explain"></textarea></td>
							</tr>
						</table>		
						
					<div>
						<input type="submit" value="도서 신청하기">
						<input type="reset" value="취소">
					</div>
							
					</form>
					<!-- // 본문 공간 -->
				</article>
			</section>
		</div>
		<!-- //container -->
	</div>
</body>
</html>