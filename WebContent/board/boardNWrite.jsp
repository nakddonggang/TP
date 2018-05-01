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
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
</head>
<body>
<!-- board/boardNWrite.jsp Notice 게시판 글쓰기 페이지 -->
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
				
				<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					<div class="total_search"></div>
					<div class="curation"></div>
					<div class=""></div>
					<div class=""></div>
					
					<h1>Notice 글쓰기</h1>
					<form action="./BoardNoticeWriteAction.no"  method="post"  name="fr" enctype="multipart/form-data">
						<table class="" >
							<tr>
								<th>TYPE</th>
								<td><input type="text" name="notice_type" value=""></td>
							</tr>
							<tr>
								<th>SUBJECT</th>
								<td><input type="text" name="notice_subject" value=""></td>
							</tr>
							<tr>
								<th>CONTENT</th>
								<textarea cols="20" rows="10" name="notice_content" style="width: 580px; resize: none;"></textarea>
							</tr>
							<tr>
								<th>FILE</th>
								<td><input type="file" name="notice_file"></td>
							</tr>
							<tr>
								<th colspan="2"><input type="submit" value="글쓰기"> <input type="reset" value="취소"></th>
							</tr>
						</table>
					</form>

				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>