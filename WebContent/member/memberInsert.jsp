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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;

                } else {
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('member_post').value = data.zonecode; 
                document.getElementById('member_address1').value = fullAddr;
                document.getElementById('member_address2').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#submit_button").click(function() {
		alert("ok");
	});
});

</script>
</head>
<body>
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
					
					<h3>회원가입</h3>
					
					<div class='join_form'>
						<form action="MemberJoinAction.me"  method="post"  name="fr" >
							<ul class="row">
								<li>
									<ul class="row_sub">
										<li class="title"><span>ID</span></li>
										<li class="inp_form"><input type="text" name="member_id" value=""><input type = "button" name = "id_search" value = "중복확인"></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Pass</li>
										<li class="inp_form"><input type="text" name="member_pass" value=""></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Name</li>
										<li class="inp_form"><input type="text" name="member_name" value=""></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Post</li>
										<li class="inp_form"><input type="text" name="member_post" id = "member_post" value="" ><input type = "button" name = "address_search"  value = "주소찾기" onclick = "sample6_execDaumPostcode()"></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Address</li>
										<li ><input type="text" name="member_address1" id = "member_address1" value=""  placeholder="주소" class="inp_addr"><br><input type="text" name="member_address2"  id = "member_address2" value="" placeholder="상세주소" class="inp_addr2"></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Phone</li>
										<li>
										<select name = "phone_frist" class = "phone_frist">
										<option value = "phone_010">010</option>
										<option value = "phone_011">011</option>
										<option value = "phone_016">016</option>
										<option value = "phone_018">018</option>
										</select>
										<input type="text" name="member_phone1" value=""  class="inp_form"><input type="text" name="member_phone2" value=""  class="inp_form2"></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">E-mail</li>
										<li><input type="text" class="mb_mail" name="member_email" value="">
										<select name = "email_address">
										<option value = "naver.com">naver.com</option>
										<option value = "daum.net">daum.net</option>
										<option value = "google.com">google.com</option>
										<option value = "nate.com">nate.com</option>
										<option value = "write">직접입력</option>
										</select></li>
									</ul>
								</li>
								<li>
									<div class="btn_btm_center">
										<ul>
											<li class="btn_cancle">
												<input type="button" value="회원가입" class ="btn_type4" id = "submit_button">
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
		<!-- //메인 페이지-->
				</article>
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>