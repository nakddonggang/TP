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
				<div class="btn_btm_center">
					<ul>
						<li class="btn_cancle">
							<input type="submit" value="회원가입" class ="btn_type4">
						</li>
						<li>
							<input type="reset" value="취소" class ="btn_type4">
						</li>
					</ul>
				</div>
			</fieldset>
		</form>
	</div>
</div>