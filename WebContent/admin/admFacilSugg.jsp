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
<script type="text/javascript">
	$(document).ready(function(){
		$('#category1').change(function(){
			var category1 = $("#category1 > option:selected").val();	
			if(category1!=""){
				$(location).attr('href', category1);
			} else { }
		});
	});
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String member_id = (String)session.getAttribute("member_id");
if ((member_id == null) || !(member_id.equals("admin"))) {
	response.sendRedirect("./Main.fp");
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
				<div class="content">
				
					<div class="write_form">
							<h3>시설관리</h3>
							<form action="./AdminFacilSuggUpdate.am"  method="post"  name="fr">
								<ul class="rowadmin">
									<li>
										<ul class="row_sub">
											<li class="title">시설 번호</li>
											<li class="inp_form"><select name="category1" id="category1">
												<option value="" selected="selected">좌석선택</option>
												<%
												for(int i=1; i<8; i++){%>
												<option value="./AdminFacilSuggInfo.am?facil_num=A<%=i%>">A<%=i%></option>
												<%}%>
												<%
												for(int i=1; i<8; i++){%>
												<option value="./AdminFacilSuggInfo.am?facil_num=B<%=i%>">B<%=i%></option>
												<%}%>
												<%
												for(int i=1; i<8; i++){%>
												<option value="./AdminFacilSuggInfo.am?facil_num=C<%=i%>">C<%=i%></option>
												<%}%>
												<%
												for(int i=1; i<8; i++){%>
												<option value="./AdminFacilSuggInfo.am?facil_num=D<%=i%>">D<%=i%></option>
												<%}%>
												<%
												for(int i=1; i<5; i++){%>
												<option value="./AdminFacilSuggInfo.am?facil_num=E<%=i%>">E<%=i%></option>
												<%}%>			
											</select></li>
										</ul>
								</li>
							</ul>
							</form>
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