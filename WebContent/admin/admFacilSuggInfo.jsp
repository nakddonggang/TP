<%@page import="java.util.List"%>
<%@page import="net.facility.db.FacilityDTO"%>
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
<script type="text/javascript">
	$(document).ready(function(){
		$('#add').click(function() {
			 var facil_num = $('#add1').val();
		     window.open('./AdminFacilSuggAdd.am?facil_num='+facil_num,"","width = 300, height = 300");
		});
	});
</script>
</head>
<%
request.setCharacterEncoding("UTF-8");
String facil_use = (String)request.getAttribute("facil_use");
String facil_num = (String)request.getAttribute("facil_num");
List<FacilityDTO> facilList = (List<FacilityDTO>)request.getAttribute("facilList");
String pageNum = (String)request.getAttribute("pageNum");
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
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
				<div class="content">
				
					<div class="write_form">
							<h1>Notice 글쓰기</h1>
							<form action="./AdminFacilSuggUpdate.am"  method="post"  name="fr">
							<input type="hidden" value=<%=facil_num%> name="facil_num" id="add1">
							<input type="hidden" value=<%=facilList.size()%> name="facilList_size">
								<ul class="row">
									<li>
										<ul class="row_sub">
											<li class="title">Facility Position</li>
											<li class="inp_form">
												<select name="category">
												<option onclick="location.href='./AdminFacilSugg.am'">좌석선택</option>
												<%
												for(int i=1; i<8; i++){%>
												<option onclick="location.href='./AdminFacilSuggInfo.am?facil_num=A<%=i%>'">A<%=i%></option>
												<%}%>
												<%
												for(int i=1; i<8; i++){%>
												<option onclick="location.href='./AdminFacilSuggInfo.am?facil_num=B<%=i%>'">B<%=i%></option>
												<%}%>
												<%
												for(int i=1; i<8; i++){%>
												<option onclick="location.href='./AdminFacilSuggInfo.am?facil_num=C<%=i%>'">C<%=i%></option>
												<%}%>
												<%
												for(int i=1; i<8; i++){%>
												<option onclick="location.href='./AdminFacilSuggInfo.am?facil_num=D<%=i%>'">D<%=i%></option>
												<%}%>
												<%
												for(int i=1; i<5; i++){%>
												<option onclick="location.href='./AdminFacilSuggInfo.am?facil_num=E<%=i%>am?='">E<%=i%></option>
												<%}%>			
											</select></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
										
											<li class="title">시설상태</li>
												<li class="inp_form">
														<%if(facil_use.equals("0")){ %>
															<select name="facil_use">
															<option value="0">상태양호(이용가능)</option>
															<option value="1">상태양호(이용불가)</option>
															<option value="2">사용불가능</option>
															</select>
															<input type="text" value="미사용" readonly>
															<%}else if(facil_use.equals("1")){%>
															<select name="facil_use">
															<option value="1">상태양호(이용불가)</option>
															<option value="0">상태양호(이용가능)</option>
															<option value="2">사용불가능</option>
															</select>
															<input type="text"  value="사용중" readonly>
															<%}else if(facil_use.equals("2")){ %>
															<select name="facil_use">
															<option value="2" >사용불가능</option>
															<option value="0">상태양호(이용가능)</option>
															<option value="1">상태양호(이용불가)</option>
															</select>
															<%} %>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">자리 내용</li>
											<%for(int i = 0; i<facilList.size(); i++){
												FacilityDTO	fDTO = facilList.get(i);
												String obj_condition = fDTO.getObj_condition();
											%>
											<li class="inp_form">
											
												<input type="text" name="obj_mname<%=i%>" value="<%=fDTO.getObj_mname()%>" readonly>
												
												<%if(obj_condition.equals("0")){%>
												<select name="obj_condition<%=i%>">
												 <option value="0">사용가능</option>
												 <option value="1">사용불가능</option>
												 </select>
												 <%}else{ %>
												 <select name="obj_condition<%=i%>">
												 <option value="1">사용불가능</option>
												 <option value="0">사용가능</option>
												 </select>
												 <%}%>
												 
												<input type="text" name="obj_d_reason<%=i%>" class="nofloat1" value="<%=fDTO.getObj_d_reason()%>">
											</li>
											<%}%>
										</ul>	
									</li>	
										<div class="btn_btm_center">
											<ul>
												<li class="btn_cancle">
													<input type="button" id="add" name="add" value="시설물 추가" class ="btn_type4" >
												</li>
												<li class="btn_cancle">
													<input type="submit" value="시설물 수정" class ="btn_type4">
												</li>
											</ul>
										</div>
									
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