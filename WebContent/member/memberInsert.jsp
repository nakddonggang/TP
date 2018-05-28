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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
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
    
    function validateEncryptedInsertForm() {

        var member_id = $("#member_id").val(); alert("member_id: " + member_id);
        var member_pass = $("#member_pass").val();
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
            submitEncryptedInsertForm(member_id, member_pass, member_name, member_post, member_address1, member_address2, member_phone1, member_phone2, member_phone3, member_email1, member_email2, rsaPublicKeyModulus, rsaPublicKeyExponent);
        } catch(err) {
            alert(err);
        }
        return false;
    }

    function submitEncryptedInsertForm(member_id, member_pass, member_name, member_post, member_address1, member_address2, member_phone1, member_phone2, member_phone3, member_email1, member_email2, rsaPublicKeyModulus, rsaPublicKeyExponent) {
    	var rsa = new RSAKey();
        rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);

        // 사용자ID와 비밀번호를 RSA로 암호화한다.
        var securedId = rsa.encrypt(member_id); alert("securedId: " + securedId);
        var securedPass = rsa.encrypt(member_pass);
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
        var securedInsertForm = document.getElementById("securedInsertForm");
        securedInsertForm.securedId.value = securedId;
        securedInsertForm.securedPass.value = securedPass;
        securedInsertForm.securedName.value = securedName;
        securedInsertForm.securedPost.value = securedPost;
        securedInsertForm.securedAddress1.value = securedAddress1;
        securedInsertForm.securedAddress2.value = securedAddress2;
        securedInsertForm.securedPhone1.value = securedPhone1;
        securedInsertForm.securedPhone2.value = securedPhone2;
        securedInsertForm.securedPhone3.value = securedPhone3;
        securedInsertForm.securedEmail1.value = securedEmail1;
        securedInsertForm.securedEmail2.value = securedEmail2;
        
        alert("securedId: " + securedInsertForm.securedId.value);
        alert("securedPass: " + securedInsertForm.securedPass.value);
        alert("securedName: " + securedInsertForm.securedName.value);
        alert("securedPost: " + securedInsertForm.securedPost.value);
        alert("securedAddress1: " + securedInsertForm.securedAddress1.value);
        alert("securedAddress2: " + securedInsertForm.securedAddress2.value);
        alert("securedPhone1: " + securedInsertForm.securedPhone1.value);
        alert("securedPhone2: " + securedInsertForm.securedPhone2.value);
        alert("securedPhone3: " + securedInsertForm.securedPhone3.value);
        alert("securedEmail1: " + securedInsertForm.securedEmail1.value);
        alert("securedEmail2: " + securedInsertForm.securedEmail2.value);
        
        securedInsertForm.submit();
    }
