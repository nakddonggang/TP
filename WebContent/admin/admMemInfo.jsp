<%@page import="java.text.SimpleDateFormat"%>
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
<title>혜윰나래:: 관리자페이지</title>
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
<%
String info_id = request.getParameter("info_id");
String pageNum = request.getParameter("pageNum");
String pageType = request.getParameter("pageType");
String member_level = request.getParameter("member_level");
if(member_level==null){
	member_level = "%";
}
MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
int borrowcount = (int)(request.getAttribute("borrowcount"));
int overduecount = (int)request.getAttribute("overduecount");
int overduedate = (int)request.getAttribute("overduedate");
String member_id = (String) session.getAttribute("member_id");
if (member_id == null) {
	boolean admincheck = (boolean) session.getAttribute("admincheck");
	if(admincheck == false) {
			response.sendRedirect("./Main.fp");
	}
}
SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
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
				<article class="submenu section SECTION">
					<div class="slide DIV_SLIDE">
						<div class="intro1">
							<div class="slide_con">
								<div class="box_thm">
									<div id="admMemInfo_img" class="box_thm01">
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
				<div class="content">
					<div class="join_form">
							<h3>사용자 정보보기</h3>
							<ul class="row">
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>User ID</span></li>
										<li class="inp_form"><input type="text" name="member_id" value="<%=mDTO.getMember_id()%>" readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>Password</span></li>
										<li class="inp_form"><input type="text" name="member_pass"  value="<%=mDTO.getMember_pass()%>"  readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>Name</span></li>
										<li class="inp_form"><input type="text" name="member_name" value="<%=mDTO.getMember_name()%>" readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>E-Mail</span></li>
										<li class="inp_form"><input type="text" name="member_email" value="<%=mDTO.getMember_email()%>" readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>Post</span></li>
										<li class="inp_form"><input type="text" name="member_post"  value="<%=mDTO.getMember_post()%>" readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>Address</span></li>
										<li class="inp_form"><input type="text" name="member_address"  value="<%=mDTO.getMember_address1()%><%=mDTO.getMember_address2()%> " readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>Phone</span></li>
										<li class="inp_form"><input type="text" name="member_phone" value="<%=mDTO.getMember_phone()%>" readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>Date</span></li>
										<li class="inp_form"><input type="text" name="member_date" value="<%=date.format(mDTO.getMember_date())%>" readonly></li>
									</ul>
								</li>
							</ul>
							<ul class="row">
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>회원등급</span></li>
										<%
										if(mDTO.getMember_level().equals("0")){
										%><li class="inp_form"><input type="text" name="level" value="일반회원" readonly></li><%
										}else if(mDTO.getMember_level().equals("1")){
											%><li class="inp_form"><input type="text" name="level" value="블랙리스트" readonly></li><%
										}else if(mDTO.getMember_level().equals("2")){
											%><li class="inp_form"><input type="text" name="level" value="우수회원" readonly></li><%
										}else if(mDTO.getMember_level().equals("3")){
											%><li class="inp_form"><input type="text" name="level" value="관리자" readonly></li><%
										}%>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>대출횟수</span></li>
										<li class="inp_form"><input type="text" name="borrow_count"  value="<%=borrowcount%>"  readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>연체횟수</span></li>
										<li class="inp_form"><input type="text" name="bl_count" value="<%=mDTO.getBl_count()%>" readonly></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="title_adm"><span>연체총일수</span></li>
										<li class="inp_form"><input type="text" name="bl_date" value="<%=mDTO.getBl_date()%>" readonly></li>
									</ul>
								</li>
							</ul>
							<div class="btn_btm_center">
								<ul>
									<li>
										<input type="button" value="글목록" onclick='location.href="./AdminMemberIndex.am?pageNum=<%=pageNum %>&member_level=<%=member_level %>"' class ="btn_type4 BTN_IF_LIST"></li>
									<li>	<input type="button" value="회원정보수정" onclick="location.href='./AdminMemberUpdate.am?info_id=<%=mDTO.getMember_id() %>'" class ="btn_type4 BTN_IF_LIST">
									</li>
								</ul>
							</div>
						</div>
					</div>
				<!-- //메인 페이지-->
				</article>
			</section>
		<!-- //본문 컨테이너 -->
		</div>
	</div>
</body>
</html>