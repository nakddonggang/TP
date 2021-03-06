<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="net.book.db.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>혜윰나래:: 관리자페이지</title>
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
function book_reio(){
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
		}  else {
			$.Confirm( '입고된 책 정보를 수정하시겠습니까?', function(){ 
				$('#bok_io_fr').attr("action","./AdminBookReWriteAction.am");
				$('#bok_io_fr').submit(); });
		}
}	
</script>
</head>
<body>
	<%
	String member_id = (String) session.getAttribute("member_id");
	if (member_id == null) {
		boolean admincheck = (boolean) session.getAttribute("admincheck");
		if(admincheck == false) {
				response.sendRedirect("./Main.fp");
		}
	}
	%>
<%
int book_number = Integer.parseInt(request.getParameter("book_number"));
String pageNum = request.getParameter("pageNum");
BookDTO bookList = (BookDTO)request.getAttribute("bookList");
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
									<div id="admBookRWrite_img" class="box_thm01">
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
				<!-- //서브메뉴 -->
				
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
					<div class="content">
				
					<div class='join_form adminfo_join_form' >
					<h3>도서 정보 수정하기</h3>
					<form action="" method="post" id="bok_io_fr">
						<input type="hidden" name="book_number" value="<%=bookList.getBook_number()%>">
						<ul class="row">
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>고유번호 : <%=bookList.getBook_number()%> </span></li>
										<li class="inp_form"><img src="./upload/book/<%=bookList.getBook_file()%>" width="110" height="130"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>표제</span></li>
										<li class="inp_form"><input type="text" name="book_subject" value="<%=bookList.getBook_subject()%>" id="bok_io_fr_1"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>저자</span></li>
										<li class="inp_form"><input type="text" name="book_author" value="<%=bookList.getBook_author()%>" id="bok_io_fr_2"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>발행처</span></li>
										<li class="inp_form"><input type="text" name="book_publisher" value="<%=bookList.getBook_publisher()%>" id="bok_io_fr_3"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>발행일</span></li>
										<li class="inp_form"><input type="text" name="book_pubDate"  placeholder="yyyy-MM-dd 형식으로 입력해주세요" id="bok_io_fr_4"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>형태</span></li>
										<li class="inp_form"><input type="text" name="book_form" value="<%=bookList.getBook_form()%>" id="bok_io_fr_5"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>주기</span></li>
										<li class="inp_form"><input type="text" name="book_notation" value="<%=bookList.getBook_notation()%>" id="bok_io_fr_6"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>국제표준번호</span></li>
										<li class="inp_form"><input type="text" name="book_isbn" value="<%=bookList.getBook_isbn()%>" id="bok_io_fr_7"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title_bif"><span>분류기호</span></li>
										<li class="inp_form"><input type="text" name="book_classification" value="<%=bookList.getBook_classification()%>" id="bok_io_fr_8"></li>
								</ul>
							</li>
							<li>
							</li>
							</ul>
							
				<div class="btn_btm_center">
				<ul>
					<li class="adm_btn_cancle">
						<input type="button" value="수정하기"  onclick="book_reio();" class ="btn_type4 BTN_IF_LIST">
					</li>
					<li class="adm_btn__left">
						<input type="reset" value="취소" class ="btn_type4 BTN_IF_LIST">
					</li>
				</ul>
				
				</div>
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