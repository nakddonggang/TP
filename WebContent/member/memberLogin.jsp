<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<!-- member/memberLogin.jsp 로그인 페이지 -->
	<div id="wrap">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />	<!-- div id=header -->
			<jsp:include page="../include/footer.jsp" />	<!-- div id=footer -->
		</div>
		<div id="sub_menu">
			<jsp:include page="../include/submenu_main.jsp"/>	<!-- div id=sub_menu -->
		</div>
		<div>	
			<form action="./MemberLoginAction.me" method="post" name="fr">
				<table border="1">
					<tr><td colspan="2">로그인 페이지</td>	</tr>
					<tr><td>아이디:</td>	<td><input type="text" name="member_id"></td></tr>
					<tr><td>비밀번호:</td><td><input type="password" name="member_pass"></td></tr>
					<tr><td colspan="2">
							<input type="button" value="로그인" onclick="sub()">
							<input type="button" value="회원가입" onclick="location.href = './MemberJoin.me'">
					</td></tr>
				</table>
			</form>
		</div>
	</div>
<script>
	function sub(){	//필수입력 아이디	
		if(document.fr.member_id.value == ""){
			alert("아이디를 입력해주시기 바랍니다");
			document.fr.member_id.focus();
			return;
		}
		
		if(document.fr.member_pass.value == ""){
			alert("비밀번호를 입력해주시기 바랍니다");
			document.fr.member_pass.focus();
			return;
		}
		document.fr.submit();
	}
</script>
</body>
</html>