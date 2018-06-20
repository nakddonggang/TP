<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top_bar">
	<ul>
		<li>
			<div id="login">
				<%
					if (session.getAttribute("member_id") != null) {
						String member_id = (String) session.getAttribute("member_id");
						%><a href="#"><span id="badge"></span><img src="./resource/img/Letter.png" width="30px" height="30px" id="alarm"></a><%
						out.print("<span class='top_bold' id='member_id'>"+" "+ member_id +" "+" </span>");
						%><span class='top_bold'> | </span><a href="./MemberLogout.me"><img src="./resource/img/logout.png" width="30px" height="30px"></a>
						<span class='top_bold'> | </span><a href="./MemberInfo.me"><img src="./resource/img/account.png" width="30px" height="30px"></a><%
					}else{	%><a href="#" id="btn-open-login"><img src="./resource/img/login.png" width="30px" height="30px"></a>
					 <span class='top_bold'>|</span><a href="./MemberJoin.me"><img src="./resource/img/join.png" width="30px" height="30px"></a><%	}
				%>
				<div id="dialog" title="알림"></div>
			</div>
			<div id="loginDialog">
				<jsp:include page="../include/login.jsp" />
			</div>
		</li>
	</ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
    $.toast.config.align = 'center';
    $.toast.config.width = 350;
    
	var member_id = "${member_id}";
	$.ajax({
		url:"./MemberBbookCheck.me",
		type:'POST',
		data:{'member_id':member_id},
		dataType: 'json',
		success:function(result){
			var jsonData = JSON.parse("["+result+"]");
			if(jsonData.length == 2 || jsonData[jsonData.length-1].check!=0 || jsonData.length >= 3){
				$('#badge').html('<img src="resource/img//Heart.png" width=20px; height=20px; />');
				$('#alarm').click(function(){
					if((jsonData.length <= 2 && jsonData[jsonData.length-1].check!=0) || (jsonData.length>3 && jsonData[jsonData.length-1].check!=0)){
                    	$.toast('<h6>2일 이내 반납해야할 책 '+jsonData[jsonData.length-1].check+'권입니다.</h6>',{
                       		duration: 3000,
                       		type: 'danger'
                    	});
					}
					if(jsonData.length ==2){
						$.toast('<h6>['+jsonData[0].facil_num+'] 좌석 사용중입니다.</h6>',{
                        	duration: 3000,
                        	type: 'info'
                    	});
					}
					if(jsonData.length>=3){
                    	if(jsonData[jsonData.length-2].book_count>1){
                    		$.toast('<h6>예약하신 책 ['+jsonData[0].book_subject+'] 외 대출신청 가능한 책 '+(jsonData[jsonData.length-2].book_count-1)+'권 있습니다.</h6>',{
                            	duration: 3000,
                            	type: 'info'
                        	});
                    	}else if(jsonData[jsonData.length-2].book_count==1){
                    		$.toast('<h6>예약하신 책['+jsonData[0].book_subject+'] 대출신청 가능합니다.</h6>',{
                            	duration: 3000,
                            	type: 'info'
                        	});
                    	}
                    }
					if(jsonData.length >= 4 && jsonData[jsonData.length-3].facil_num!=null){
						$.toast('<h6>['+jsonData[jsonData.length-3].facil_num+'] 좌석 사용중입니다.</h6>',{
                        	duration: 3000,
                        	type: 'info'
                    	});
					}
				});
			}
		}
	});
});
</script>
<div id="chat_dialog"><jsp:include page="../include/chat.jsp"/></div>
<div><a id="btn-open-chat" href="#"></a></div>