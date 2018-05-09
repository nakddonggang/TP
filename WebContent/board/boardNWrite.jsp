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
					<div class="content">
					
						<div class="write_form">
							<h1>Notice 글쓰기</h1>
							<form action="./BoardNoticeWriteAction.no"  method="post"  name="fr" enctype="multipart/form-data">
								<ul class="row">
									<li>
										<ul class="row_sub">
											<li class="title">TYPE</li>
											<li class="inp_form"><input type="text" name="notice_type" value=""></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">SUBJECT</li>
											<li class="inp_form"><input type="text" name="notice_subject" value=""></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">CONTENT</li>
											<li class="ta_form"><textarea cols="20" rows="10" name="notice_content"></textarea></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">FILE</li>
											<li class="inp_form">
											<!-- start 파일 입력부분 -->
												<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
												<div class="file_input_div">
													<input type="button" value="파일 찾기" class="file_input_button btn_type4">
													<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" name="notice_file">
												</div>
											<!-- end 파일 입력부분 -->
											</li>
										</ul>
									</li>
									<li>
										<div class="btn_btm_center">
											<ul>
												<li class="btn_cancle">
													<input type="submit" value="글쓰기" class ="btn_type4">
												</li>
												<li>
													<input type="reset" value="취소" class ="btn_type4">
												</li>
											</ul>
										</div>
									</li>
								</ul>
							</form>
						</div>
					</div>

				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>