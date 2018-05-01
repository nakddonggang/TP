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
					<h1>회원가입</h1>
					<form action="MemberJoinAction.me"  method="post"  name="fr" >
						<table class="" >
							<tr>
								<th>ID</th>
								<td><input type="text" name="member_id" value=""></td>
							</tr>
							<tr>
								<th>Pass</th>
								<td><input type="text" name="member_pass" value=""></td>
							</tr>
							<tr>
								<th>Name</th>
								<td><input type="text" name="member_name" value=""></td>
							</tr>
							<tr>
								<th>Post</th>
								<td><input type="text" name="member_post" value=""></td>
							</tr>
							<tr>
								<th>Address</th>
								<td><input type="text" name="member_address1" value=""> <input type="text" name="member_address2" value=""></td>
							</tr>
							<tr>
								<th>Phone</th>
								<td><input type="text" name="member_phone" value=""></td>
							</tr>
							<tr>
								<th>E-mail</th>
								<td><input type="text" name="member_email" value=""></td>
							</tr>
							<tr>
								<th colspan="2"><input type="submit" value="회원가입"> <input type="reset" value="취소"></th>
							</tr>
						</table>
					</form>

		<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>