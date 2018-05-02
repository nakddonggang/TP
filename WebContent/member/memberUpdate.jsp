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
				<%
					String member_id = (String)session.getAttribute("member_id");
					MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
					if(member_id == null) {
						response.sendRedirect("./MemberLogin.me");
					}
				%>
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
					<div class="content">
						<form action="MemberUpdateAction.me" method="post" name="">
							<fieldset class="memberform">
								<legend>회원정보수정</legend>
								<label>User ID</label><input type="text" name="member_id" value="<%=member_id %>" readonly><br>
<!-- 								<label>Password</label> <input type="password" name="pass"><br> -->
<!-- 								<label>RetypePassword</label><input type="password" name="pass2"><br> -->
								<label>Name</label><input type="text" name="member_name" value="<%=mDTO.getMember_name()%>"><br>
								<label>Post</label><input type="text" name="member_post" value="<%=mDTO.getMember_post()%>"><br>
								<label>Address</label><input type="text" name="member_address1" value="<%=mDTO.getMember_address1()%>"><input type="text" name="member_address2" value="<%=mDTO.getMember_address2()%>"><br>
								<label>Phone</label> <input type="text" name="member_phone" value="<%=mDTO.getMember_phone()%>"><br> 
								<label>E-Mail</label><input type="text" name="member_email" value="<%=mDTO.getMember_email()%>">
							</fieldset>
							<input type="submit" value="회원수정"><input type="reset" value="취소">
						</form>
					</div>
				<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>