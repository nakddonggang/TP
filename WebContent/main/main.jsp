<%@page import="net.board.db.BoardDTO"%>
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
<link href="<c:url value="/css/jquery.fullpage"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fullpage.min.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/fullpage.js"/>"></script>
<style type="text/css">
#websocketChat{  
    border:5px solid grey;  
    width:800px;  
    margin:0 auto;  
    padding:10px;  
}  
#chatLog{  
    padding:5px;  
    border:1px solid black;  
}  
#chatLog p {  
    margin:0;  
}  
.event {  
    color:#999;  
}  
.warning{  
    font-weight:bold;  
    color:#CCC;  
}  
</style>
</head>
<%
request.setCharacterEncoding("UTF-8");
String pageNum =  (String)request.getAttribute("pageNum");
List<BoardDTO> noticeList = (List<BoardDTO>)request.getAttribute("noticeList");
List<BoardDTO> curationList = (List<BoardDTO>)request.getAttribute("curationList");
%>
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
				
					<!-- 공지사항 -->
					<div class="">
						<ul class="brd_txt_lst">
							<!-- 글목록 -->
							<li class="view_lst">
							<%
								if(noticeList==null){	%><ul><li class="col_tit"><p>게시글이 없습니다</p></li></ul><%	}
								else{
									for(int i=0; i<noticeList.size(); i++){
										BoardDTO bDTO = noticeList.get(i);	//제너릭 사용해서 형변환 할 필요없음
									%>
										<div class="con_lst DIV_CON_LST">
											<ul>
												<li class="col_type"><a href="#"><p><%=bDTO.getNotice_type() %></p></a></li>
												<li class="col_title"><a href="#"><p><%=bDTO.getNotice_subject() %></p></a></li>
												<li class="col_date"><span class="tit_date">작성일 :&nbsp;</span><span><%=bDTO.getNotice_date() %></span></li>
												<li class="col_rc"><a href="#"><%=bDTO.getNotice_readcount() %></a></li>
											</ul>
											
											<div class="con_detail DIV_CON_DETAIL">
												<p><%=bDTO.getNotice_content() %></p>		
											</div>
										</div>
									<%	}	%>
								<%	}	%>
							</li>
						</ul>
					</div>
					
					
					<!-- 큐레이션 -->
					<div class="">
					<table border="1">
						<tr><td>번호</td><td>종류</td><td>작성자</td><td>제목</td><td>내용</td><td>파일</td><td>조회수</td><td></td></tr>
						<%
						if(curationList==null){
							%><tr><td colspan="8">게시물이 없습니다.</td></tr><%
						}else{
							for(int i=0; i<curationList.size(); i++){
								BoardDTO bDTO = curationList.get(i);
							%>
								<tr onclick="location.href='./?curNum=<%=bDTO.getCur_num()%>&pageNum=<%=pageNum%>">
								<td><%=bDTO.getCur_num() %></td><td><%=bDTO.getCur_type() %></td>
									<td><%=bDTO.getCur_name() %></td><td><%=bDTO.getCur_subject() %></td>
									<td><%=bDTO.getCur_content() %></td><td><img src="./upload/<%=bDTO.getCur_file()%>" width="100" height="100"></td>
									<td><%=bDTO.getCur_readcount() %></td>
							<%	
							}
						}
						%>
					</table>
					</div>  
					<jsp:include page="../include/chat.jsp" />
				</div>
				<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>
</body>
</html>