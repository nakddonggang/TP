<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.member.action.MemberBasketList"%>
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
$(document).ready(function(){
	$('#resBtn').click(function(){
		if($('.checkbox').is(":checked")==false){
			$.Alert('책을 선택해주세요', function(){ });
		}else{
			$.Confirm(
				'예약 하시겠습니까?',
				function(){
					$('#basketForm').attr("action","./MemberBasketResAction.me");
					$('#basketForm').submit();
				}
			);
		}
	});
	
	$('#delBtn').click(function(){
		if($('.checkbox').is(":checked")==false){
			$.Alert('책을 선택해주세요', function(){ });
		}else{
			$.Confirm(
				'삭제 하시겠습니까?',
				function(){
					$('#basketForm').attr("action","./MemberBasketDelete.me");
					$('#basketForm').submit();
				}
			);
		}
	});
	
	$('#allCheck').click(function(){
		if($('#allCheck').prop("checked")){
			$('input[type=checkbox]').prop("checked",true);
		}else{
			$('input[type=checkbox]').prop("checked",false);
		}
	});
	
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
	
	var msg = Request("alert");
	if(msg=="1"){
		$.Alert("이미 대출,예약했거나 예약이 꽉 찬 도서가 포함됐습니다.", function(){});
	}
});
</script>
<body>
<%
	String alert = (String)request.getAttribute("alert");
	List<MemberDTO> MemberBasketList = (List<MemberDTO>)request.getAttribute("bList");
	List bbookList = (List)request.getAttribute("bbook_bstate");
	List rbookList = (List)request.getAttribute("rbook_check");
	List checkMember = (List)request.getAttribute("check_member");
	int count = ((Integer)request.getAttribute("count")).intValue();
	String member_id = (String) session.getAttribute("member_id");
	String pageNum =  (String)request.getAttribute("pageNum");
	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
%>
	<!-- member/myUseBasket.jsp / MyUseIndex >> 책바구니 페이지 -->
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- 본문 컨테이너 -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">

				<!-- 서브메뉴 -->
				<article class="submenu section SECTION">
					<div class="slide DIV_SLIDE">
						<div class="intro1">
							<div class="slide_con">
								<div class="box_thm">
									<div id="myUseBasket_img" >
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
				<!-- //서브메뉴 -->
				
				<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					
					<div class="content">
						<div class=board>
						
						<h3>책 바구니</h3>
						<form action="" method="post" id="basketForm">
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
									<li class="buk_c"><input type="checkbox" id="allCheck"></li>
									<li class="buk_p">사진</li>
									<li class="buk_t">제목</li>
									<li class="buk_n">저자</li>
									<li class="buk_n">대출상태</li>
									<li class="buk_n">예약상태</li>
								</ul>
							</div>
							<%
							if(MemberBasketList.size()==0){	%><ul><li class="col_tit"><p>담아놓은 책이 없습니다</p></li></ul><%	}
							else{
								for(int i=0; i<MemberBasketList.size(); i++){
									MemberDTO mDTO = (MemberDTO)MemberBasketList.get(i);
									String bbook_bstate, rbook_check = "";
									if("1".equals(bbookList.get(i).toString())){ bbook_bstate = "대출중";}
									else{ bbook_bstate = "대출가능";}
									if("3".equals(rbookList.get(i).toString())){ rbook_check = "예약불가";}
									else{ rbook_check = "예약가능";}
									if((int)checkMember.get(i)==1) { rbook_check = "예약중";}
									%>
									<div class="con_lst">
										<ul class="no_scroll">
											<li class="buk_c"><input type="checkbox" name="checkbox" class="checkbox" value="<%=mDTO.getBasket_number() %>"></li>
											<li class="buk_p"><img src="./upload/book/<%=mDTO.getBook_file()%>" width="48" height="50"></li>
											<li class="buk_t"><p><%=mDTO.getBook_subject() %></p></li>
											<li class="buk_n"><p><%=mDTO.getBook_author() %></p></li>
											<li class="buk_n"><p><%=bbook_bstate %></p></li>
											<li class="buk_n"><p><%=rbook_check %></p></li>
										</ul>
									</div>
								<%
								}
							}
							%>
							</li>
						</ul>
						
						<div class="btn_btm_center">	
						<ul>
						<li class="adm_btn_cancle">
									<input type="button" value="예약하기" class="btn_type4 BTN_IF_LIST" id="resBtn"> 
						</li>
						<li class="adm_btn_cancle">
									<input type="button" value="삭제하기" class="btn_type4 BTN_IF_LIST" id="delBtn">
						</li>
						</ul>
						
						</div>
						
						<div class="paginate">
						
						<a href="./MemberBasketList.me?pageNum=1" class="prev2"><span class="hide">페이지처음</span></a>
						<%
						if(pageCount < endPage)	endPage = pageCount;
						if(startPage > pageBlock)	{ %><a href="./MemberBasketList.me?pageNum=<%=startPage - pageBlock%>" class="prev"><span class="hide">이전 페이지</span></a><%	}
						for (int p = startPage; p <= endPage; p++) {	
							if(p==Integer.parseInt(pageNum)) {%> &nbsp;<strong id="currentPage" title="현재 페이지"><%=p %></strong> &nbsp;<%}
							else {%> &nbsp;<a href="./MemberBasketList.me?pageNum=<%=p%>"><%=p %></a> &nbsp;<%}
						}
						if(endPage < pageCount){	%><a href="./MemberBasketList.me?pageNum=<%=startPage+pageBlock%>" class="next"><span class="hide">다음 페이지</span></a><% }
						%>
						<a href="./MemberBasketList.me?pageNum=<%=pageCount%>" class="next2"><span class="hide">페이지끝</span></a>
						</div>
						
						</form>

					</div>
				</div>

				</article>
				<!-- //메인 페이지-->
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>

</body>
</html>