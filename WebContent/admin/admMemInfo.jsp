<%@page import="net.member.db.MemberDTO"%>
<%@page import="java.util.Date"%>
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
String pageType = request.getParameter("pageType");
MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
String gm_check =(String)request.getAttribute("gm_check");
String bl_check =(String)request.getAttribute("bl_check");
%>

<body class="if_board">
	<div class="wrapper">

			<section class="fullpage SECTION_FULL_PAGE01">
				<article class="mainmenu section SECTION">
					<h3>사용자 정보보기</h3>
				
					<div class='join_form'>
						<ul class="row">
							<li>
								<ul class="row_sub">
										<li class="title"><span>User ID</span></li>
										<li class="inp_form"><input type="text" name="member_id" value="<%=mDTO.getMember_id()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>Password</span></li>
										<li class="inp_form"><input type="text" name="member_pass"  value="<%=mDTO.getMember_pass()%>"  readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>Name</span></li>
										<li class="inp_form"><input type="text" name="member_name" value="<%=mDTO.getMember_name()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>E-Mail</span></li>
										<li class="inp_form"><input type="text" name="member_email" value="<%=mDTO.getMember_email()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>Post</span></li>
										<li class="inp_form"><input type="text" name="member_post"  value="<%=mDTO.getMember_post()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>Address</span></li>
										<li class="inp_form"><input type="text" name="member_address"  value="<%=mDTO.getMember_address1()%><%=mDTO.getMember_address2()%> " readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>Name</span></li>
										<li class="inp_form"><input type="text" name="member_phone" value="<%=mDTO.getMember_phone()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>E-Mail</span></li>
										<li class="inp_form"><input type="text" name="member_date" value="<%=mDTO.getMember_date()%>" readonly></li>
								</ul>
							</li>
						</ul>
						
						
						
						<ul class="row">
							<li>
								<ul class="row_sub">
										<li class="title"><span>회원등급</span></li>
										<%
										if(gm_check.equals("0")&&bl_check.equals("0")){
										%><li class="inp_form"><input type="text" name="level" value="일반회원" readonly></li><%
										}else if(gm_check.equals("1")){
											%><li class="inp_form"><input type="text" name="level" value="우수회원" readonly></li><%
										}else if(bl_check.equals("1")){
											%><li class="inp_form"><input type="text" name="level" value="블랙리스트" readonly></li><%
										}%>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>대출횟수</span></li>
										<li class="inp_form"><input type="text" name="borrow_count"  value="<%=mDTO.getBorrow_count()%>"  readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>연체횟수</span></li>
										<li class="inp_form"><input type="text" name="bl_count" value="<%=mDTO.getBl_count()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>연체총일수</span></li>
										<li class="inp_form"><input type="text" name="bl_date" value="<%=mDTO.getBl_date()%>" readonly></li>
								</ul>
							</li>
						</ul>
				<div class="btn_btm_center">
				<ul>
											<li class="btn_cancle">
				<input type="button" value="글목록" rel="./AdminMember<%=pageType%>.am?pageNum=<%=pageNum%>" class ="btn_type4 BTN_IF_LIST">
				</li>
				</ul>
				</div>
				</div>
		
					<!-- //메인 페이지-->
				</article>
				
			</section>
		
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>