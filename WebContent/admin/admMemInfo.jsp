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
<%
String member_id = request.getParameter("member_id");
String pageNum = request.getParameter("pageNum");
MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
String gm_check =(String)request.getAttribute("gm_check");
String bl_check =(String)request.getAttribute("bl_check");
%>


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
				<!-- 메인 페이지 -->
					<h2>사용자 정보보기</h2>
					
				<form id="info" name="fr" method="post">
				<fieldset>
					<legend>Basic Info</legend>
					<label>User ID</label> <input type="text" name="member_id" class="id" value="<%=mDTO.getMember_id()%>" readonly><br>
					<label>Password</label> <input type="text" name="member_pass" class="pass" value="<%=mDTO.getMember_pass()%>" readonly><br>
					<label>Name</label> <input type="text" name="member_name" value="<%=mDTO.getMember_name()%>" readonly><br>
					<label>E-Mail</label> <input type="email" name="member_email" value="<%=mDTO.getMember_email()%>" readonly><br>
				</fieldset>

				<fieldset>
					<legend>Optional</legend>
					<label>Address</label> <input type="text" name="member_post" value="<%=mDTO.getMember_post()%>" readonly><br>
					<label>Address Detail</label> 
					 <input type="text" name="member_address1" value="<%=mDTO.getMember_address1()%>" readonly>
					  <input type="text" name="member_address2" value="<%=mDTO.getMember_address2()%>" readonly><br>
					<label>Phone Number</label> <input type="text" name="member_phone" value="<%=mDTO.getMember_phone()%>" readonly><br>
					<label>data</label> <input type="text" name="member_date" value="<%=mDTO.getMember_date()%>" readonly><br>
				</fieldset>
					
					<fieldset>
					<legend>Level</legend>
					<%
					if(gm_check.equals("0")&&bl_check.equals("0")){
						%><label>Member Level</label><input type="text" name="level" value="일반회원" readonly><br><%
					}else if(gm_check.equals("1")){
						%><label>Member Level</label><input type="text" name="level" value="우수회원" readonly><br><%
					}else if(bl_check.equals("1")){
						%><label>Member Level</label><input type="text" name="level" value="블랙리스트" readonly><br><%
					}
					%>
					<label>대출횟수</label> <input type="text" name="borrow_count" value="<%=mDTO.getBorrow_count()%>" readonly><br>
					<label>연체횟수</label> <input type="text" name="bl_count" value="<%=mDTO.getBl_count()%>" readonly><br>
					<label>연체총일수</label> <input type="text" name="bl_date" value="<%=mDTO.getBl_date()%>" readonly><br>
					</fieldset>

				</form>
					<input type="button" value="글목록" onclick="location.href='./AdminMemberIndex.am?pageNum=<%=pageNum%>'">
					<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>