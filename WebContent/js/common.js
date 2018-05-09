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
	$("#btn-open-dialog").click(function() {
		$("#loginDialog").dialog("open");
	});
	
	$("#BTN_CLOSE").click(function() {
		$("#loginDialog").dialog("close");
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
});
