<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class='member_modal'>
	<div class="login_form">
		<h3>Login</h3>
		<ul class="row">
			<li>
				<ul class="row_sub" id="id">
					<li class="title" ><span>ID</span></li>
					<li class="inp_form"><input type="text" name="member_id"  id = "member_id" ></li>
				</ul>
			</li>
			
			<li>
				<ul class="row_sub" id="pass">
					<li class="title">Password</li>
					<li class="inp_form"><input type="password" name="member_pass" id = "member_pass" ></li>
				</ul>
			</li>
			<li><input type="hidden" id="rsaPublicKeyModulus" value="" /></li>
	        <li><input type="hidden" id="rsaPublicKeyExponent" value="" /></li>
		</ul>
	</div>
	<form action="./MemberLoginAction.me" method="post" name="securedLoginForm" id="securedLoginForm" onsubmit="return validateEncryptedLoginForm()">
		<div class="btn_btm_center btn_btm_modal">
			<input type="hidden" name="securedUsername" id="securedUsername" value="" />
			<input type="hidden" name="securedPassword" id="securedPassword" value="" />
			<ul>
				<li><input type="checkbox" name="autoLogin" value="checked">자동 로그인</li>
			</ul>
			<ul>
				<li class="btn_cancle"><input type="submit" value="로그인" class ="btn_type4"></li>
				<li><input type="button" value="닫기" class ="btn_type4" id="BTN_CLOSE"></li>
			</ul>
		</div>
	</form>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"./ModalLogin.me",
		type:'get',
		dataType:'json',
		success : function(data) {
			var publicKeyModulus=data.publicKeyModulus;
			var publicKeyExponent=data.publicKeyExponent;
			$('#rsaPublicKeyModulus').attr("value", publicKeyModulus);
			$('#rsaPublicKeyExponent').attr("value", publicKeyExponent);
		}
	});
});

function validateEncryptedLoginForm() {
    var member_id = document.getElementById("member_id").value;
    var member_pass = document.getElementById("member_pass").value;

    try {
        var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
        submitEncryptedLoginForm(member_id, member_pass, rsaPublicKeyModulus, rsaPublicKeyExponent);
    } catch(err) {
        alert(err);
    }
    return false;
}

function submitEncryptedLoginForm(member_id, member_pass, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

    // 사용자ID와 비밀번호를 RSA로 암호화한다.
    var securedUsername = rsa.encrypt(member_id);
    var securedPassword = rsa.encrypt(member_pass);

    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    var securedLoginForm = document.getElementById("securedLoginForm");
    securedLoginForm.securedUsername.value = securedUsername;
    securedLoginForm.securedPassword.value = securedPassword;
    securedLoginForm.submit();
}

</script>
</div>