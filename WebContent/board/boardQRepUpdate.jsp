<%@page import="net.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
		$.Confirm('수정하시겠습니까?', function(){
			if($('#name').val()==""){
				$.Alert("답변자 소속부서 혹은 이름 입력하세요", function(){
					$('#name').focus();
				});
				return false;
			}
			if($('#email').val()==""){
				$.Alert("답변자 EMAIL 입력하세요", function(){
					$('#email').focus();
				});
				return false;
			}
			if($('#content').val()==""){
				$.Alert("답변내용 입력하세요", function(){
					$('#content').focus();
				});
				return false;
			}
		});
		$('#rUpdateForm').submit();
	});
});
</script>
</head>
<body>
<%
BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO");
BoardDTO bDTO1 = (BoardDTO)request.getAttribute("bDTO1");
String pageNum = request.getParameter("pageNum");
%>
<!-- board/boardQRepUpdate.jsp 답변글 수정 페이지 -->
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
							<h1>답변수정</h1>
							<form action="./BoardReplyUpdateAction.qn?qna_ref=<%=bDTO.getQna_ref() %>&pageNum=<%=pageNum %>"  method="post"  name="fr" id="rUpdateForm">
								<ul class="row">
									<li>
										<ul class="row_sub">
											<li class="title">SUBJECT</li>
											<li class="inp_form"><input type="text" name="qna_subject" value="<%=bDTO.getQna_subject() %>" readonly></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">CONTENT</li>
											<li class="ta_form"><textarea cols="20" rows="10" name="qna_content" readonly="readonly"><%=bDTO.getQna_content() %></textarea></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">NAME</li>
											<li class="inp_form"><input type="text" name="rep_name" id="name" value="<%=bDTO1.getRep_name() %>"></li>
										</ul>
									</li>
									<li>
									<li>
										<ul class="row_sub">
											<li class="title">EMAIL</li>
											<li class="inp_form"><input type="text" name="rep_email" id="email" value="<%=bDTO1.getRep_email() %>"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">CONTENT</li>
											<li class="ta_form"><textarea cols="20" rows="10" name="rep_content" id="content"><%=bDTO1.getRep_content() %></textarea></li>
										</ul>
									</li>
									<li>
										<div class="btn_btm_center">
											<ul>
												<li class="btn_cancle">
													<input type="button" value="수정" class ="btn_type4 updateBoard">
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