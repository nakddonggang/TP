<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="websocketChat">
	<%
		if(session.getAttribute("member_id")!=null && session.getAttribute("member_id").equals("admin")){
			session.setAttribute("admincheck", true);
		}
	%>
		<div id="userview">
			<form name="usersForm" id="usersForm">
				<input type="hidden" id="roomId" name="roomId"/>
				<input type="hidden" id="username" name="username"/>
				<table id="users" name="users">
				   	<tr><th>Web Messenger Users</th></tr>
				   	<tr><td>There is no one to chat</td></tr>
				   	<div id="nowChat"></div>
			   </table>
			</form>
		</div>
		<div id="joinchat">
			<%
				if(session.getAttribute("member_id")!=null){
					%><input type="button" value="대화 참여" id="memberJoinChat"><%
				} else {
					%><span>로그인 후 이용 가능합니다</span><%
				}
			%>
			
		</div>
		<div id="chatview">
			<div id="chatLog"></div>
		</div>
		<div id="inputview">
			<input id="textMessage" type="text" />
			<input type="button" id="sendBtn" name="sendBtn" value="전송"/>
			<input type="button" id="leaveBtn" name="leaveBtn" value="대화종료"/>
		</div>
	</div>						
<script>
/* start 웹소켓 채팅 구현 */
 var webSocket = null; 
 var admincheck = "${admincheck}";
 var chatstart = sessionStorage.getItem('chatstart');
 var socketchat = null;
 var chatuser = null;
 var username = "${member_id}";
 
 $(document).ready(function() {
    
    var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/userlist';
    
    if(username==""){
		$("#joinchat").css("display",""); 
		$("#userview").css("display","none"); 
		$("#chatview").css("display","none");
		$("#inputview").css("display","none");
    } 
    else {
    	if(admincheck){
    		$("#joinchat").css("display","none");
    		$("#chatview").css("width","");
    		$("#inputview").css("display","");
    		webSocket = connection(url);
    		sessionStorage.setItem('chatstart', true);
        }
        if(admincheck=="") {
        	$("#userview").css("display","none");
        	$("#chatview").css("width","100%");
           if(chatstart==null){
    			$("#joinchat").css("display",""); 
    			$("#userview").css("display","none"); 
    			$("#chatview").css("display","none"); 
    			
    			$("#memberJoinChat").click(function(){
    				webSocket = connection(url);
    				var urlchat = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/' + username;
    				socketchat = new WebSocket(urlchat);
    				$("#joinchat").css("display","none");
    				$("#chatview").css("display",""); 
    				$("#inputview").css("display","");
    				sessionStorage.setItem('chatstart', true);
    				
    				webSocket.onopen = function(){ processOpen(); };
    			    webSocket.onmessage = function(message) { processMessage(message); };
    			    webSocket.onerror = function(message) { processError(message); };
    			    socketchat.onopen = function(){   
    			       socketchat.send(JSON.stringify({ "message" : username , "room" : username }));
    			       $('#sendBtn').attr("disabled", false);
    			       if(sessionStorage.getItem('chatlog' + username)!=null){
    			    	   var chatlog = sessionStorage.getItem('chatlog' + username);
    			           $("#chatLog").html(chatlog);
    			           sessionStorage.removeItem('chatlog' + username);
    			       }
    			       $('#chatview').scrollTop($('#chatview')[0].scrollHeight);
    			    };
    			    socketchat.onmessage = function(message) { chatmessage(message); };
    			    socketchat.onerror = function(message) { chaterror(message); };
    			    socketchat.onclose = function() {
    			       var chatlog=$("#chatLog").html();
    			          sessionStorage.setItem('chatlog' + username, chatlog);
    			          $("#chatLog").empty();
    			       
    			    }
    			});
           } else {
        	  $("#joinchat").css("display","none");
        	  $("#inputview").css("display","");
              webSocket = connection(url);
              var urlchat = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/' + username;
              socketchat = new WebSocket(urlchat);
           }
        }
    }
    
 
    var connectionType;
    webSocket.onopen = function(){ processOpen(); };
    webSocket.onmessage = function(message) { processMessage(message); };
    webSocket.onerror = function(message) { processError(message); };
    socketchat.onopen = function(){   
       socketchat.send(JSON.stringify({ "message" : username , "room" : username }));
       $('#sendBtn').attr("disabled", false);
       if(sessionStorage.getItem('chatlog' + username)!=null){
    	   var chatlog = sessionStorage.getItem('chatlog' + username);
           $("#chatLog").html(chatlog);
           sessionStorage.removeItem('chatlog' + username);
       }
       $('#chatview').scrollTop($('#chatview')[0].scrollHeight);
    };
    socketchat.onmessage = function(message) { chatmessage(message); };
    socketchat.onerror = function(message) { chaterror(message); };
    socketchat.onclose = function() {
       var chatlog=$("#chatLog").html();
          sessionStorage.setItem('chatlog' + username, chatlog);
          $("#chatLog").empty();
       
    }
    
    
 });
 
 function connection(url) {
    var webSocket = null;
    if ('WebSocket' in window) {   webSocket = new WebSocket(url);      }
    else if ('MozWebSocket' in window) {   webSocket = new MozWebSocket(url);   } 
    else {   Console.log('Error: WebSocket is not supported by this browser.');   return null;   }
    return webSocket;
 }
 
 $('#sendBtn').click(function() {
	if(textMessage.value==""){		
		$('#textMessage').focus();
	}else {
		chatsend(textMessage.value);
	    textMessage.value = "";
	}
 });
 
 $('#textMessage').keypress(function(e) {
    if(e.which==13) {
    	if(textMessage.value==""){		
    		$('#textMessage').focus();
    	}else {
    		chatsend(textMessage.value);
    	    textMessage.value = "";
    	}
    }
 });
 
