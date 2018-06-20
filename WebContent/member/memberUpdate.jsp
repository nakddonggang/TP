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
    
    function validateEncryptedUpdateForm() {

        var member_id = $("#member_id").val();
        var member_name = $("#member_name").val();
        var member_post = $("#member_post").val();
        var member_address1 = $("#member_address1").val();
        var member_address2 = $("#member_address2").val();
        var member_phone1 = $(".phone_frist option:selected").val();
        var member_phone2 = $("#member_phone1").val();
        var member_phone3 = $("#member_phone2").val();
        var member_email1 = $("#str_email01").val();
        var member_email2 = $("#str_email02").val();
        
        try {
            var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
            var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
            submitEncryptedUpdateForm(member_id, member_name, member_post, member_address1, member_address2, member_phone1, member_phone2, member_phone3, member_email1, member_email2, rsaPublicKeyModulus, rsaPublicKeyExponent);
        } catch(err) {
            alert(err);
        }
        return false;
    }

    function submitEncryptedUpdateForm(member_id, member_name, member_post, member_address1, member_address2, member_phone1, member_phone2, member_phone3, member_email1, member_email2, rsaPublicKeyModulus, rsaPublicKeyExponent) {
    	var rsa = new RSAKey();
        rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);

        // 사용자ID와 비밀번호를 RSA로 암호화한다.
        var securedId = rsa.encrypt(member_id);
        var securedName = rsa.encrypt(member_name);
        var securedPost = rsa.encrypt(member_post);
        var securedAddress1 = rsa.encrypt(member_address1);
        var securedAddress2 = rsa.encrypt(member_address2);
        var securedPhone1 = rsa.encrypt(member_phone1);
        var securedPhone2 = rsa.encrypt(member_phone2);
        var securedPhone3 = rsa.encrypt(member_phone3);
        var securedEmail1 = rsa.encrypt(member_email1);
        var securedEmail2 = rsa.encrypt(member_email2);

        // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
        var securedUpdateForm = document.getElementById("securedUpdateForm");
        securedUpdateForm.securedId.value = securedId;
        securedUpdateForm.securedName.value = securedName;
        securedUpdateForm.securedPost.value = securedPost;
        securedUpdateForm.securedAddress1.value = securedAddress1;
        securedUpdateForm.securedAddress2.value = securedAddress2;
        securedUpdateForm.securedPhone1.value = securedPhone1;
        securedUpdateForm.securedPhone2.value = securedPhone2;
        securedUpdateForm.securedPhone3.value = securedPhone3;
        securedUpdateForm.securedEmail1.value = securedEmail1;
        securedUpdateForm.securedEmail2	.value = securedEmail2;
        
        securedUpdateForm.submit();
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
<%
	String publicKeyModulus = (String) request.getAttribute("publicKeyModulus");
	String publicKeyExponent = (String) request.getAttribute("publicKeyExponent");
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
									<div id="memberUpdate_img" >
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
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
<%-- 				<jsp:include page="../include/topbar.jsp" /> --%>
				<!-- 메인 페이지 -->
				<div class="content">
					<div class='member_content'>
						<div class='join_form'>
						<h3>회원정보 수정</h3>
							
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
										<li>
										<input type="text" name="str_email01" id="str_email01"  class="mb_mail" value = "<%=email[0]%>">
										<span id="address_shift2" >@</span>
										<input type="text" name="str_email02" id="str_email02"  class="mb_mail2" disabled value="<%=email[1]%>">
										<select name = "selectEmail" id="selectEmail">
											<option value = "naver.com" <% if(email[1].equals("naver.com")) { out.println("selected"); } %>>naver.com</option>
											<option value = "daum.net" <% if(email[1].equals("daum.net")) { out.println("selected"); } %>>daum.net</option>
											<option value = "google.com" <% if(email[1].equals("google.com")) { out.println("selected"); } %>>google.com</option>
											<option value = "nate.com" <% if(email[1].equals("nate.com")) { out.println("selected"); } %>>nate.com</option>
											<option value = "1">직접입력</option>
										</select></li>
									</ul>
								</li>
								<li><input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus%>" /></li>
					            <li><input type="hidden" id="rsaPublicKeyExponent" value="<%=publicKeyExponent%>" /></li>
							</ul>
							<form action="./MemberUpdateAction.me" method="post" name="securedUpdateForm" id="securedUpdateForm" onsubmit="return validateEncryptedUpdateForm()">
								<div class="btn_btm_center btn_btm_modal">
									<input type="hidden" name="securedId" id="securedId" value="" />
									<input type="hidden" name="securedName" id="securedName" value="" />
									<input type="hidden" name="securedPost" id="securedPost" value="" />
									<input type="hidden" name="securedAddress1" id="securedAddress1" value="" />
									<input type="hidden" name="securedAddress2" id="securedAddress2" value="" />									
									<input type="hidden" name="securedPhone1" id="securedPhone1" value="" />
									<input type="hidden" name="securedPhone2" id="securedPhone2" value="" />
									<input type="hidden" name="securedPhone3" id="securedPhone3" value="" />
									<input type="hidden" name="securedEmail1" id="securedEmail1" value="" />
									<input type="hidden" name="securedEmail2" id="securedEmail2" value="" />	
									<ul>
										<li class="btn_cancle"><input type="submit" value="수정하기" class ="btn_type4"></li>
										<li><input type="button" value="메인으로" class ="btn_type4" id="BTN_CLOSE"></li>
									</ul>
								</div>
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