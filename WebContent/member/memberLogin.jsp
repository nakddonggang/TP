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
<%
	String publicKeyModulus = (String) request.getAttribute("publicKeyModulus");
	String publicKeyExponent = (String) request.getAttribute("publicKeyExponent");
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
						<div class='member_content'>
							<form action="./MemberLoginAction.me" method="post" name="securedLoginForm" id="securedLoginForm" onsubmit="return validateEncryptedForm()">
								<fieldset>
									<div class="row_group">
										<div class="info_txt"><p><span>아이디</span><input type="text" name="member_id" id="member_id"></p></div>
										<div class="info_txt"><p><span>비밀번호</span><input type="password" name="member_pass" id="member_pass"></p></div>
										<input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus%>" />
						           		<input type="hidden" id="rsaPublicKeyExponent" value="<%=publicKeyExponent%>" />
						           		<input type="hidden" name="securedUsername" id="securedUsername" value="" />
										<input type="hidden" name="securedPassword" id="securedPassword" value="" />
									</div>
									<div class="btn_btm_center btn_btm_modal">
										<ul>
											<li class="btn_cancle"><input type="submit" value="로그인" class ="btn_type4"></li>
											<li><input type="button" value="닫기" class ="btn_type4" id="BTN_CLOSE"></li>
										</ul>
									</div>
								</fieldset>
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