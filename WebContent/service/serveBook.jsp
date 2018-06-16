<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	$(document).ready(function() {
		
		function Request(valuename){
			var rtnval;
			var nowAddress = unescape(location.href);
			var parameters = new Array();
			parameters = (nowAddress.slice(nowAddress.indexOf("?")+1,nowAddress.length)).split("&");
				for(var i = 0 ; i < parameters.length ; i++){
					if(parameters[i].split("=")[0] == valuename){
						rtnval = parameters[i].split("=")[1];
						if(rtnval == undefined || rtnval == null){
							rtnval = "";
						}
						return rtnval;
					}
				}
		}
		
		// direct값이 1이면 바구니에 정상적으로 들어간 것  
		var direct = Request("direct");
		if(direct=="1"){
			$.Alert('희망도서 작성완료이 완료되었습니다', function(){
				location.replace('./BookIndex.bk'); });
		} else{}
		
		$('#serve_Book').submit(function() {
			if ($('#serve_book_text1').val() == "") {
				$.Alert("작성내용을 모두 입력해 주세요", function(){});
				return false;
			} else if ($('#serve_book_text2').val() == "") {
				$.Alert("작성내용을 모두 입력해 주세요", function(){});
				return false;
			} else if ($('#serve_book_text3').val() == "") {
				$.Alert("작성내용을 모두 입력해 주세요", function(){});
				return false;
			} else if ($('#serve_book_text4').val() == "") {
				$.Alert("작성내용을 모두 입력해 주세요", function(){});
				return false;
			} else {
			}
		});
	});
</script>
</head>
<body>
	<%
		String member_id = (String) session.getAttribute("member_id");
		if (member_id == null) {
	%>
	<script type="text/javascript">
		$.Alert("로그인 한 후 사용하세요", function(){
			location.href = "./MemberLogin.me";
		});
	</script>
	<%
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

					<div class="text_top">
							<h3>희망도서 신청</h3>
							<div class="dl_box">
								<dl>
									<dt>이용안내</dt>
									<dd>희망도서신청은 도서관에 원하는 자료가 없을 경우,</dd>
									<dd>이용자가 직접 원하는 자료를 신청할 수 있는 서비스 입니다.</dd>
									<dd>판타지, 무협, 로맨스(하이틴), SF 등 오락성 도서는 자제하고,</dd>
									<dd>학술적, 문학적 가치가 있는 도서 위주로 신청하여 주시기 바랍니다.</dd>
									<br>
									<dt>주의 사항</dt>
									<dd>신청도서는 상황에 따라 구입이 제한될 수 있으니 이점 양지하시기 바랍니다.</dd>
								</dl>
							</div>
						</div>
					
					
					<div class='join_form adminfo_join_form'>
						
						<div class="adm">
							<form action="./ServeBookAction.bk" method="post" id="serve_Book">
								<input type="hidden" value="wait" name="hbook_check">
								<ul class="row">
									<li>
										<ul class="row_sub">
											<li class="title"><span>아이디</span></li>
											<li class="adm_inp_formh"><input type="text"
												name="member_id" value="<%=member_id %>" readonly></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title"><span>도서명</span></li>
											<li class="adm_inp_formh"><input type="text"
												name="hbook_subject" id="serve_book_text1"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title"><span>저자</span></li>
											<li class="adm_inp_formh"><input type="text"
												name="hbook_author" id="serve_book_text2"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title"><span>발행처</span></li>
											<li class="adm_inp_formh"><input type="text"
												name="hbook_publisher" id="serve_book_text3"></li>
										</ul>
									</li>
									<li>
										<ul class="row_sub">
											<li class="title"><span>희망도서 설명</span></li>
											<li class="adm_inp_formh"><textarea cols="35" rows="10"
													name="hbook_explain" id="serve_book_text4"></textarea></li>
										</ul>
									</li>
								</ul>

								<div class="btn_btm_center">
									<ul>
										<li class="btn_cancle"><input type="submit"
											value="도서 신청하기" class="btn_type4 BTN_IF_LIST"></li>
										<li class="adm_btn__left"><input type="reset" value="취소"
											class="btn_type4 BTN_IF_LIST"></li>
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