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
<script type="text/javascript">
	$(document).ready(function(){
		var facil_num = $('#add1').val();
		
		$("#ajaxUseFacilbutton").click(function(){
			var facil_use = $('#hidden_facil_use').val();
			$.ajax({
				url:'./AdminFacilUseButton.am',
				type:'POST',
				data:{
					'facil_num':facil_num,
					'facil_use':facil_use
				},
				success:function(data) {
					if(data == '0') {
						$("#ajaxUseFacilTextBar").attr("value" , "이용가능");
						$("#ajaxUseFacilbutton").attr("value" , "사용불가")
						$("#hidden_facil_use").attr("value" , "0");
					} else if(data == '2') {
						$("#ajaxUseFacilTextBar").attr("value" , "이용불가");
						$("#ajaxUseFacilbutton").attr("value" , "사용가능");
						$("#hidden_facil_use").attr("value" , "2");
						}
					}
			});
		});
		
		$("#Facil_Add12").click(function(){
			var obj_mname = $('#obj_mname').val();
				$.ajax({
					url:'./AdminFacilSuggAddAction.am',
					type:'POST',
					data:{
						'obj_mname':obj_mname,
						'facil_num':facil_num
					},
					success:function(data) {
						//$("#ajax_facil").html(data);
						if(data == '1'){
							$("#addFacilDialog").dialog("close");
							//$("#ajax_facil").append(data);
							location.reload();
						}
					}
				});
		});
		
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
		String member_id = (String)session.getAttribute("member_id");
		if ((member_id == null) || !(member_id.equals("admin"))) {
			response.sendRedirect("./Main.fp");
		}
	%>
<%
request.setCharacterEncoding("UTF-8");
String facil_use = (String)request.getAttribute("facil_use");
String facil_num = (String)request.getAttribute("facil_num");
List<FacilityDTO> facilList = (List<FacilityDTO>)request.getAttribute("facilList");
List<FacilityDTO> facilAddList = (List<FacilityDTO>)request.getAttribute("facilAddList");
String pageNum = (String)request.getAttribute("pageNum");
%>
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
									<div id="admFacilSuggInfo_img" >
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
				
					<div class="write_form">
							<h3>시설관리</h3>
							<h4><span class="bold"><%=facil_num%></span> 자리정보</h4>
							<form action="./AdminFacilSuggUpdate.am"  method="post"  name="fr">
							<input type="hidden" value=<%=facil_num%> name="facil_num" id="add1">
							<input type="hidden" value=<%=facilList.size()%> name="facilList_size">
								<ul class="rowadmin">
									<li>
										<ul class="row_subfacil1">
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
									<li>
										<ul class="row_subfacil1">
										
											<li class="title">시설상태</li>
											<li class="inp_form">
											<input type="hidden" value="<%=facil_use %>" id="hidden_facil_use">
											<%if(facil_use.equals("0")) {%>
											<input type="text" value="이용가능"  id="ajaxUseFacilTextBar"  readonly>
											<input type="button" value="사용불가"  id="ajaxUseFacilbutton">
											<%} else if(facil_use.equals("1")) {%>
											<input type="text"  value="이용중"  id="ajaxUseFacilTextBar"  readonly>
											<%} else if(facil_use.equals("2")) {%>
											<input type="text"  value="이용불가"  id="ajaxUseFacilTextBar"  readonly>
											<input type="button" value="사용가능" id="ajaxUseFacilbutton">
											<%} %>
										</ul>
									</li>
									<li>

											
											<%for(int i = 0; i<facilList.size(); i++){
												FacilityDTO	fDTO = facilList.get(i);
												String obj_condition = fDTO.getObj_condition();
											%>
											<ul class="row_subfacil2">
											<li class="title">시설물<%=(i+1)%></li>
											<li class="inp_form" id="ajax_facil">
											
												<input type="text" name="obj_mname<%=i%>" value="<%=fDTO.getObj_mname()%>" readonly>
												
												<%if(obj_condition.equals("0")){%>
												<p class="facil2_p"><select name="obj_condition<%=i%>">
												 <option value="0">사용가능</option>
												 <option value="1">사용불가능</option>
												 </select></p>
												 <%}else{ %>
												<p class="facil2_p"><select name="obj_condition<%=i%>">
												 <option value="1">사용불가능</option>
												 <option value="0">사용가능</option>
												 </select></p>
												 <%}%>
												 
												<input type="text" name="obj_d_reason<%=i%>" class="facilhide" value="<%=fDTO.getObj_d_reason()%>">
											</li>
											</ul>
											<%}%>
									</li>	
										
									
								</ul>
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
							</form>
						</div>

				</div>
				<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
	<div id="addFacilDialog">
		<div class='member_modal'>
<%-- 			<form action="./AdminFacilSuggAddAction.am?facil_num=<%=facil_num%>" method="post" name="fr" id="facilAddForm"> --%>
				<fieldset>
					<div class="row_group">
					<div class="info_txt"><p><span>시설물종류</span></p></div>
						<select name="obj_mname" id="obj_mname">
								<%
									for (int i = 0; i < facilAddList.size(); i++) {
									FacilityDTO fDTO = facilAddList.get(i);
								%>
					<option value="<%=fDTO.getObj_mname()%>"><%=fDTO.getObj_mname()%></option>
					<%
						}
					%>
				</select>
				
			</div>
			<div class="btn_btm_center btn_btm_modal" id="BTN_CLOSE1">
				<ul>
					<li class="btn_cancle"><input type="button" value="시설물 추가" class="btn_type4" id="Facil_Add12"></li>
					<li><input type="button" value="닫기" class="btn_type4" id="BTN_CLOSE1"></li>
				</ul>
			</div>
		</fieldset>
<!-- 	</form> -->
</div>
	</div> 
</body>
</html>