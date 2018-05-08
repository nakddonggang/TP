<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="content">
	<div class='loginmodal'>
		<form action="./MemberLoginAction.me" method="post" name="fr" id="loginForm">
			<fieldset class="memberform">
				<legend>로그인 페이지</legend>
				<div class="row_group">
					<div id="idDiv" class="join_row">
						<span>
							<label>아이디:</label>
							<input type="text" name="member_id">
						</span>
					</div>
					<div id="idDiv" class="join_row">
						<span>
							<label>비밀번호:</label>
							<input type="password" name="member_pass">
						</span>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>