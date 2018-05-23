<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="websocketChat">
		<div id="userview">
			<ul>
			<%
				ArrayList<String> userlist = (ArrayList)session.getAttribute("userlist");
				if (userlist == null) 
				{
					userlist = new ArrayList<String>();
					session.setAttribute("userlist", userlist);
				}
				userlist.add(productname);

				if (userlist != null) 
				{
					for (String username : userlist) 
					{
						out.print("<li>" + username + "</li>");
					}
				} 
				else 
				{
					out.print("<li>유저 없음</li>");
				}
			%>
			</ul>
		</div>
		<div id="chatview">
			<div id="chatLog"></div>
		</div>
		<input id="text" type="text" />
		<button id="BTN_CLOSE_CHAT">닫기</button>
	</div>						
<script>
/* start 웹소켓 채팅 구현 */
$(document).ready(function() {
	if (!("WebSocket" in window)) {
		$('#chatLog, input, button, #examples').fadeOut("fast");
		$('<p>Oh no, you need a browser that supports WebSockets. How about <a href="http://www.google.com/chrome">Google Chrome</a>?</p>').appendTo('#websocketChat');
	} else {	//The user has WebSockets  
		connect();
		
		function connect() {
			try {
				var socket = new WebSocket('ws://localhost:8080/TeamProject/chat/${member_id}');
				var my_id = $("#member_id").text();
				var messageArray;
				
				if(my_id == "")	{	my_id = 'guest';	}
				
				message('<p class="event">Socket Status: ' + socket.readyState);

				socket.onopen = function() {
	                var chatlog = sessionStorage.getItem('chatlog');
	                $("#chatLog").html(chatlog);
	                sessionStorage.clear();
				}
				socket.onmessage = function(msg) {
					messageArray = msg.data.split(': ');
					
					message('<p class="message">'+messageArray[0]+ ': ' + messageArray[1]);
				}
				socket.onclose = function() {
					var chatlog = $("#chatLog").html();
	                sessionStorage.setItem('chatlog', chatlog);
					message('<p class="event">Socket Status: ' + socket.readyState + ' (Closed)');	
				}
			} catch (exception) {	message('<p>Error' + exception);	}

			function send() {
				var text = my_id + ": " + $('#text').val();
				if (text == "") {	message('<p class="warning">Please enter a message');	return;	}
				try {	
					socket.send(text);
					message('<p class="event">'+ text)	
				} 
				catch (exception) {	message('<p class="warning">');	}
				$('#text').val("");
			}

			function message(msg) {
				$('#chatLog').append(msg + '</p>');
				$('#chatview').scrollTop($('#chatview').prop('scrollHeight'));
			}
			$('#text').keypress(function(event) {	if (event.keyCode == '13') {	send();	}	});
			$(window).on("beforeunload", function(){	socket.close();	});

		}//End connect  
	}//End else  
});
/* end 웹소켓 채팅 구현 */
</script>