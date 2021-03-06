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
function DLos_wr(){
			if ($('#dlos_text1').val() == "") {
				$.Alert("손망실 사유를 입력해 주세요", function(){});
				return false;
			} else if ($('#dlos_text2').val() == "") {
				$.Alert("도서 상태를 기입해 주세요", function(){});
				return false;
			} else { $.Confirm(
					'손망실 책을 등록하시겠습니까?', function(){
						$('#DLos_Fr').attr("action","./AdminBookDLosWriteAction.am");
						$('#DLos_Fr').submit(); });
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
					
					<!-- 본문 공간 -->
					
					<div class="content">
					<div class="write_form">
							
							<h3>손망실 작성</h3>
							<div class="dl_box">
								<dl>
									<dt>Read It</dt>
									<dd>게시 전 자세히 확인을 먼저 해주시고,</dd>
									<dd>분실되거나 손상된 책의 정보를 정확히 입력해주세요.</dd>
								</dl>
							
						</div>
							<form action=""  method="post"  name="fr" id="DLos_Fr">
								<ul class="row">
									<li>
										<ul class="row_sub">
											<li class="title">고유번호</li>
											<li class="inp_form"><input type="text" name="book_number" value="<%=book_number%>"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">사유</li>
											<li class="ta_form"><textarea cols="20" rows="10" name="dbook_reason" id="dlos_text1"></textarea></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title">도서상태</li>
											<li class="inp_form"><input type="text" name="dbook_state" id="dlos_text2"></li>
										</ul>
									</li>
									<li>
										<div class="btn_btm_center">
											<ul>
												<li class="btn_cancle">
													<input type="button" value="손망실 신청" onclick="DLos_wr();" class ="btn_type4" id="hbook_write">
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
						</div>
					<!-- // 본문 공간 -->
				</article>
			 </section>
		</div>
		<!-- //container -->

</body>
</html>