$('#leaveBtn').click(function() {
	if(admincheck==""){
		webSocket.close();
		socketchat.close();
		sessionStorage.clear();
		$("#chatLog").empty();
	} else {
		var chatlog=$("#chatLog").html();
		$.ajax({
			url:"./chatlogSave.fp",
			type:'POST',
			data:{'chatlog':chatlog, 'chatuser':chatuser},
			success:function(result){
				$.Alert("chatlog 저장완료", function(){});
			}
		});
	}
});

 
 function trClick(selectedTr) {
	if(socketchat!=null){
		socketchat.close();
	}
    if (selectedTr.id != null) {
    	var chatlog=$("#chatLog").html();
		sessionStorage.setItem('chatlog' + chatuser, chatlog);
		$("#chatLog").empty();
		connectionType = "chatConnection";
		chatuser = selectedTr.id;
		$('.userlist > td').attr("class", "");
		$('#' + chatuser + ' > td').attr("class", "selected");
		var urlchat = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/' + chatuser;
		socketchat = new WebSocket(urlchat);
		
		socketchat.onopen = function(){   
			socketchat.send(JSON.stringify({ "message" : username , "room" : chatuser }));
			$('#sendBtn').attr("disabled", false);
			if(sessionStorage.getItem('chatlog' + chatuser)!= null){
				var chatlog = sessionStorage.getItem('chatlog' + chatuser);
				$("#chatLog").html(chatlog);
				sessionStorage.removeItem('chatlog' + chatuser);
			}
			$('#chatview').scrollTop($('#chatview')[0].scrollHeight);
		};
		socketchat.onmessage = function(message) { chatmessage(message); };
		socketchat.onerror = function(message) { chaterror(message); };
	}
}
 
 function processOpen() {
    connectionType = "firstConnection";
    username = "${member_id}";
    webSocket.send(
       JSON.stringify({
          "connectionType" : connectionType, 
          "username" : username 
       }));
 }
    
 //server에서 메시지가 넘어왔을때
 function processMessage(message) {
    var jsonData = JSON.parse(message.data);
    
    if (jsonData.allUsers != null) {   displayUsers(jsonData.allUsers);   } 
    
    //다른 사용자가 접속을 끊을 때,
    if (jsonData.disconnectedUser != null) {   $("#"+jsonData.disconnectedUser).remove();   }
    
    //다른 사용자와 대화하고자 시도할 때, 채팅창을 팝업
    if (jsonData.enterChatId != null) {
       var roomId = jsonData.enterChatId;
       $("#roomId").val(roomId);
       $("#username").val(jsonData.username);
       
    }
 }
 
 function chatmessage(message) {
    var jsonData = JSON.parse(message.data);
//     $.Alert("jsonData: " + jsonData.messageType + "," + jsonData.name +  "," + jsonData.message + "," + jsonData.users, function(){});
    if (jsonData.messageType == "ChatMessage") {
       message = jsonData.name + " : "+ jsonData.message + '\n';
       displaybubble(jsonData);
    } else if (jsonData.messageType == "UsersMessage") {
       var other = "";
       for(var i=0; i<jsonData.users.length; i++) {
          if (chatuser==jsonData.users[i]) {
        	 $('#nowChat').empty();
             $('#nowChat').append("<span>" + jsonData.users[i]+"님과 대화중입니다.</span>");
             other = jsonData.users[i];
             first = "false";
          }
       }
       if(first=="false" && other=="") {
          $('#users').empty();
          $('#users').append("대화상대가 아무도 없습니다.");
       } 
    }
 }

 function chatsend(message) {
    if(admincheck){
       socketchat.send(JSON.stringify({ 'message' : message , 'room' : chatuser }));
    } else {
       socketchat.send(JSON.stringify({ 'message' : message , 'room' : username }));
    }
 }
 
 function displaybubble(data) {
    //message = jsonData.name + " : "+ jsonData.message + '\n';
    if (data.name == username) {
       $('#chatLog').append("<div class='username right'>"+data.name+"</div><div class='bubble right'><span class='tail'>&nbsp;</span><p>"+data.message +"</p></div>");
              
    } else {
        $('#chatLog').append("<div class='username left'>" + data.name+"</div><div class='bubble left'><span class='tail'>&nbsp;</span><p>"+data.message +"</p></div>");
    }
    $('#chatview').scrollTop($('#chatview')[0].scrollHeight);
 }
 
 function displayUsers(userList) {
    var username;
    $("#users tr:not(:first)").remove();
    for (var i=0; i<userList.length; i++) {
       if("${member_id}"==userList[i]) {
          username = userList[i]+"(me!)";
       } else{
          username = userList[i];
       }
       $.newTr = $("<tr id="+userList[i]+" class='userlist' onclick='trClick(this)'><td class=''>"+username+"</td></tr>");
       $("#users").last().append($.newTr);
       
    }
 }
 
 $(window).on("beforeunload", function(){
	 socketchat.close();
	 
	 socketchat.onclose = function() {
	       var chatlog=$("#chatLog").html();
	       if(admincheck==""){
	          sessionStorage.setItem('chatlog' + username, chatlog);
	       } else {
	    	  sessionStorage.setItem('chatlog' + chatuser, chatlog);
	       }
	          $("#chatLog").empty();
	       
	    }
 });
/* end 웹소켓 채팅 구현 */
</script>