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
						<form action="./MemberLoginAction.me" method="post" name="fr">
							<fieldset class="memberform">
								<legend>로그인 페이지</legend>
								<label>아이디:</label><input type="text" name="member_id"><br>
								<label>비밀번호:</label><input type="password" name="member_pass">
							</fieldset>
							<input type="button" value="로그인" onclick="sub()"><input type="button" value="회원가입" onclick="location.href = './MemberJoin.me'">
						</form>
					</div>
				<!-- //메인 페이지-->
				</article>
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
<script>
	function sub(){	//필수입력 아이디	
		if(document.fr.member_id.value == ""){
			alert("아이디를 입력해주시기 바랍니다");
			document.fr.member_id.focus();
			return;
		}
		
		if(document.fr.member_pass.value == ""){
			alert("비밀번호를 입력해주시기 바랍니다");
			document.fr.member_pass.focus();
			return;
		}
		document.fr.submit();
	}
</script>
</body>
</html>