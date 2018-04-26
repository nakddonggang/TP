//지혜의숲(메인)====================================================================================================
$(function(){
    $(".SECTION_FULL_PAGE01").fullpage({
        anchors: ["firstPage", "secondPage", "thirdPage"],
        menu: "#menu",
        navigation: false,
        navigationPosition: "right",
        slidesNavigation: true,
        slidesNavPosition: "top",

        //Scrolling
        css3: true,
        scrollingSpeed: 700,
        autoScrolling: false,
        fitToSection: false,
        fitToSectionDelay: 1000,
        scrollBar: true,
        easing: 'easeInOutCubic',
        //easingcss3: 'ease',
        loopBottom: false,
        loopTop: false,
        loopHorizontal: true,
        scrollOverflow: false,
        loopHorizontal: true,
        scrollOverflow: false,

        //Design
        controlArrows: true,
        verticalCentered: true,
        resize : true,
        paddingBottom: "0",
        marginTop:"-3em",
        sectionSelector: ".section",
        slideSelector: ".slide",

        //events
        afterRender: function(){
        },        
        onLeave: function(index, nextIndex, direction){},
        afterLoad: function(anchorLink, index){},
        afterRender: function(){},
        afterResize: function(){},
        afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex){},
        onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex){}
    });
    
    //page5 slide button    
    $('.fp-controlArrow').wrapAll('<div class="arrow_wrap"/>');

    $('.fp-slidesNav').insertAfter(".fp-slides > .fp-slidesContainer");
    $('.arrow_wrap').insertAfter(".fp-slides > .fp-slidesNav");
});

//지혜의숲(서브)====================================================================================================
$(function(){
    $(".SECTION_FULL_PAGE02").fullpage({
        anchors: ["firstPage", "secondPage", "thirdPage"],
        menu: "#menu",
        navigation: true,
        navigationPosition: "right",
        slidesNavigation: true,
        slidesNavPosition: "top",

        //Scrolling
        css3: true,
        scrollingSpeed: 700,
        autoScrolling: false,
        fitToSection: false,
        fitToSectionDelay: 1000,
        scrollBar: true,
        easing: 'easeInOutCubic',
        //easingcss3: 'ease',
        loopBottom: false,
        loopTop: false,
        loopHorizontal: true,
        scrollOverflow: false,
        loopHorizontal: true,
        scrollOverflow: false,

        //Design
        controlArrows: true,
        verticalCentered: true,
        resize : true,
        paddingBottom: "0",
        marginTop:"-3em",
        sectionSelector: ".section",
        slideSelector: ".slide",

        //events
        afterRender: function(){
        },        
        onLeave: function(index, nextIndex, direction){},
        afterLoad: function(anchorLink, index){},
        afterRender: function(){},
        afterResize: function(){},
        afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex){},
        onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex){}
    });
    
    //page5 slide button    
    $('.fp-controlArrow').wrapAll('<div class="arrow_wrap"/>');

    $('.fp-slidesNav').insertAfter(".fp-slides > .fp-slidesContainer");
    $('.arrow_wrap').insertAfter(".fp-slides > .fp-slidesNav");
});
