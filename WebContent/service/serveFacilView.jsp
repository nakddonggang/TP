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
	if(member_id == null) {
		%>
		<script type="text/javascript">
			alert("로그인후 사용 부탁드립니다.");
			location.href = "./MemberLogin.me";
		</script>
		<%
	}
	FacilityDTO fDTO = (FacilityDTO)request.getAttribute("fDTO");
%>
					<h2>자리 세부정보</h2>
					<form action="./FacilityUseAction.fy" method="post">
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
					<input type="submit" value="자리 빌리기">
					<input type="button" value="뒤로가기" onclick = "history.back()">
				</div>
				</form>
</body>
</html>