<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.book.db.BookDTO"%>
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
<title>혜윰나래::</title>
<link href="<c:url value="/css/jquery.fullpage.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/jquery.toast.min.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="/css/import.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/main.css"/>" rel="stylesheet" type="text/css">
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<c:url value="/js/morris.min.js"/>"></script>
<script src="<c:url value="/js/raphael.min.js"/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
	<script type="text/javascript">
	 $(document).ready(function(){

		 var selected = $('#h_month').val();
		   $.ajax({
			   url:"./GuideStatisAjax.fp",
			   type:'post',
			   data:{'selected':selected},
			   dataType:'json',
			   success:function(result){
				   var jsonData = JSON.parse("["+result+"]");
				   selected = $('#h_month').val();
		   		
		   		
// 	 Morris.Bar({
// 			element: 'visit',
// 			data: [
// 				{ y: jsonData[0].month+"월", a: jsonData[0].count},
// 				{ y: jsonData[1].month+"월", a: jsonData[1].count},
// 				{ y: jsonData[2].month+"월", a: jsonData[2].count},
// 				{ y: jsonData[3].month+"월", a: jsonData[3].count},
// 				{ y: jsonData[4].month+"월", a: jsonData[4].count},
// 				{ y: jsonData[5].month+"월", a: jsonData[5].count},
// 				{ y: jsonData[6].month+"월", a: jsonData[6].count},
// 				{ y: jsonData[7].month+"월", a: jsonData[7].count},
// 				{ y: jsonData[8].month+"월", a: jsonData[8].count},
// 				{ y: jsonData[9].month+"월", a: jsonData[9].count},
// 				{ y: jsonData[10].month+"월", a: jsonData[10].count},
// 				{ y: jsonData[11].month+"월", a: jsonData[11].count}
				
// 			],
// 			xkey: 'y',
// 			ykeys: ['a'],
// 			labels: ['방문자 수'],		 
// 	      hideHover: 'auto',
// 	      behaveLikeLine: true,
// 	      resize: true,
// 	      barColors:['gray']
// 		});
	   Morris.Bar({
			element: 'book',
			data: [
				{ y: jsonData[12].month1+"월", a: jsonData[12].count1},
				{ y: jsonData[13].month1+"월", a: jsonData[13].count1},
				{ y: jsonData[14].month1+"월", a: jsonData[14].count1},
				{ y: jsonData[15].month1+"월", a: jsonData[15].count1},
				{ y: jsonData[16].month1+"월", a: jsonData[16].count1},
				{ y: jsonData[17].month1+"월", a: jsonData[17].count1},
				{ y: jsonData[18].month1+"월", a: jsonData[18].count1},
				{ y: jsonData[19].month1+"월", a: jsonData[19].count1},
				{ y: jsonData[20].month1+"월", a: jsonData[20].count1},
				{ y: jsonData[21].month1+"월", a: jsonData[21].count1},
				{ y: jsonData[22].month1+"월", a: jsonData[22].count1},
				{ y: jsonData[23].month1+"월", a: jsonData[23].count1}
				
			],
			xkey: 'y',
			ykeys: ['a'],
			labels: ['입고 수'],
		      hideHover: 'always',
		      behaveLikeLine: true,
		      resize: true,
		      barColors:['gray']
		});
	   Morris.Bar({
			element: 'bbook',
			data: [
				{ y: jsonData[24].month2+"월", a: jsonData[24].count2},
				{ y: jsonData[25].month2+"월", a: jsonData[25].count2},
				{ y: jsonData[26].month2+"월", a: jsonData[26].count2},
				{ y: jsonData[27].month2+"월", a: jsonData[27].count2},
				{ y: jsonData[28].month2+"월", a: jsonData[28].count2},
				{ y: jsonData[29].month2+"월", a: jsonData[29].count2},
				{ y: jsonData[30].month2+"월", a: jsonData[30].count2},
				{ y: jsonData[31].month2+"월", a: jsonData[31].count2},
				{ y: jsonData[32].month2+"월", a: jsonData[32].count2},
				{ y: jsonData[33].month2+"월", a: jsonData[33].count2},
				{ y: jsonData[34].month2+"월", a: jsonData[34].count2},
				{ y: jsonData[35].month2+"월", a: jsonData[35].count2}	
			],
			xkey: 'y',
			ykeys: ['a'],
			labels: ['대출 수'],					
		      hideHover: 'always',
		      behaveLikeLine: true,
		      resize: true,
		      barColors:['gray']
		});
	   
			   }//success 끝
	  			 
  			});
	   selectBox();
		});	
	   
	</script>
