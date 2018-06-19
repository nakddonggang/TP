<%@page import="net.facility.db.FacilityDTO"%>
<%@page import="java.util.List"%>
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
									<div id="serveFacil_img"  class="box_thm01">
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
				<div class="box_wrap">
				<div class="text_top">
							<h3>열람실 자리 신청</h3>
							<div class="dl_box">
								<dl>
									<dt>이용안내</dt>
									<dd><span class="bold">평일 :</span> 09:00 ~ 24:00</dd>
									<dd><span class="bold">주말 , 공휴일 :</span> 10:00 ~ 21:00</dd>
									<dd><span class="bold">휴관일 :</span> 매월 첫 번째 세 번째 월요일, 공휴일</dd>
									<br>
									<dt>주의 사항</dt>
									<dd>초록색: 사용가능 / 빨강색: 사용중  / 검은색 : 이용불가</dd>
								</dl>
							</div>
						</div>
					<fieldset class="seatLayout">
					<legend class="seatlegend">[출입문]</legend>
					
						
						<ul>
					<%
					List<FacilityDTO> Facilitylist = (List<FacilityDTO>)request.getAttribute("Facilitylist");
					for(FacilityDTO fDTO : Facilitylist) {
						out.print(
							"<li class='seat'>" + 
								"<a class='btn-open-facil' rel='./FacilityView.fy?facil_num="+fDTO.getFacil_num()+"' href = '#'>" + 
									"<div class='ucheck" + fDTO.getFacil_use() + "' id='" + fDTO.getFacil_num() + "'>" + 
										"<span>" + fDTO.getFacil_num() + "</span>" + 
									"</div>" + 
								"</a>" + 
							"</li>");
						if(fDTO.getFacil_num().substring(1, 2).equals("4")) {
							out.print("<li><div class='abc'></div></li>");
					}
						if(fDTO.getFacil_num().substring(1, 2).equals("7")) {
								out.print("</ul><ul>");
						}
					}
					%>
					</ul>
					<div id="facil_dialog">
						<iframe src=''>이 브라우저는 iframe을 지원하지 않습니다</iframe>
					</div>
				
					</fieldset>
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