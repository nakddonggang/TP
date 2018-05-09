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
			<jsp:include page="../include/submenu_map.jsp" />
			<!-- //서브메뉴 -->
    			<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
				<div class="content">
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					
					<address>
					
					<div>
					<h1>주소</h1>
					<ul>
					<li>부산광역시 부산진구 동천로 109 삼한골든게이트</li>
					<li>지번 : 부산광역시 부산진구 부전동 112-3 삼한골든게이트빌딩 7층</li>
					<li>TEL : 051-803-0909(대표), FAX : 051-803-0979</li>
					</ul>
					</div>
					<br>
					
					<div>
					<h1>지하철로 오실 경우</h1>
					<p>서면 지하철역 하차시  : 8번 출구 - NC백화점 사거리방향으로 이동 - 미니스탑 편의점에서 <br>
					부전동 방향으로 이동 - 삼한골든게이트빌딩 7층 아이티윌 부산교육센터 (1층 : 쉐보레 자동차)</p>
					</div>
					<br>
					
					
					<div>
					<h1>버스로 오실 경우</h1>
					<ul>
					<li>20, 10 탑승시 : 전포초등학교 정류장 하차</li>
					<li>24, 85, 138-1, 160 탑승시 : NC서면점 정류장 하차</li>
				    <li>5-1 탑승시 : 부전시장 정류장 하차</li>
				    </ul>
				    </div>
				    
				    </address>
				    
				</div>
				<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
  </body>
</html>

