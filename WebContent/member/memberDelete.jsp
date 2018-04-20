<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div id="">
		<div id="main_menu">
			<jsp:include page="../include/header.jsp" />
			<jsp:include page="../include/footer.jsp" />
		</div>
		<article>
			<form action="" method="" name="">
				<table class="">
					<tr>
						<th colspan="2" class="tab_1">회원탈퇴</th>
					</tr>
					<tr>
						<th>아이디 :</th>
						<td>
							<input type="text" name="id" placeholder="아이디를 입력하세요" value="" readonly>
						</td>
					</tr>
					<tr>
						<th>비밀번호 :</th>
						<td>
							<input type="password" name="pass" placeholder="비밀번호를 입력하세요">
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="회원탈퇴"> <input type="reset" value="취소"></th>
					</tr>
				</table>
			</form>
		</article>
	</div>
</body>
</html>