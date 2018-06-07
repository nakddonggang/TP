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
<%
request.setCharacterEncoding("UTF-8");
String member_id = (String)session.getAttribute("member_id");
int count = ((Integer) request.getAttribute("count")).intValue();
String pageNum = (String) request.getAttribute("pageNum");
int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer) request.getAttribute("startPage")).intValue();
int endPage = ((Integer) request.getAttribute("endPage")).intValue();

List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
%>
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
						<p>Total_<span><%=count%></span></p>
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
								<% if (memberList == null) {
									%><ul>
										<li class="col_tit"><p>회원이 없습니다</p></li>
									</ul><%
								} else {
									for (int i = 0; i < memberList.size(); i++) {
										MemberDTO mt = memberList.get(i); //제너릭 사용해서 형변환 할 필요없음
										String gm_check = mt.getGm_check();
										String bl_check = mt.getBl_check();
										
										%><div class="con_lst">
											<ul onclick="location.href='./AdminMemberInfo.am?info_id=<%=mt.getMember_id()%>&pageNum=<%=pageNum%>&pageType='"  class="no_scroll">
												<li class="col_typen"><a href="#"><p><%=mt.getMember_id()%></p></a></li>
												<li class="col_typen"><a href="#"><p><%=mt.getMember_pass()%></p></a></li>
												<li class="col_typen"><%=mt.getMember_name()%></li>
												<li class="col_calln"><a href="#"><%=mt.getMember_phone()%></a></li>
												<li class="col_typen"><%
													if 		(gm_check.equals("0") && bl_check.equals("0")) {	%>일반회원<%		} 
													else if (gm_check.equals("1") && bl_check.equals("0")) {	%>우수회원<%		} 
													else if (bl_check.equals("1") && gm_check.equals("0")) {	%>블랙리스트<%	} 
													else {	%>일반회원<%	}
												%></li>
												<li class="col_calln"><%=mt.getMember_date()%></li>
											</ul>
										</div>
										
									<%}%>
								<%}%>
								<div class="paginate">
									<%if (count != 0) {
										//이전
										if (startPage > pageBlock) {%><a href="./AdminMemberIndex.am?pageNum=<%=startPage - pageBlock%>" class="prev"><span class="hide">이전 페이지</span></a><%}// 1~10 11~20 21~30
										for (int i = startPage; i <= endPage; i++) {%><a href="./AdminMemberIndex.am?pageNum=<%=i%>"> &nbsp;<strong id="currentPage" title="현재 페이지"><%=i %></strong>&nbsp;</a><%}
										//다음
										if (endPage < pageCount) {%><a href="./AdminMemberIndex.am?pageNum=<%=startPage + pageBlock%>"class="next"><span class="hide">다음 페이지</span></a><%}
									}%>
								</div>
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
$(".callAjax").click(function(){
	$('#ajax_container').empty();
	var member_level = $(this).attr("id");
	$.ajax({
		url:"./AdminMemberAjax.am",
		type:'POST',
		data:{'member_level':member_level},
		dataType:'json',
		success:function(result){
			var count="${count}";
			var pageNum="${pageNum}";
			var pageCount="${pageCount}";
			var pageBlock="${pageBlock}";
			var startPage="${startPage}";
			var endPage="${endPage}";
			
			var jsonData = JSON.parse("["+result+"]");
			console.log(jsonData[0].member_id);
			for(var i=0; i<jsonData.length; i++){
				var content = "<div class='con_lst'><ul onclick='location.href=\"./AdminMemberInfo.am?info_id="+jsonData[i].member_id
						+"&pageNum="+pageNum+"\"' class='no_scroll'>"
						+"<li class='col_typen'><p>"+jsonData[i].member_id+"</p></li>"
						+"<li class='col_typen'><p>"+jsonData[i].member_pass+"</p></li>"
						+"<li class='col_typen'>"+jsonData[i].member_name+"</li>"
						+"<li class='col_calln'>"+jsonData[i].member_phone+"</li>"
						+"<li class='col_typen'>";
				if(jsonData[i].gm_check=="0" && jsonData[i].bl_check=="0"){ content += "일반회원</li>";}
				else if(jsonData[i].gm_check=="1" && jsonData[i].bl_check=="0"){content += "우수회원</li>";}
				else if(jsonData[i].bl_check=="1" && jsonData[i].gm_check=="0"){content += "블랙리스트</li>";}
				else {content += "일반회원</li>";}
						
				content += "<li class='col_calln'>"+jsonData[i].member_date+"</li></ul></div>";
				$('#ajax_container').append(content);
			}
			
			
			
// 			var jsonData = JSON.parse(result.data);
// 			for(var i=0; i<jsonData.users.length; i++) {
// 		          if (chatuser==jsonData.users[i]) {
// 		        	 $('#nowChat').empty();
// 		             $('#nowChat').append("<span>" + jsonData.users[i]+"님과 대화중입니다.</span>");
// 		             other = jsonData.users[i];
// 		             first = "false";
// 		          }
// 			}
		}
	});
});
</script>
</body>
</html>