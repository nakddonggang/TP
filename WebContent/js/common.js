$(window).on('resize', function () {
	var win = $(this);
    
    //header nav 중앙정렬 (PC)
    var theHeight = $(window).height()/2;
    $("nav").css('top',theHeight);

    //login,join 레이아웃 수정
    if (win.width() >= 768){ //Pc
        $(".A_SIDE").show();
        $(".A_CLOSE").hide();
        $(".DIV_SHADOW").hide();
        $(".DIV_MB_WRAP").hide();
        $(".DIV_TOP_MNU").insertAfter(".site_link");
    }else if(win.width() <= 767){ //Mobile
        $(".DIV_TOP_MNU").insertAfter(".banner_link");         
    }

	//지혜의숲 이용안내 슬라이드
	var height = $(".DIV_PAGE02").height();
	$(".SECTION02 .DIV_BOX_THM").css('height',height);

    //비쥬얼 이미지 높이
    $(".DIV_WIN_HGT").css('height',$(window).height());

    //half 화면인 경우 body scroll 제한
    if (win.width() >= 1024){ //Pc        
        $(".SEC_HALF").parents("body").attr('style','overflow-y:hidden !important');
    }else if(win.width() <= 1023){ //Mobile
        $(".SEC_HALF").parents("body").attr('style','overflow-y:auto !important');
    }

	//오시는길 지도 높이 & 컨텐츠 높이
    $("#map").css({"height":$(window).height()});
    $(".SEC_HALF .rgt_con").css({"height":$(window).height()});

});

$(window).load(function(){   

	//왼쪽 네비게이션
	var win = $(this);
    $("nav > div > ul > li > a").click(function(){
        if($(this).hasClass('active')){
            $(this).removeClass('active');
            $(this).siblings("ul").stop(true, false).slideUp("fast");
        }else{
            $("nav > div > ul > li > ul").slideUp("fast");
            $("nav > div > ul > li > a").removeClass("active");
            $(this).siblings("ul").stop(true, false).slideDown("fast");
            $(this).addClass('active');
        };
    });

	//login,join 레이아웃 수정
    if (win.width() >= 768){ //Pc
        $(".DIV_TOP_MNU").insertAfter(".site_link");
    }else if(win.width() <= 767){ //Mobile
        $(".DIV_TOP_MNU").insertAfter(".banner_link");
    }

    //half 화면인 경우 body scroll 제한
    if (win.width() >= 1024){ //Pc        
        $(".SEC_HALF").parents("body").attr('style','overflow-y:hidden !important');
    }else if(win.width() <= 1023){ //Mobile
        $(".SEC_HALF").parents("body").attr('style','overflow-y:auto !important');
    }

	//모바일화면에서 텍스트 br삭제
    if(win.width() <= 768){ //Mobile
        var dbTxt = $('.DIV_PAGE01 .rgt_box_txt p').html();
        dbTxt = dbTxt.replace(/<br>/g, '');
        $('.DIV_PAGE01 .rgt_box_txt p').text(dbTxt);
    }

	//지혜의숲 이용안내 슬라이드
	var height = $(".DIV_PAGE02").height();
	$(".SECTION02 .DIV_BOX_THM").css('height',height);

    //비쥬얼 이미지 높이
    $(".DIV_WIN_HGT").css('height',$(window).height());
	
	//오시는길 지도 높이 & 컨텐츠 높이
    $("#map").css({"height":$(window).height()});
    $(".SEC_HALF .rgt_con").css({"height":$(window).height()});
	
});

$(function(){   
    //견학 신청
    $(".ui-datepicker-trigger").addClass("DIV_DATE");
    $('.DIV_DATE').wrapAll('<div class="date_wrap" />');

    //모바일 네비게이션
    $(".A_SIDE").on("click", function(){
        $(this).hide();
        $("body").css('overflow','hidden')
        $(".A_CLOSE").show();
        $(".DIV_SHADOW").show();
        $(".DIV_MB_WRAP").stop(true, false).slideDown("fast");
    });


    //모바일 네비게이션 (close)
    $(".A_CLOSE, .DIV_SHADOW").on("click", function(){
        $("body").css('overflow','visible')
        $(".A_SIDE").show();
        $(".A_CLOSE").hide();
        $(".DIV_MB_WRAP").stop(true, false).slideUp("fast");
        $(".DIV_SHADOW").hide();
    });

    //편의시설 상세 :: 이미지 클릭시 메인이미지로 확대
	$(".UL_THUMB li:first-child > div > img").addClass("on");
    $(".UL_THUMB li > div > img").click(function() {
        var address = $(this);
        $(".DIV_ZOOM img").attr("src",address.attr("src")).attr("alt",address.attr("alt"));
        $(".UL_THUMB li > div > img").removeClass("on");
        $(this).addClass("on");
        return false;
    });

    //공지사항 상세보기
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

    //오시는길 지도 높이 & 컨텐츠 높이
    $("#map").css({"height":$(window).height()});
    $(".SEC_HALF .rgt_con").css({"height":$(window).height()});
});    


