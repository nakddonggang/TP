<%@page import="net.facility.db.FacilityDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
List<FacilityDTO> facilList= (List)request.getAttribute("facilList");
String facil_num = (String)request.getAttribute("facil_num");
%>

<body>
<form action="./AdminFacilSuggAddAction.am?facil_num=<%=facil_num%>"  method="post"  name="fr">
	<select name="obj_mname">
<%for(int i= 1; i<facilList.size(); i++){
	FacilityDTO fDTO = facilList.get(i);
	%>
	<option value="<%=fDTO.getObj_mname()%>"><%=fDTO.getObj_mname()%></option>
<%} %>
</select>
<input type="submit" value="시설물 추가" class ="btn_type4">
</form>
</body>
</html>