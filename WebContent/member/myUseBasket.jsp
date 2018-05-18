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
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#resBtn').click(function(){
		$('#basketForm').attr("action","./MemberBasketResAction.me");
	});
	
	$('#delBtn').click(function(){
		$('#basketForm').attr("action","./MemberBasketDelete.me");
	});
	
	$('#allCheck').click(function(){
		if($('#allCheck').prop("checked")){
			$('input[type=checkbox]').prop("checked",true);
		}else{
			$('input[type=checkbox]').prop("checked",false);
		}
	});
});
</script>
<body>
<%
	String alert = (String)request.getAttribute("alert");
	List<MemberDTO> MemberBasketList = (List<MemberDTO>)request.getAttribute("bList");
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
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //서브메뉴 -->
				
				<!-- 메인 페이지 -->
				<article class="mainmenu section SECTION">
				<jsp:include page="../include/topbar.jsp" />
					
					<div class="content">
						<div class=board>
						
						<h1>책 바구니</h1>
						<form action="" method="post" id="basketForm">
						
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<div class="con_lst">
								<ul class="no_scroll title_t">
									<li class="col_num"><input type="checkbox" id="allCheck"></li>
									<li class="adm_col_date">사진</li>
									<li class="adm_col_subs">제목</li>
									<li class="adm_col_date">저자</li>
									<li class="adm_col_date">대출상태</li>
									<li class="col_date">예약상태</li>
								</ul>
							</div>
							<%
							if(MemberBasketList.size()==0){	%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul><%	}
							else{
								for(int i=0; i<MemberBasketList.size(); i++){
									MemberDTO mDTO = (MemberDTO)MemberBasketList.get(i);
									String bbook_bstate, rbook_check = "";
									if("0".equals(mDTO.getBbook_bstate())){	bbook_bstate = "대출중";}
									else{ bbook_bstate = "대출가능";}
									if("0".equals(mDTO.getRbook_check())){ rbook_check = "예약불가";}
									else{ rbook_check = "예약가능";}
									%>
									<div class="con_lst">
										<ul class="no_scroll">
											<li class="col_num"><input type="checkbox" name="checkbox" value="<%=mDTO.getBasket_number() %>"></li>
											<li class="adm_col_date"><img src="./upload/<%=mDTO.getBook_file()%>" width="70" height="80"></li>
											<li class="adm_col_subs"><p><%=mDTO.getBook_subject() %></p></li>
											<li class="adm_col_date"><p><%=mDTO.getBook_author() %></p></li>
											<li class="adm_col_date"><p><%=bbook_bstate %></p></li>
											<li class="adm_col_date"><p><%=rbook_check %></p></li>
										</ul>
									</div>
								<%
								}
							}
							%>
							</li>
						</ul>

						<div class="btn_btm_board">
							<ul>
								<li class="btn_con_right">
									<input type="submit" value="예약하기" class="btn_type4" id="resBtn"> 
									<input type="submit" value="삭제하기" class="btn_type4" id="delBtn">
								</li>
							</ul>
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
<script type="text/javascript">
$(document).ready(function(){
	var msg = "<%=alert %>";
	if(msg=="1"){
		alert("이미 예약했거나 예약이 꽉 찬 도서입니다.");
	}
	if(msg=="2"){
		alert("이미 예약한 도서입니다.");
	}
});
</script>
</body>
</html>