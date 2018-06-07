<%@page import="net.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/css/jquery.fullpage.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/jquery.toast.min.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/jQuery.Alert-1.0.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.toast.min.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script type="text/javascript">
if("${member_id}"!='admin') {
	$.Alert("잘못된 접근입니다", function(){location.href='./MemberLogin.me';});
}
</script>
</head>
<body>
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
				<!-- 메인 페이지 -->
				<div class="content">
					<h3>회원 목록 리스트</h3>
					<div class="view_cnt">
						<p>Total_<span id="count"></span></p>
					</div>
					<div>
						<input type="button" name="btn_all"		id="%" class="callAjax" value="전체보기">
						<input type="button" name="btn_black"	id="1" class="callAjax" value="블랙리스트">
						<input type="button" name="btn_good"	id="2" class="callAjax" value="우수화원">
						<input type="button" name="btn_admin"	id="3" class="callAjax" value="관리자">
					</div>
					<ul class="brd_txt_lst">
						<!-- 글목록 -->
						<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
									<li class="col_typen">아이디</li>
									<li class="col_typen">비밀번호</li>
									<li class="col_typen">이름</li>
									<li class="col_calln">전화번호</li>
									<li class="col_typen">회원등급</li>
									<li class="col_calln">가입일</li>
								</ul>
							</div>
							<div id="ajax_container">
								
							</div>
						</li>
					</ul>
				</div>
				<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
<script type="text/javascript">
$(document).ready(function(){
	// 주소창에 Get방식으로 받아온 request값 스크립트에서 사용하기 위한 함수
	function Request(valuename){
		var rtnval;
		var nowAddress = unescape(location.href);
		var parameters = new Array();
		parameters = (nowAddress.slice(nowAddress.indexOf("?")+1,nowAddress.length)).split("&");
		for(var i = 0 ; i < parameters.length ; i++){
			if(parameters[i].split("=")[0] == valuename){
				rtnval = parameters[i].split("=")[1];
				if(rtnval == undefined || rtnval == null){
					rtnval = "";
				}
				return rtnval;
			}
		}
	}
	var pageNum = Request("pageNum");
	if(pageNum=="") pageNum=1;

	var member_level = "%";
	loadAjax(member_level);
	
	$(".callAjax").click(function(){
		$('#ajax_container').empty();
		$('.empty').remove();
		history.pushState(null,null,"AdminMemberIndex.am");
		member_level = $(this).attr("id");
		pageNum = "1";
		loadAjax(member_level);
	});
	
	function loadAjax(member_level){
		$.ajax({
			url:"./AdminMemberAjax.am",
			type:'POST',
			data:{'member_level':member_level, 'pageNum':pageNum},
			dataType:'json',
			success:function(result){
				var jsonData = JSON.parse("["+result+"]");
				var count= jsonData[jsonData.length-6].count;
				var pageNum= jsonData[jsonData.length-5].pageNum;
				var pageCount= jsonData[jsonData.length-4].pageCount;
				var pageBlock= jsonData[jsonData.length-3].pageBlock;
				var startPage= jsonData[jsonData.length-2].startPage;
				var endPage= jsonData[jsonData.length-1].endPage;
				console.log(jsonData.length);
				$('#count').html(count);
				
				if(jsonData.length == 6){
					var content = "<ul class='no_scroll empty'><li class='col_tit'><p>회원이 없습니다</p></li></ul>";
					$(".con_lst").append(content);
				}else{
					for(var i=0; i<jsonData.length-6; i++){
						var content ="";
						if(i==jsonData.length-7){
							content = "<div class='con_lst paging'><ul onclick='location.href=\"./AdminMemberInfo.am?info_id="+jsonData[i].member_id
							+"&pageNum="+pageNum+"&member_level="+member_level+"\"' class='no_scroll'>"
							+"<li class='col_typen'><p>"+jsonData[i].member_id+"</p></li>"
							+"<li class='col_typen'><p>"+jsonData[i].member_pass+"</p></li>"
							+"<li class='col_typen'>"+jsonData[i].member_name+"</li>"
							+"<li class='col_calln'>"+jsonData[i].member_phone+"</li>"
							+"<li class='col_typen'>";
						}else {
							content = "<div class='con_lst'><ul onclick='location.href=\"./AdminMemberInfo.am?info_id="+jsonData[i].member_id
							+"&pageNum="+pageNum+"&member_level="+member_level+"\"' class='no_scroll'>"
							+"<li class='col_typen'><p>"+jsonData[i].member_id+"</p></li>"
							+"<li class='col_typen'><p>"+jsonData[i].member_pass+"</p></li>"
							+"<li class='col_typen'>"+jsonData[i].member_name+"</li>"
							+"<li class='col_calln'>"+jsonData[i].member_phone+"</li>"
							+"<li class='col_typen'>";
						}
			
						if(jsonData[i].gm_check=="0" && jsonData[i].bl_check=="0"){ content += "일반회원</li>";}
						else if(jsonData[i].gm_check=="1" && jsonData[i].bl_check=="0"){content += "우수회원</li>";}
						else if(jsonData[i].bl_check=="1" && jsonData[i].gm_check=="0"){content += "블랙리스트</li>";}
						else {content += "일반회원</li>";}
									
						content += "<li class='col_calln'>"+jsonData[i].member_date+"</li></ul></div>";
						$('#ajax_container').append(content);
					}
					var paging = "<div class='paginate'>";
					if(count != 0){
						if(startPage > pageBlock){
							paging += "<a href='./AdminMemberIndex.am?pageNum="+(startpage-pageBlock)+"' class='prev'><span class='hide'>이전 페이지</span></a>";
						}
					}
					for(var p=startPage; p<=endPage; p++){
						if(p == parseInt(pageNum)){
							paging += "&nbsp;<strong title='현재 페이지' id='currentPage'>"+p+"</strong> &nbsp;";
						}else{
							paging += "&nbsp;<a href='./AdminMemberIndex.am?pageNum="+p+"'>"+p+"</a>&nbsp;";
						}
					}
					if(endPage < pageCount){
						paging += "<a href='./AdminMemberIndex.am?pageNum="+(startpage+pageBlock)+"' class='next'><span class='hide'>다음 페이지</span></a>"
					}
					paging += "</div>";
					$('.paging').append(paging);
				}

											
//		 			var jsonData = JSON.parse(result.data);
//		 			for(var i=0; i<jsonData.users.length; i++) {
//		 		          if (chatuser==jsonData.users[i]) {
//		 		        	 $('#nowChat').empty();
//		 		             $('#nowChat').append("<span>" + jsonData.users[i]+"님과 대화중입니다.</span>");
//		 		             other = jsonData.users[i];
//		 		             first = "false";
//		 		          }
//		 			}
			}
		});
	}
		

});
</script>
</body>
</html>