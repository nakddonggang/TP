<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top_bar">
	<ul>
		<li>
			<div id="login">
				<%
					if (session.getAttribute("member_id") != null) {
						String member_id = (String) session.getAttribute("member_id");
						out.print("<span id='member_id'>" + member_id + "</span>님이 로그인하셨습니다");
						%> | <a href="./MemberLogout.me">LOGOUT</a> | <a href="./MemberInfo.me">ACCOUNT</a><%
					}else{	%><a href="./MemberLogin.me"><!-- id="btn-open-login" -->LOGIN</a> | <a href="./MemberJoin.me">JOIN</a><%	}
				%>
			</div>
			<%-- <div id="loginDialog">
				<jsp:include page="../include/login.jsp" />
			</div> --%>
		</li>
	</ul>
<!-- </div> -->
<%-- <div id="chat_dialog"><jsp:include page="../include/chat.jsp" /></div> --%>
<!-- <div><a id="btn-open-chat" href="#"></a></div> -->

