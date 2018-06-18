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
function book_io(){
		if ($('#bok_io_fr_1').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		} else if ($('#bok_io_fr_2').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		} else if ($('#bok_io_fr_3').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		} else if ($('#bok_io_fr_4').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		}  else if ($('#bok_io_fr_5').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		}  else if ($('#bok_io_fr_6').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		}  else if ($('#bok_io_fr_7').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		}  else if ($('#bok_io_fr_8').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		}  else if ($('#bok_io_fr_9').val() == "") {
			$.Alert("작성내용을 모두 입력해 주세요", function(){});
			return false;
		} else {
			$.Confirm( '입력하신 책을 입고하시겠습니까?', function(){
				$('#bok_io_fr').attr("action","./AdminBookWriteAction.am");
				$('#bok_io_fr').submit(); });
		}
}	
</script>
</head>
<body>
	<%
		String member_id = (String)session.getAttribute("member_id");
		if ((member_id == null) || !(member_id.equals("admin"))) {
			response.sendRedirect("./Main.fp");
		}
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
				
					
					<!-- 본문 공간 -->

	
			<div class="join_form">
			<h3>책 입고하기</h3>
			<form action="" method="post" enctype="multipart/form-data" id="bok_io_fr">
				<ul class="row">
					<li>
						<ul class="row_subIO">
							<li class="title"><span>표제</span></li>
							<li class="adm_inp_form"><input type="text" name="book_subject" id="bok_io_fr_1"></li>
						</ul>
					</li>
					<li>
						<ul class="row_subIO">
						<li class="title"><span>저자</span></li>
						<li class="adm_inp_form"><input type="text" name="book_author" id="bok_io_fr_2"></li>
						</ul>
					</li>
					<li>
						<ul class="row_subIO">
						<li class="title"><span>발행처</span></li>
						<li class="adm_inp_form"><input type="text" name="book_publisher" id="bok_io_fr_3"></li>
						</ul>
					</li>
					<li>
						<ul class="row_subIO">
						<li class="title"><span>발행일</span></li>
						<li class="adm_inp_form"><input type="text" name="book_pubDate" id="bok_io_fr_4" placeholder="YYYY-MM-DD 형식으로 입력해주세요" ></li>
						</ul>
					</li>
					<li>
						<ul class="row_subIO">
						<li class="title"><span>형태</span></li>
						<li class="adm_inp_form"><input type="text" name="book_form" id="bok_io_fr_5"></li>
						</ul>
					</li>
					<li>
						<ul class="row_subIO">
						<li class="title"><span>주기</span></li>
						<li class="adm_inp_form"><input type="text" name="book_notation" id="bok_io_fr_6"></li>
						</ul>
					</li>
					<li>
						<ul class="row_subIO">
						<li class="title"><span>국제표준번호</span></li>
						<li class="adm_inp_form"><input type="text" name="book_isbn" id="bok_io_fr_7"></li>
						</ul>
					</li>
					<li>
						<ul class="row_subIO">
						<li class="title"><span>분류기호</span></li>
						<li class="adm_inp_form"><input type="text" name="book_classification" id="bok_io_fr_8"></li>
						</ul>
					</li>
					<li>
						<ul class="row_subIO">
						<li class="title"><span>책 사진</span></li>
						<li class="adm_inp_form"><input type="file" name="book_file" class="IOcss" id="bok_io_fr_9"></li>
						</ul>
					</li>
				</ul>
				
				<div class="btn_btm_center">
				<ul>
					<li class="btn_cancle"><input type="button" value="입고하기" onclick="book_io();" class ="btn_type4 BTN_IF_LIST"></li>
					<li class="btn_cancle"><input type="reset" value="취소" class ="btn_type4 BTN_IF_LIST"></li>
				</ul>
				</div>
				
			</form>
			</div>
		 <!-- table 풀 페이지 div -->
			</div>
			<!-- // 본문 공간 --> 
				</article>
			 </section>
		</div>
		<!-- //container -->

</body>
</html>