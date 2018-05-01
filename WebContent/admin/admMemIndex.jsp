<%@page import="net.member.db.MemberDTO"%>
<%@page import="java.util.List"%>

	<%
		request.setCharacterEncoding("UTF-8");
		int count = ((Integer) request.getAttribute("count")).intValue();

		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();

		List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
	%>

<div>
<jsp:include page="../admin/admMemNormal.jsp"/>
</div>
<div>
<jsp:include page="../admin/admMemBlack.jsp"/>
</div>
<div>
<jsp:include page="../admin/admMemGood.jsp"/>
</div>