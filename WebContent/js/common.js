$(window).on('load', function() {
	// 왼쪽 네비게이션
	var win = $(this);
	$("nav > div > ul > li > a").click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$(this).siblings("ul").stop(true, false).slideUp("fast");
		} else {
			$("nav > div > ul > li > ul").slideUp("fast");
			$("nav > div > ul > li > a").removeClass("active");
			$(this).siblings("ul").stop(true, false).slideDown("fast");
			$(this).addClass('active');
		};
	});
	
	//로그인 다이얼로그 설정
	$( "#loginDialog" ).dialog({ 
		autoOpen: false, 
		width: 400, 
		modal: true, 
	});
	
	//로그인 다이얼로그 오픈 버튼
	$("#btn-open-login").click(function() {
		$("#loginDialog").dialog("open");
	});
	
	$("#BTN_CLOSE").click(function() {
		$("#loginDialog").dialog("close");
	});
	
	//시설 세부정보 다이얼로그 설정
	$("#facil_dialog").dialog({ 
		autoOpen: false, 
		width: 400, 
		height: 500,
		modal: true,
	});
	
	//시설 세부정보 iframe 주소줄 변경기능
	$(".btn-open-facil").click(function() {
		var facil_add = $(this).attr("rel");
		$("#facil_dialog > iframe" ).attr('src', facil_add);	
		$("#facil_dialog").dialog("open");
	});
	$("#BTN_FACIL_CLOSE").click(function() {
		parent.$("#facil_dialog").dialog("close");
	});
	
});

$(function() {
	// 모바일 네비게이션
	$(".A_SIDE").on("click", function() {
		$(this).hide();
		$("body").css('overflow', 'hidden')
		$(".A_CLOSE").show();
		$(".DIV_SHADOW").show();
		$(".DIV_MB_WRAP").stop(true, false).slideDown("fast");
	});
	// 모바일 네비게이션 (close)
	$(".A_CLOSE, .DIV_SHADOW").on("click", function() {
		$("body").css('overflow', 'visible')
		$(".A_SIDE").show();
		$(".A_CLOSE").hide();
		$(".DIV_MB_WRAP").stop(true, false).slideUp("fast");
		$(".DIV_SHADOW").hide();
	});
	
    //게시판 상세보기
    $(".DIV_CON_LST > ul").click(function ()
    {
        if ($(this).hasClass('active'))
        {
            $(this).removeClass('active');
            $(this).siblings("div.DIV_CON_DETAIL").stop(true, false).slideUp("fast");
        }
        else
        {
            $("div.DIV_CON_DETAIL").slideUp("fast");
            $(".DIV_CON_LST > ul").removeClass("active");
            $(this).siblings("div.DIV_CON_DETAIL").stop(true, false).slideDown("fast");
            $(this).addClass('active');
        };
    });
    
	//탭메뉴 기능 구현
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active").css("color", "#333");
		$(this).addClass("active").css("color", "darkred");
		var tab1="./AdminMemberNormal.am";
		var tab2="./AdminMemberGood.am";
		var tab3="./AdminMemberBlack.am";
		var activeTab = $(this).attr("rel");
		if(activeTab == "tab1") {		$('.tab_content').attr('src', tab1);	}
		else if(activeTab == "tab2") {	$('.tab_content').attr('src', tab2);	}
		else if(activeTab == "tab3") {	$('.tab_content').attr('src', tab3);	}
	});
	
	$(".BTN_IF_LIST").click(function() {
		var listPage = $(this).attr("rel");
		parent.$('.tab_content', parent.document).attr('src', listPage);
	});
});

/* start 웹소켓 채팅 구현 */
$(document).ready(function() {
	if (!("WebSocket" in window)) {
		$('#chatLog, input, button, #examples').fadeOut("fast");
		$('<p>Oh no, you need a browser that supports WebSockets. How about <a href="http://www.google.com/chrome">Google Chrome</a>?</p>').appendTo('#websocketChat');
	} else {	//The user has WebSockets  
		connect();
		
		function connect() {
			try {
				var socket = new WebSocket('ws://localhost:8080/chat/broadcasting');
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

			function message(msg) {	$('#chatLog').append(msg + '</p>');	}
			$('#text').keypress(function(event) {	if (event.keyCode == '13') {	send();	}	});
			$('#disconnect').click(function() {	socket.close();	});
			$(window).on("beforeunload", function(){	socket.close();	});

		}//End connect  
	}//End else  
});
/* end 웹소켓 채팅 구현 */