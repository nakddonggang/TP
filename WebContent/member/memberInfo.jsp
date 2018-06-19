<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<article class="submenu section SECTION">
					<div class="slide DIV_SLIDE">
						<div class="intro1">
							<div class="slide_con">
								<div class="box_thm">
									<div id="memberInfo_img" >
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
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
						SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
					%>
					<div class="content">
						<div class='member_content'>
						
					
					<div class='join_form'>
					<h3>회원정보</h3>
						<form action="MemberUpdate.me"  method="post"  name="fr"  id = "fr">
							<ul class="row">
								
								<li>
									<ul class="row_sub">
										<li class="title"><span>ID</span></li>
										<li class="inp_form"><input type="text" name="member_id"  id = "member_id" value="<%=mDTO.getMember_id() %>"  readonly></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Name</li>
										<li class="inp_form"><input type="text" name="member_name" id = "member_name" value="<%=mDTO.getMember_name()%>" readonly></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Post</li>
										<li class="inp_form"><input type="text" name="member_post" id = "member_post" value="<%=mDTO.getMember_post() %>"  readonly></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title" id="title_address">Address</li>
										<li ><input type="text" name="member_address1" id = "member_address1" value="<%=mDTO.getMember_address1() %>"  placeholder="주소" class="inp_addr" readonly><br><input type="text" name="member_address2"  id = "member_address2" value="<%=mDTO.getMember_address2() %>" placeholder="상세주소" class="inp_addr2" readonly></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Phone</li>
										<li>
										<input type="text" name="member_phone1" id ="member_phone1" value="<%=mDTO.getMember_phone() %>"  readonly></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">E-mail</li>
										<li><input type="text" name="str_email02" id="str_email02"  value ="<%=mDTO.getMember_email() %>" readonly>
										</li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
									<li class="title">Join Date</li>
									<li><input type="text" value="<%=date.format(mDTO.getMember_date()) %>" readonly></li>
									</ul>
								</li>
								
								<li>
									<div class="btn_btm_center">
										<ul>
											<li class="btn_cancle">
												<input type="submit" value="정보 수정" class ="btn_type4" id = "submit_button">
											</li>
											<li>
												<input type="button" value="회원탈퇴" class ="btn_type4" onclick = "location.href = 'MemberDelete.me'">
											</li>
										</ul>
									</div>
								</li>
								
							</ul>
						</form>
						</div>
						</div>
					</div>
					<!-- //메인 페이지-->
				</article>
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>