</script>
<script type="text/javascript">
var idcheck = 0;

	function checkId() {
		var inputid = $("#member_id").val();	
		var idnum = inputid.search(/[0-9]/g);
		var ideng = inputid.search(/[a-z]/ig);
		
		$.ajax({
			url:'./MemberIdCheck.me',
			type:'POST',
			data:{
				'member_id':inputid
			},
			success:function(data) {
				if(inputid == "" && data == '0') {
					$("#member_id").css("background-color", "#FFCECE");
					$("#submit_button").prop("disabled" , true);
					$("#submit_button").css("background-color" , "#aaaaaa");
					$("#idcheck_msg").html("사용불가능한 아이디입니다.");
				} else if(idnum < 0 || ideng < 0) {
					$("#member_id").css("background-color", "#FFCECE");
					$("#submit_button").prop("disabled" , true);
					$("#submit_button").css("background-color" , "#aaaaaa");
					$("#idcheck_msg").html("아이디는 영어와 숫자만 입력가능합니다.");
				} else if(inputid.length < 6 || inputid.length > 15) {
					$("#member_id").css("background-color", "#FFCECE");
					$("#submit_button").prop("disabled" , true);
					$("#submit_button").css("background-color" , "#aaaaaa");
					$("#idcheck_msg").html("아이디는 6 ~ 14자리 사이로 입력해주세요.");
				} else if(data == '0') {
					 $("#member_id").css("background-color", "#B0F6AC");
					 $("#submit_button").prop("disabled" , false);
					 $("#submit_button").css("background-color" , "#464646");
					 $("#idcheck_msg").html("사용가능한 아이디입니다.");
				} else if(data == '1') {
					$("#member_id").css("background-color", "#FFCECE");
					$("#submit_button").prop("disabled" , true);
					$("#submit_button").css("background-color" , "#aaaaaa");
					$("#idcheck_msg").html("사용불가능한 아이디입니다.");
				}
				
			}
		});
	}
	
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

	$("#submit_button").click(function() {
		
		var pass = document.getElementById("member_pass").value;
		var name = document.getElementById("member_name").value;
		var num = pass.search(/[0-9]/g);
		var eng = pass.search(/[a-z]/ig);
		var spe  = pass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		var kor = 0;  // for - end
			
			for (var i=0; i<name.length; i++) {
				var chk = name.substring(i,i+1);
				if(chk.match(/[0-9]|[a-z]|[A-Z]|[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/)) {
					kor = kor + 1;
				}
			} // for - end
		
		if(pass.length == 0) {
			alert("비밀번호는 공백으로 입력할 수 없습니다.");
			$("#member_pass").focus();
			return;
		}
		
		if(num < 0 || eng < 0 || spe < 0) {
			alert("비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			$("#member_pass").select();
			  return;
		}
		
		if(pass.length < 8 || pass.length > 21) {
			alert("비밀번호는 8 ~ 20자 사이로 입력해주세요.");
			$("#meber_pass").select();
		}
		
		if(name.length == 0) {
			alert("이름칸은 공백으로 입력할 수 없습니다.");
			$("#member_name").focus();
			return;
		}
		
		if(kor > 0) {
			alert("이름칸에는 한글만 입력 가능합니다.");
			$("#member_name").focus();
			return;
		}
		
		if($("#member_post").val() == "") {
			alert("우편번호 검색을 해주세요.");
			return;
		}
		
		if($("#member_address2").val() == "") {
			alert("상세주소는 공백으로 입력할 수 없습니다.");
			return;
		}
		
		if($("#member_phone1").val() == "" ) {
			alert("휴대폰 번호는 공백으로 입력할 수 없습니다.");
			$("#member_phone1").focus();
			return;
		}
		
		if($("#member_phone1").val() < 4) {
			alert("휴대폰 번호는 4자리를 입력해주세요.");
			$("#member_phone1").select();
			return;
		}
		
		if (isNaN($("#member_phone1").val())) {
			alert("휴대폰 번호는 숫자로 입력해주세요.");
			$("#member_phone1").select();
			return;
		}
	
		if($("#member_phone2").val() == "") {
			alert("휴대폰 번호는 공백으로 입력할 수 없습니다.");
			$("#member_phone2").focus();
			return;
		}
		
		if($("#member_phone2").val() < 4) {
			alert("휴대폰 번호는 4자리를 입력해주세요.");
			$("#member_phone2").select();
			return;
		}
		
		if (isNaN($("#member_phone2").val())) {
			alert("휴대폰 번호는 숫자로 입력해주세요.");
			$("#member_phone2").focus();
			return;
		}
		
		if($("#member_email").val() == "") {
			alert("이메일은 공백으로 입력할 수 없습니다. ");
			$("#member_email").focus();
			return;
		}
		
		$("#fr").submit();
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
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
					<div class="content">
					<div class='join_form'>
						<h3>회원가입</h3>
							<ul class="row">
								<li>
									<ul class="row_sub">
										<li class="title"><span>ID</span></li>
										<li class="inp_form"><input type="text" name="member_id"  id = "member_id" value=""  onkeyup="checkId()"><span id = "idcheck_msg"></span></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Pass</li>
										<li class="inp_form"><input type="password" name="member_pass" id = "member_pass" value=""></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Name</li>
										<li class="inp_form"><input type="text" name="member_name" id = "member_name" value=""></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Post</li>
										<li class="inp_form"><input type="text" name="member_post" id = "member_post" value=""  readonly><input type = "button" name = "address_search"  value = "주소찾기" onclick = "sample6_execDaumPostcode()"></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Address</li>
										<li ><input type="text" name="member_address1" id = "member_address1" value=""  placeholder="주소" class="inp_addr" readonly><br><input type="text" name="member_address2"  id = "member_address2" value="" placeholder="상세주소" class="inp_addr2"></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">Phone</li>
										<li>
										<select name = "phone_frist" class ="phone_frist">
										<option value = "010">010</option>
										<option value = "011">011</option>
										<option value = "016">016</option>
										<option value = "018">018</option>
										</select>
										<input type="text" name="member_phone1" id ="member_phone1" value=""  class="inp_form" maxlength=4 ><input type="text" name="member_phone2" id ="member_phone2" value=""  class="inp_form2" maxlength=4></li>
									</ul>
								</li>
								
								<li>
									<ul class="row_sub">
										<li class="title">E-mail</li>
										<li><input type="text" name="str_email01" id="str_email01"  class="mb_mail"><span id="address_shift2" >@</span><input type="text" name="str_email02" id="str_email02"  class="mb_mail2" disabled value="naver.com">
										<select name = "selectEmail"" id="selectEmail">
										<option value = "naver.com" selected>naver.com</option>
										<option value = "daum.net">daum.net</option>
										<option value = "google.com">google.com</option>
										<option value = "nate.com">nate.com</option>
										<option value = "1">직접입력</option>
										</select></li>
									</ul>
								</li>
								<li><input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus%>" /></li>
					            <li><input type="hidden" id="rsaPublicKeyExponent" value="<%=publicKeyExponent%>" /></li>
							</ul>
							<form action="./MemberJoinAction.me" method="post" name="securedInsertForm" id="securedInsertForm" onsubmit="return validateEncryptedInsertForm()">
								<div class="btn_btm_center btn_btm_modal">
									<input type="hidden" name="securedId" id="securedId" value="" />
									<input type="hidden" name="securedPass" id="securedPass" value="" />
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
										<li class="btn_cancle"><input type="submit" value="회원가입" class ="btn_type4"></li>
										<li><input type="button" value="닫기" class ="btn_type4" id="BTN_CLOSE"></li>
									</ul>
								</div>
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