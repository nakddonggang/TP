<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class='member_modal'>
	<form action="./MemberLoginAction.me" method="post" name="fr" id=>
		<fieldset>
			<div class="row_group">
				<div class="info_txt">
					<p><span>아이디</span><input type="text" name="member_id"></p>
				</div>
				<div class="info_txt">
					<p><span>비밀번호</span><input type="password" name="member_pass"></p>
				</div>
			</div>
			<div class="btn_btm_center btn_btm_modal">
				<ul>
					<li class="btn_cancle">
						<input type="submit" value="로그인" class ="btn_type4">
					</li>
					<li>
						<input type="button" value="닫기" class ="btn_type4" id="BTN_CLOSE">
					</li>
				</ul>
			</div>
		</fieldset>
	</form>
</div>