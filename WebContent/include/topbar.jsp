<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.toast.min.css"/>" />
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
</head>
<body>
<%String member_id = null; %>
<div class="top_bar">
	<ul>
		<li>
			<div id="login">
				<%
					if (session.getAttribute("member_id") != null) {
						member_id = (String) session.getAttribute("member_id");
						%><a href="#"><span id="badge"></span><img src="./resource/img/user2.png" width="7%" height="7%" id="alarm"></a><%
						out.print("<span id='member_id'>" + member_id + "</span>");
						%> | <a href="./MemberLogout.me"><img src="./resource/img/logout.png" width="5%" height="5%"></a>
						 | <a href="./MemberInfo.me"><img src="./resource/img/account.png" width="5%" height="5%"></a><%
					}else{	%><a href="./MemberLogin.me"><!-- id="btn-open-login" --><img src="./resource/img/login.png" width="5%" height="5%"></a>
					 | <a href="./MemberJoin.me"><img src="./resource/img/join.png" width="5%" height="5%"></a><%	}
				%>
				<div id="dialog" title="알림"></div>
			</div>
			
			<%-- <div id="loginDialog">
				<jsp:include page="../include/login.jsp" />
			</div> --%>
		</li>
	</ul>
<!-- </div> -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	$.toast.config.align = 'right';
    $.toast.config.width = 400;
    
	var member_id = "<%=member_id %>";
	$.ajax({
		url:"./MemberBbookCheck.me",
		type:'POST',
		data:{'member_id':member_id},
		success:function(result){
			if(result != "0"){
				$('#badge').html('★');
				$('#alarm').click(function(){
					$.toast('<h6>2일 이내 반납해야할 책 '+result+'권입니다.</h6>',{
						sticky: true,
						type: 'danger'
					});
				});
			}
		}
	});
});
</script>
<div id="chat_dialog"><jsp:include page="../include/chat.jsp"/></div>
<div><a id="btn-open-chat" href="#"></a></div>
</body>
</html>