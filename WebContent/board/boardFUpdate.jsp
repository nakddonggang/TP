<%@page import="net.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>혜윰나래:: FAQ 수정</title>
<link href="<c:url value="/css/jquery.fullpage.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/jquery.toast.min.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/jQuery.Alert-1.0.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.updateBoard').click(function(){
		$.Confirm('수정하시겠습니까?',	function(){
			if($('#type').val()==""){
				$.Alert("분류항목 입력하세요", function(){
					$('#type').focus();
				});
				return false;
			}
			if($('#subject').val()==""){
				$.Alert("제목 입력하세요", function(){
					$('#subject').focus();
				});
				return false;
			}
			if($('#content').val()==""){
				$.Alert("내용 입력하세요", function(){
					$('#content').focus();
				});
				return false;
			}
			$('#fUpdateForm').submit();
		});
	});
});
</script>
</head>
<body>
	<%
		BoardDTO bDTO = (BoardDTO) request.getAttribute("bDTO");
		String pageNum = request.getParameter("pageNum");
	%>

	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<article class="submenu section SECTION">
					<div class="slide DIV_SLIDE">
						<div class="intro1">
							<div class="slide_con">
								<div class="box_thm">
									<div id="boardFUpdate_img" class="box_thm01">
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
				<!-- //서브메뉴 -->

				<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
					<jsp:include page="../include/topbar.jsp" />
					<div class="content">

						<div class="write_form">

							<h1>FAQ 글쓰기</h1>
							<form
								action="./BoardFaqUpdateAction.fa?num=<%=bDTO.getFaq_num()%>&pageNum=<%=pageNum%>"
								method="post" name="fr" id="fUpdateForm" enctype="multipart/form-data">


								<ul class="row">
									<li>
										<ul class="row_sub">
											<li class="title">TYPE</li>
											<li class="inp_form"><input type="text" name="faq_type" id="type"
												value="<%=bDTO.getFaq_type()%>"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">SUBJECT</li>
											<li class="inp_form"><input type="text"
												name="faq_subject" id="subject" value="<%=bDTO.getFaq_subject()%>"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">CONTENT</li>
											<li class="ta_form"><textarea cols="20" rows="10"
													name="faq_content" id="content"><%=bDTO.getFaq_content()%></textarea></li>

										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">FILE</li>
											<li class="inp_form">
												<!-- start 파일 입력부분 --> <input type="text" id="fileName"
												class="file_input_textbox" readonly="readonly">
												<div class="file_input_div">
													<input type="button" value="파일 찾기"
														class="file_input_button btn_type4"> 
														<input
														type="file" class="file_input_hidden"
														onchange="javascript: document.getElementById('fileName').value = this.value"
														name="faq_file" value="<%=bDTO.getFaq_file()%>">
												</div> <!-- end 파일 입력부분 -->
											</li>
										</ul>
									</li>
									<li>
										<div class="btn_btm_center">
											<ul>
												<li class="btn_cancle"><input type="button" value="글수정"
													class="btn_type4 updateBoard"></li>
												<li><input type="reset" value="다시쓰기" class="btn_type4">
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