<%@page import="net.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
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
					<ul class="tabs">
					    <li class="active" rel="tab1">회원목록</li>
					    <li rel="tab2">우수회원</li>
					    <li rel="tab3">블랙리스트</li>
					</ul>
					<div class="tab_container">
				  
					    <div id="tab1" class="tab_content">
							<iframe src="./AdminMemberNormal.am">이 브라우저는 iframe을 지원하지 않습니다</iframe>
					    </div>
					    
					    <div id="tab2" class="tab_content">
							<iframe src="./AdminMemberGood.am">이 브라우저는 iframe을 지원하지 않습니다</iframe>
					    </div>
					    
					    <div id="tab3" class="tab_content">
							<iframe src="./AdminMemberBlack.am">이 브라우저는 iframe을 지원하지 않습니다</iframe>
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