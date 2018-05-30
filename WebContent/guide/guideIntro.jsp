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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js"></script>
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
				<div class = "board">
					<h5>생각의 날개를 펼치는</h5>
				    <span class="intro">혜윰나래</span>
					<div class="dl_boxg">
							<dl>
							<dt>혜윰나래 란</dt>
							<dd>생각을 뜻하는 순우리말<span class="bold">혜윰</span>과</dd>
							<dd>날개를 뜻하는 순우리말<span class="bold">나래</span>의 만남으로</dd>
							<dd><span class="bold">생각의 날개</span>를 펼쳐 지식을 펼칠 수 있는 도서관을 뜻합니다. </dd>
							</dl>
						
<!-- 							<dl> -->
<!-- 							<dd>삼한골든게이트빌딩 7층에 위치한<span class="bold">혜윰나래</span>는</dd> -->
<!-- 							<dd>가치있는 책을 한데 모아 보존 보호하고 관리하며 함께보는 공동의 서재입니다.</dd> -->
<!-- 							<dd>60년간의 오래된 역사에 대한 혜윰나래는 출판도시 문화재단이 2014년 문화체육관광부의 후원을 받아</dd> -->
<!-- 							<dd>조성한 이래 재단의 자체 재원으로 운영하고 있는 복합문화공간입니다.</dd> -->
<!-- 							</dl> -->
							<br>
							<dl>
							<dt>혜윰나래 는</dt>
							<dd><span class="bold">21세기 지식정보화 시대</span>를 맞아 도서관은 국민 누구나 유용한 지식정보를</dd>
							<dd>편리하게 이용할 수 있는 핵심 기관으로서 더많은 변화를 요구받고 있습니다.</dd>
							</dl>
							<br>
							<dl>
							<dt>앞으로</dt>
							<dd><span class="bold">'지식정보가 국가 발전의 중요한 자원'</span>이라는 신념을 가지고</dd>
							<dd>개개인의 창의성으로 이루어 낸 지적 성취가</dd>
							<dd>오늘날의 첨단지식정보와 어우러져 <span class="bold">'살아 있는 정보'</span>로</dd>
							<dd>활용되도록 더욱 더 노력하겠습니다.</dd>
							</dl>
							<br>
					
							<dl>
							<dd>아울러 한국도서관의<span class="bold"> 국제적 위상</span>을 높이고</dd>
							<dd>국내외 도서관과의 지속적인 지원 ·협력을 확대하여</dd>
							<dd>명실상부한 <span class="bold">세계적 수준의 도서관</span>으로 거듭나겠습니다.</dd>
							<dd>여러분의 많은 관심과 지원을 부탁드립니다.</dd>
							</dl>
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