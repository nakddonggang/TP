<%@page import="net.book.db.BookDTO"%>
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
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
				

					<div class='join_form adminfo_join_form' >
					<h2>희망도서 정보</h2>
					<div class="adm">
					<form action="./AdminHBookWriteAction.am" method="post">
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
										<option value="wait" <%if(bookdto.getHbook_check()=="wait") {%>selected<%}%>>대기</option>
										<option value="in" <%if(bookdto.getHbook_check()=="in") {%>selected<%}%>>입고됨</option>
										<option value="not-in" <%if(bookdto.getHbook_check()=="not-in") {%>selected<%}%>>입고불가</option>
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
										<li class="inp_form"><input type="text" name="hbook_isbn" value="<%=bookdto.getHbook_isbn()%>"></li>
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
						<input type="submit" value="수정" class ="btn_type4 BTN_IF_LIST">
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