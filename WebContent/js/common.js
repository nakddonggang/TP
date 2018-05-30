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
		height: 320,
		modal: true,
	});
	
	// 진석 수정중
	$("#addFacilDialog").dialog({ 
		autoOpen: false, 
		width: 400, 
		modal: true, 
	});
	
	//시설추가 다이얼로그 오픈 버튼
	$("#add").click(function() {
		$("#addFacilDialog").dialog("open");
	});
	
	$("#BTN_CLOSE").click(function() {
		$("#BTN_CLOSE1").dialog("close");
	});
	// 진석 수정끝

	//시설 세부정보 iframe 주소줄 변경기능
	$(".btn-open-facil").click(function() {
		var facil_add = $(this).attr("rel");
		$("#facil_dialog > iframe" ).attr('src', facil_add);	
		$("#facil_dialog").dialog("open");
	});
	$("#BTN_FACIL_CLOSE").click(function() {
		parent.$("#facil_dialog").dialog("close");
	});
	
	//메신저 다이얼로그 설정
	$("#chat_dialog").dialog({ 
		autoOpen: false, 
		modal: false,
		width: 600, 
		height: 500, 
		resizeable : true,
		position:{
            my:"right bottom",
            at:"right bottom",
            of:".content" 
            }
	});
	

	//메신저 다이얼로그 오픈 버튼
	$("#btn-open-chat").click(function() {
		$("#chat_dialog").dialog("open");
	});
	
	$("#BTN_CLOSE_CHAT").click(function() {
		$("#chat_dialog").dialog("close");
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
    
    
    // 통합검색 슬라이드
	$(document).ready(function(){
	    $(".book_btn_type3").click(function(){
	        $(".book_media_bye").slideToggle("slow");
	    });
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

