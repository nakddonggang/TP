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
						<h1>회원가입</h1>
						<form action="MemberJoinAction.me"  method="post"  name="fr" >
							<fieldset class="memberform">
								<legend>회원가입</legend>
								<label>ID</label><input type="text" name="member_id" value=""><br>
								<label>Pass</label><input type="text" name="member_pass" value=""><br>
								<label>Name</label><input type="text" name="member_name" value=""><br>
								<label>Post</label><input type="text" name="member_post" value=""><br>
								<label>Address</label><input type="text" name="member_address1" value=""><input type="text" name="member_address2" value=""><br>
								<label>Phone</label><input type="text" name="member_phone" value=""><br>
								<label>E-mail</label><input type="text" name="member_email" value="">
							</fieldset>
							<input type="submit" value="회원가입"> <input type="reset" value="취소">
						</form>
					</div>
		<!-- //메인 페이지-->
				</article>
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>