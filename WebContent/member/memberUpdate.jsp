<%@page import="net.member.db.MemberDTO"%>
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
	
	$("#member_phone1").keyup(function() {
		var charLimit = $(this).attr("maxlength");
		if (this.value.length >= charLimit) {
			$("#member_phone2").focus();
			return ;
		}
	});
	
	$("#member_phone2").keyup(function() {
		var charLimit = $(this).attr("maxlength");
		if (this.value.length >= charLimit) {
			$("#member_email").focus();
			return ;
		}
	});
	
	$('#selectEmail').change(function(){ 
		$("#selectEmail option:selected").each(function () { 
			if($(this).val()== '1'){ 	//직접입력일 경우 
				$("#str_email02").val(''); 	//값 초기화 
				$("#str_email02").attr("disabled",false); //활성화 
				}else{ 						//직접입력이 아닐경우 
					$("#str_email02").val($(this).text()); 	//선택값 입력 
					$("#str_email02").attr("disabled",true); 	//비활성화 
				}
		});
	
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
				<%
					String member_id = (String)session.getAttribute("member_id");
					MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
					if(member_id == null) {
						response.sendRedirect("./MemberLogin.me");
					}
					String phone1 = "";
					String phone2 = "";
					String phone3 = "";
					if(mDTO.getMember_phone().length() == 11) {
						phone1 = mDTO.getMember_phone().substring(0, 3);
						phone2 = mDTO.getMember_phone().substring(3, 7);
						phone3 = mDTO.getMember_phone().substring(7);
					} else {
						phone1 = mDTO.getMember_phone().substring(0, 3);
						phone2 = mDTO.getMember_phone().substring(3, 6);
						phone3 = mDTO.getMember_phone().substring(6);
					}
					
					String [] email = mDTO.getMember_email().split("@");
					
				%>
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
					<div class="content">
					<div class='member_content'>
				
					
					<div class='join_form'>
					<h3>회원정보 수정</h3>
						<form action="MemberUpdateAction.me"  method="post"  name="fr"  id = "fr">
							<ul class="row">
								
								<li>
									<ul class="row_sub">
										<li class="title"><span>ID</span></li>
										<li class="inp_form"><input type="text" name="member_id"  id = "member_id" value="<%=mDTO.getMember_id() %>"  readonly></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Name</li>
										<li class="inp_form"><input type="text" name="member_name" id = "member_name" value="<%=mDTO.getMember_name()%>" readonly></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Post</li>
										<li class="inp_form"><input type="text" name="member_post" id = "member_post" value="<%=mDTO.getMember_post() %>"  readonly><input type = "button" name = "address_search"  value = "주소찾기" onclick = "sample6_execDaumPostcode()"></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Address</li>
										<li ><input type="text" name="member_address1" id = "member_address1" value="<%=mDTO.getMember_address1() %>"  placeholder="주소" class="inp_addr" readonly><br><input type="text" name="member_address2"  id = "member_address2" value="<%=mDTO.getMember_address2() %>" placeholder="상세주소" class="inp_addr2"></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Phone</li>
										<li>
										<select name = "phone_frist" class ="phone_frist">
										<option value = "010" <% if(phone1.equals("010")) { out.println("selected"); } %>>010</option>
										<option value = "011" <% if(phone1.equals("011")) { out.println("selected"); } %>>011</option>
										<option value = "016" <% if(phone1.equals("016")) { out.println("selected"); } %>>016</option>
										<option value = "018" <% if(phone1.equals("018")) { out.println("selected"); } %>>018</option>
										</select>
										<input type="text" name="member_phone1" id ="member_phone1" value="<%=phone2 %>"  class="inp_form" maxlength=4 ><input type="text" name="member_phone2" id ="member_phone2" value="<%=phone3 %>"  class="inp_form2" maxlength=4></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">E-mail</li>
										<li><input type="text" name="str_email01" id="str_email01"  class="mb_mail" value = "<%=email[0]%>"><span id="address_shift2" >@</span><input type="text" name="str_email02" id="str_email02"  class="mb_mail2" disabled value="<%=email[1]%>">
										<select name = "selectEmail"" id="selectEmail">
										<option value = "naver.com" <% if(email[1].equals("naver.com")) { out.println("selected"); } %>>naver.com</option>
										<option value = "daum.net" <% if(email[1].equals("daum.net")) { out.println("selected"); } %>>daum.net</option>
										<option value = "google.com" <% if(email[1].equals("google.com")) { out.println("selected"); } %>>google.com</option>
										<option value = "nate.com" <% if(email[1].equals("nate.com")) { out.println("selected"); } %>>nate.com</option>
										<option value = "1">직접입력</option>
										</select></li>
									</ul>
								</li>
								
								<li>
									<div class="btn_btm_center">
										<ul>
											<li class="btn_cancle">
												<input type="submit" value="정보 수정" class ="btn_type4" id = "submit_button">
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
				<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>