//후원신청 주민번호 출력여부
function showSub(value){
    if(value == 1){
        $(".DIV_ID_NUM").hide();
        $(".DIV_ID_NUM").show();
    }else if(value == 0){
        $(".DIV_ID_NUM").show();
        $(".DIV_ID_NUM").hide();
    }
}

//팝업내용
function layer_open(el, type){
    var mnu = type; 
    var temp = $('.' + el);
    var bg = temp.next().hasClass('DIV_BG');
    var layer1 = $('.P_APPLY');
    var layer2 = $('.P_NEWS');
    var layer3 = $('.P_SUPPORT');
    var layer4 = $('.P_BOOK');
    $("body").attr('style','overflow:hidden !important')
    $("header").attr('style','z-index:1 !important')
    $(".DIV_TOP_WRAP").attr('style','z-index:1')
    $(".DIV_SHADOW,.DIV_MB_WRAP").hide();
    $(".A_SIDE").show();
    $(".A_CLOSE").hide();


    if(type == 'newsletter'){
        layer2.show();
        layer1.hide();
        layer3.hide();
        layer4.hide();
    }else if(type == 'apply'){
        layer1.show();
        layer3.hide();
        layer2.hide();
        layer4.hide();
    }else if(type == 'support'){
        layer3.show();
        layer1.hide();
        layer2.hide();
        layer4.hide();
    }else if(type == 'book'){
        layer3.hide();
        layer1.hide();
        layer2.hide();
        layer4.show();
    }

    if(bg){
        temp.fadeIn();
    }else{
        temp.fadeIn();
    }

    // 화면중앙 레이어::방문신청안내
    if (layer1.outerHeight() < $(document).height() ) layer1.css('margin-top', '-'+layer1.outerHeight()/2+'px');
    else layer1.css('top', '0px');
    if (layer1.outerWidth() < $(document).width() ) layer1.css('margin-left', '-'+layer1.outerWidth()/2+'px');
    else layer1.css('left', '0px');

    // 화면중앙 레이어::뉴스레터신청
    if (layer2.outerHeight() < $(document).height() ) layer2.css('margin-top', '-'+layer2.outerHeight()/2+'px');
    else layer2.css('top', '0px');
    if (layer2.outerWidth() < $(document).width() ) layer2.css('margin-left', '-'+layer2.outerWidth()/2+'px');
    else layer2.css('left', '0px');

    // 화면중앙 레이어::자원봉사안내
    if (layer3.outerHeight() < $(document).height() ) layer3.css('margin-top', '-'+layer3.outerHeight()/2+'px');
    else layer3.css('top', '0px');
    if (layer3.outerWidth() < $(document).width() ) layer3.css('margin-left', '-'+layer3.outerWidth()/2+'px');
    else layer3.css('left', '0px');

    // 화면중앙 레이어::도서후원
    if (layer4.outerHeight() < $(document).height() ) layer4.css('margin-top', '-'+layer4.outerHeight()/2+'px');
    else layer4.css('top', '0px');
    if (layer4.outerWidth() < $(document).width() ) layer4.css('margin-left', '-'+layer4.outerWidth()/2+'px');
    else layer4.css('left', '0px');


    temp.find('.BTN_CLS').click(function(e){
        if(bg){
            temp.fadeOut();
            $("body").css('overflow','visible')
            $("header").attr('style','z-index:20 !important')            
            $(".DIV_TOP_WRAP").attr('style','z-index:3 !important')
            $(".DIV_SHADOW,.DIV_MB_WRAP").hide();
        }else{
            temp.fadeOut();
            $("body").css('overflow','visible')
            $("header").attr('style','z-index:20 !important')
            $(".DIV_TOP_WRAP").attr('style','z-index:3 !important')
            $(".DIV_SHADOW").hide();
        }
        e.preventDefault();
    });

    $('.DIV_BG').click(function(e){ 
        temp.fadeOut();
        e.preventDefault();
        $("body").css('overflow','visible')
        $("header").attr('style','z-index:20 !important')
        $(".DIV_TOP_WRAP").attr('style','z-index:3 !important')
        $(".DIV_SHADOW,.DIV_MB_WRAP").hide();
    });
}