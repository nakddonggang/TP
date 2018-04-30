<%@page import="net.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int count=((Integer)request.getAttribute("count")).intValue();

String pageNum=(String)request.getAttribute("pageNum");
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
List<BoardDTO> faqList=(List<BoardDTO>)request.getAttribute("faqList");

%>

	<div class="wrapper">

		<!-- header -->
		<jsp:include page="../include/header.jsp" />
		<!-- //header -->

		<!-- container -->
		<div class="container">
			<section class="fullpage SECTION_FULL_PAGE01">
				<h2 class="hide">Main</h2>

				<!-- left_content -->
				<jsp:include page="../include/submenu_main.jsp" />
				<!-- //left_content -->
				<article class="rgt_con section SECTION">
					<!-- 본문 공간 -->
								
					<h1>게시판 글목록 [전체글개수 : <%=count %>]</h1>
<table border="1">
<tr><td>번호</td><td>종류</td><td>제목</td><td>내용</td><td>파일</td><td></td></tr>
<%
for(int i=0; i<faqList.size(); i++){
	BoardDTO bDTO = faqList.get(i);	//제너릭 사용해서 형변환 할 필요없음
%>
	<tr><td><%=bDTO.getFaq_num() %></td><td><%=bDTO.getFaq_type()%></td>
	<td><%=bDTO.getFaq_subject() %></td><td><%=bDTO.getFaq_content() %></td>
	<td><img src="./upload/<%=bDTO.getFaq_file()%>" width="100" height="100"></td>
	
	<td><input type="button" value="글수정" onclick="location.href='./BoardFaqUpdate.fa?faq_num=<%=bDTO.getFaq_num()%>&pageNum=<%=pageNum%>'"> 
	<input type="button" value="글삭제" onclick="location.href='./BoardFaqDelete.fa?faq_num=<%=bDTO.getFaq_num()%>&pageNum=<%=pageNum%>'"></td></tr>
<%	
}
%>
</table>
<input type="button" value="글쓰기" onclick="location.href='./BoardFaqWrite.fa'">
<%
if(count != 0){
		
	//이전
	if(startPage > pageBlock){
		%><a href="./BoardFaqList.fa?pageNum=<%=startPage-1 %>">[이전]</a>&nbsp;<%
	}
	
	//1~10	11~20	21~30
	for(int i=startPage; i<=endPage; i++){
		%>&nbsp;<a href="./BoardFaqList.fa?pageNum=<%=i %>"><%=i %></a>&nbsp;<%
	}
	
	//다음
	if(endPage < pageCount){
		%>&nbsp;<a href="./BoardFaqList.fa?pageNum=<%=startPage+pageBlock %>">[다음]</a><%
	}
}
%>
					
					<!-- // 본문 공간 -->
				</article>
			</section>
		</div>
		<!-- //container -->
	</div>
		

</body>
</html>
