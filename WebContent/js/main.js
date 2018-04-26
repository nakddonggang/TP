//메인 ====================================================================================================


$(window).load(function() {
    var win = $(this);
    $("body").css('overflow','hidden');
    //PC화면에서 텍스트 br삭제
    if(win.width() >= 768){ //PC
        var dbTxt = $('.P_APPLY .ctxt .tit').html();
        dbTxt = dbTxt.replace(/<br>/g, '');
        $('.P_APPLY .ctxt .tit').text(dbTxt);
    }

    //login,join 레이아웃 수정
    if (win.width() >= 1200){ 
        $("body").attr('style','overflow-x:hidden !important')
    }else if(win.width() <= 1199){ 
        $("body").attr('style','overflow-x:scroll !important')
    }
});

$(function(){
    //메인 슬라이드 이미지
    $(".DIV_BOX_THM01, .DIV_BOX_THM02, .DIV_BOX_THM03").css({"height":$(window).height()})
    //메인화면 좌측 컨텐츠 height
    var height = $(window).height();
    $(".DIV_RGT_BOX").css('height',height-40);

    //Datepicker 일자선택
    $(".TXT_DATE,.TXT_DATE_STA,.TXT_DATE_END").datepicker({
        showOn: "both", 
        buttonImageOnly: true ,
        dateFormat: 'yy.mm.dd',
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        changeMonth: true,
        changeYear: true,
        showMonthAfterYear: true,
        onClose: function(dateText, inst) { 
        //var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            //$(this).datepicker('setDate', new Date(year));            
            DateVadtn(dateText);
        }
        
    });

    $(".DIV_TOP_WRAP").attr('style', 'background:none !important')
});    

$(window).on('resize', function(){
    //메인 슬라이드 이미지
    $(".DIV_BOX_THM01, .DIV_BOX_THM02, .DIV_BOX_THM03").css({"height":$(window).height()})
    
    var win = $(this);
    //login,join 레이아웃 수정
    if (win.width() >= 1200){ 
        $("body").attr('style','overflow-x:hidden !important')
    }else if(win.width() <= 1199){ 
        $("body").attr('style','overflow-x:scroll !important')
    } 

    //지혜의숲 이용안내 슬라이드
    var height = $(".DIV_PAGE02").height();
    $(".SECTION02 .DIV_BOX_THM").css('height',height);

});