</head>
<%
request.setCharacterEncoding("UTF-8");
List<BoardDTO> noticeList = (List<BoardDTO>)request.getAttribute("noticeList");
List<BoardDTO> curationList = (List<BoardDTO>)request.getAttribute("curationList");
List<BookDTO> popularList = (List<BookDTO>)request.getAttribute("popularList");
String member_id = (String)session.getAttribute("member_id");
if(member_id != null) {
	boolean admincheck = (boolean)session.getAttribute("admincheck");
} else {
	session.removeAttribute("admincheck");
}

SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
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
				<div class="box_wrap">
			<!-- 	인기도서	 -->
				<div class="main_conpop main_div">
				<div class="main_box">
					 <h2>Popular Book</h2>
					<%
					if(popularList==null){
						%><ul><li>게시물이 없습니다.</li></ul><%
					}else{
						for(int i=0; i<popularList.size(); i++){ 
						BookDTO bkDTO = popularList.get(i);
						%>
						<ul class="main_lst1 w3-content w3-display-container" id="book_pic_div" >	
							<li class="mySlides" onclick="location.href='./BookInfo.bk?book_number=<%=bkDTO.getBook_number()%>'">
							<img src="./upload/book/<%=bkDTO.getBook_file()%>"width="200px" height="260px" class="main_lst_img" >
								<span id='bk_li_subs'><%=bkDTO.getBook_subject() %></span>
								<dl class='book_info_layer'>
									<dt>
										<span><%=bkDTO.getBook_subject() %></span>
									</dt>
									<dd>
										<dl>
											<dt>저자</dt><dd><%=bkDTO.getBook_author() %></dd>
											<dt>출판사</dt><dd><%=bkDTO.getBook_publisher() %></dd>
											<dt>출판년도</dt><dd><%=date.format(bkDTO.getBook_pubDate())%></dd>
										</dl>
									</dd>
								</dl>
									
							</li>
							<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  							<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
						</ul>
								<%
						}}
					%>	
				
					</div>	
				</div>
					
 			
 			
		
			<!-- 큐레이션 -->
					<div class="main_concur main_div">
					<div class="main_box">
					 <h2>Curation</h2>
					<ul>
						<%
						if(curationList==null){
							%><li>게시물이 없습니다.</li><%
						}else{ 
							for(int i=0; i<curationList.size(); i++){
								BoardDTO bDTO = curationList.get(i);
							%>
								<li onclick="location.href='./BoardCurContent.cu?cur_num=<%=bDTO.getCur_num()%>&pageNum=1'">
								  <div class="main_box_img">
								  	<img src="./upload/curation/<%=bDTO.getCur_file()%>" width="100" height="100">
								  </div>
								  <div class="main_box_tit">
								  <p class=tit><%=bDTO.getCur_subject() %></p>
								  <p class=disc><%=bDTO.getCur_content() %></p>
								  </div>
							    </li>	
							<%	
							}
						}
						%>
					</ul>
					</div>
					</div> 	
			<!-- 	공지사항		 -->
					<div class="main_connot main_div">
					<div class="main_box">
						<h2>Notice</h2>
						<!-- 글목록 -->
							<ul>
							<%
								if(noticeList==null){	%><li class="col_tit"><p>게시글이 없습니다</p></li><%	}
								else{
									for(int i=0; i<noticeList.size(); i++){
										BoardDTO bDTO = noticeList.get(i);	//제너릭 사용해서 형변환 할 필요없음
									%>
								
									<li>
									 <a href="./BoardNoticeList.no?pageNum=1">
										<p class="tit"><%=bDTO.getNotice_type() %> <%=bDTO.getNotice_subject() %></p>
									    <span class="date"><%=date.format(bDTO.getNotice_date())%></span>
									</a>	
									</li>
									<%	}	%>
								<%	}	%>
							</ul>
						</div>
					</div>
					 
					 <!--  통계   -->
					 <div class="main_consta main_div" onclick="location.href='./GuideStatis.fp'">
						 <div class="main_box">
						 <h2>Statis</h2>
						 
<!-- 						 <div style="padding: 0 20px;"> -->
<!-- 							<p>방문자 수</p> -->
<!-- 							<div id="visit" style="width: 400px; height: 150px;"></div> -->
<!-- 						 </div>	 -->
								
						 <div id="sta_size">
							<p class="tit">장서 입고수</p>
							<div id="book"></div>
						 </div>
						
						 <div id="sta_size">
							<p class="tit">대출 수</p>
							<div id="bbook"></div>
						 </div>

					 	</div>
					 	<input type="hidden" value="month" id="h_month">
					 </div>
					 
					 
					 
					 </div>
				</div>
				<!-- //메인 페이지-->
				</article>
				
			</section>
		</div>
		<!-- //본문 컨테이너 -->
	</div>

</body>
</html>