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
<!-- board/boardCuWrite.jsp Curation 게시판 글쓰기 페이지 -->
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
					<div class="content">
					
					<form action="./BoardCurWriteAction.cu" method="post" name="fr" enctype="multipart/form-data">
						<table border="1">
							<tr>
								<td>글쓴이</td>
								<td>
									<input type="text" name="cur_name">
								</td>
							</tr>
							<tr>
								<td>제목</td>
								<td>
									<input type="text" name="cur_subject">
								</td>
							</tr>
							<tr>
								<td>타입</td>
								<td>
									<input type="text" name="cur_type">
								</td>
							</tr>
							<tr>
								<td>파일</td>
								<td>
									<input type="file" name="cur_file">
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
									<textarea cols="20" rows="10" name="cur_content" style="width: 580px; resize: none;"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="등록"><input type="reset" value="뒤로">
								</td>
							</tr>
						</table>
					</form>
					</div>
	
				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>