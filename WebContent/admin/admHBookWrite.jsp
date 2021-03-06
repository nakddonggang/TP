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
function hb_write(){
		if ($('#hb_isbn').val() == "") {
			$.Alert("국제표준번호를 입력해 주세요", function(){});
			return false;
		} else { $.Confirm( '희망도서 책 정보를 수정하시겠습니까?', function(){ 
			$('#hb_write_fr').attr("action","./AdminHBookWriteAction.am");
			$('#hb_write_fr').submit(); });
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
BookDTO bookdto = (BookDTO)request.getAttribute("bookdto");
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
									<div id="admHBookWrite_img" class="box_thm01">
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
					<h3>희망도서 정보</h3>
					<div class="adm">
					<form action="" method="post" id="hb_write_fr">
						<ul class="row">
							<li>
								<ul class="row_sub">
										<li class="title"><span>아이디</span></li>
										<li class="inp_form"><input type="text" name="member_id" value="<%=bookdto.getMember_id()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>도서명</span></li>
										<li class="inp_form"><input type="text" name="hbook_subject" value="<%=bookdto.getHbook_subject() %>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>저자</span></li>
										<li class="inp_form"><input type="text" name="hbook_author" value="<%=bookdto.getHbook_author()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>처리상태</span></li>
										<li class="inp_form"><select name="hbook_check">
										<option value="wait" <%if(bookdto.getHbook_check().equals("wait")) {%>selected<%}%>>대기</option>
										<option value="in" <%if(bookdto.getHbook_check().equals("in")) {%>selected<%}%>>입고됨</option>
										<option value="not-in" <%if(bookdto.getHbook_check().equals("not-in")) {%>selected<%}%>>입고불가</option>
										</select></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>발행처</span></li>
										<li class="inp_form"><input type="text" name="hbook_publisher" value="<%=bookdto.getHbook_publisher()%>" readonly></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>국제표준번호</span></li>
										<li class="inp_form"><input type="text" name="hbook_isbn"  id="hb_isbn"
										<%if(bookdto.getHbook_isbn()!=null){%>value="<%=bookdto.getHbook_isbn()%><%}%>"></li>
								</ul>
							</li>
							<li>
								<ul class="row_sub">
										<li class="title"><span>희망도서 설명</span></li>
										<li class="inp_form"><input type="text" name="hbook_explain" value="<%=bookdto.getHbook_explain()%>" readonly></li>
								</ul>
							</li>
						</ul>
							
				<div class="btn_btm_center">
				<ul>
					<li class="btn_cancle">
						<input type="button" value="수정" onclick="hb_write();" class ="btn_type4 BTN_IF_LIST">
					</li>
					<li class="adm_btn__left">
						<input type="reset" value="취소" class ="btn_type4 BTN_IF_LIST">
					</li>
				</ul>
				</div>
				</form>
				
				</div>
				
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