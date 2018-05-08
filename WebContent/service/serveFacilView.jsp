<%@page import="net.facility.db.FacilityDAO"%>
<%@page import="net.member.db.MemberDTO"%>
<%@page import="net.facility.db.FacilityDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	String member_id = (String)session.getAttribute("member_id");
	FacilityDTO fDTO = (FacilityDTO)request.getAttribute("fDTO");
	FacilityDAO fDAO = new FacilityDAO();
	String userCheck = fDTO.getMember_id();
	if(userCheck == null) {
		userCheck = "";
	}
	int check = fDAO.useMember(member_id);
%>
					<h2>자리 세부정보</h2>
					<form action="./FacilityUseAction.fy?facil_num=<%=fDTO.getFacil_num() %>" method="post" name = "facilviewform">
						<table border="1">
							<tr>
								<th>자리번호 : </th><td><%=fDTO.getFacil_num() %></td>
							</tr>
							<tr>	
								<th>자리유형 : </th>
								<td><%
								switch(fDTO.getFacil_type()) {
								case "media": out.println("미디어");
									break;
								case "desk": out.println("칸막이");
									break;
								case "etc": out.println("기타");
									break;
								default :
								}
								%></td>
							</tr>
							<tr>
							<th>사용유무 : <th>
							<td><%
							if(Integer.parseInt(fDTO.getFacil_use()) != 1) {
								out.println("사용가능");
							} else {
								out.println("사용중");
							}
							%></td>
							</tr>
						</table>		
						<input type="hidden" value="<%=fDTO.getFacil_use()%>" name = "facil_use">
						<div>
						<%
						if(member_id != null){
							if(Integer.parseInt(fDTO.getFacil_use()) != 1 && check == 0) {
								%><input type = "submit" value = "사용하기" ><%
							} else if(userCheck.equals(member_id)){
								%><input type = "button" value = "반납" 
								onclick = "location.href = './FacilityUnUseAction.fy?facil_num=<%=fDTO.getFacil_num()%>&facil_use=<%=fDTO.getFacil_use()%>'"><%
							} else if(check == 1) {
								out.print("<span>사용중인 자리 반납 후 사용 가능 합니다.</span>");
							} 
						} else {
							out.print("<span>좌석 예약은 로그인 후 이용 가능합니다</span>");
						}
						%>	
					<input type="button" value="뒤로가기" onclick = "location.href = './Facility.fy'">
				</div>
				</form>
</body>
</html>