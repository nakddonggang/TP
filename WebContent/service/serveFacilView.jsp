<%@page import="java.util.Date"%>
<%@page import="net.facility.db.FacilityDAO"%>
<%@page import="net.member.db.MemberDTO"%>
<%@page import="net.facility.db.FacilityDTO"%>
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
</head>
</head>
<body class="if_board">
<%
	String member_id = (String)session.getAttribute("member_id");
	FacilityDTO fDTO = (FacilityDTO)request.getAttribute("fDTO");
	FacilityDAO fDAO = new FacilityDAO();
	String userCheck = fDTO.getMember_id();
	Date start_time = fDTO.getFacil_stime();
	if(userCheck == null) userCheck = "";
	int check = fDAO.useMember(member_id);
%>
	<div class="wrapper">
		<section class="fullpage SECTION_FULL_PAGE01">
		<!-- 메인 페이지 -->
			<article class="mainmenu section SECTION">
				<div class="facil_view">
					<h3>자리 세부정보</h3>
					<form action="./FacilityUseAction.fy?facil_num=<%=fDTO.getFacil_num() %>" method="post" name = "facilviewform">
						<ul>
							<li>
								<ul>
									<li>자리번호 : </li>
									<li><%=fDTO.getFacil_num() %></li>
								</ul>
							</li>
							<li>
								<ul>	
									<li>자리유형 : </li>
									<li><%	
										switch(fDTO.getFacil_type()) {
											case "media": out.println("미디어");	break;
											case "desk": out.println("칸막이");	break;
											case "etc": out.println("기타");		break;
											default :	}
									%></li>
								</ul>
							</li>
							<li>
								<ul>
									<li>사용유무 : <li>
									<li><%
											if(Integer.parseInt(fDTO.getFacil_use()) != 1)	out.println("사용가능");
											else out.println("사용중");
									%></li>
								</ul>
							</li>
							<li>
								<div class="btn_btm_center">
									<ul>
										<li class="btn_cancle">
											<input type="hidden" value="<%=fDTO.getFacil_use()%>" name = "facil_use">
											<%if(start_time != null) { %>
											<input type="hidden" value="<%=fDTO.getFacil_stime() %>"name ="facil_stime">
											<% }
												if(member_id != null){
													if(Integer.parseInt(fDTO.getFacil_use()) != 1 && check == 0) out.print("<input type='submit' value='사용하기' class='btn_type4'>");
													else if(userCheck.equals(member_id)) out.print("<input type='button' value='반납' onclick=location.href='./FacilityUnUseAction.fy?facil_num=" + fDTO.getFacil_num() + "&facil_use=" + fDTO.getFacil_use() + "' class='btn_type4'>");
													else if(check == 1)	out.print("<span>사용중인 자리 반납 후 사용 가능 합니다.</span>");
												} else out.print("<span>좌석 예약은 로그인 후 이용 가능합니다</span>");
											%>	
										</li>
										<li>
											<input type="button" id="BTN_FACIL_CLOSE" class="btn_type4" value="닫기">
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</form>
				</div>
			</article>
		</section>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>