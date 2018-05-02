<%@page import="net.member.db.MemberDTO"%>
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
					<%
						String member_id = (String)session.getAttribute("member_id");
						MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
						if(member_id == null) {
							response.sendRedirect("./MemberLogin.me");
						}
					%>
					<div class="content">
						<fieldset class="memberform">
							<legend>개인정보관리</legend>
							<label>ID</label><input type="text" name="id" value="<%=member_id %>" readonly><br>
							<label>Name</label><input type="text" name="name" value="<%=mDTO.getMember_name() %>" readonly><br>
							<label>Post</label><input type="text" name="post" value="<%=mDTO.getMember_post() %>"  readonly><br>
							<label>Address</label><input type="text" name="address" value="<%=mDTO.getMember_address1() %>" readonly><input type="text" name="address2" value="<%=mDTO.getMember_address2() %>" readonly><br>
							<label>Phone</label><input type="text" name="phone" value="<%=mDTO.getMember_phone() %>" readonly><br>
							<label>E-mail</label><input type="text" name="email" value="<%=mDTO.getMember_email() %>" readonly><br>
							<label>가입날짜</label><input type="text" name="date" value="<%=mDTO.getMember_date() %>" readonly>
						</fieldset>
						<input type="button" value="회원수정" onclick = "location.href = './MemberUpdate.me'">
						<input type="button" value="회원탈퇴" onclick = "location.href = './MemberDelete.me'">
					</div>
					<!-- //메인 페이지-->
				</article>
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>