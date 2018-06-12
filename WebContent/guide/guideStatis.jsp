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
<script src="<c:url value="/js/morris.min.js"/>"></script>
<script src="<c:url value="/js/raphael.min.js"/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

  <script type="text/javascript">
   $(document).ready(function(){
	   var selected = "";
	  
	   $("#month").click(function(){
			var selected = $('#h_month').val();

		   $.ajax({
			   url:"./GuideStatisAjax.fp",
			   type:'post',
			   data:{'selected':selected},
			   dataType:'json',
			   success:function(result){
				   var jsonData = JSON.parse("["+result+"]");
				   selected = $('#h_month').val();
// 				   alert(selected);
// 				   alert(result);
					   
// 				   alert("월별 시작")
				$('#visit').empty();
				$('#book').empty();
				$('#bbook').empty();
				   Morris.Bar({
						element: 'visit',
						data: [
							{ y: jsonData[0].month+"월", a: jsonData[0].count},
							{ y: jsonData[1].month+"월", a: jsonData[1].count},
							{ y: jsonData[2].month+"월", a: jsonData[2].count},
							{ y: jsonData[3].month+"월", a: jsonData[3].count},
							{ y: jsonData[4].month+"월", a: jsonData[4].count},
							{ y: jsonData[5].month+"월", a: jsonData[5].count},
							{ y: jsonData[6].month+"월", a: jsonData[6].count},
							{ y: jsonData[7].month+"월", a: jsonData[7].count},
							{ y: jsonData[8].month+"월", a: jsonData[8].count},
							{ y: jsonData[9].month+"월", a: jsonData[9].count},
							{ y: jsonData[10].month+"월", a: jsonData[10].count},
							{ y: jsonData[11].month+"월", a: jsonData[11].count}
							
						],
						xkey: 'y',
						ykeys: ['a'],
						labels: ['방문자 수'],		 
				      hideHover: 'auto',
				      behaveLikeLine: true,
				      resize: true,
				      barColors:['gray']
					});
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
					      hideHover: 'auto',
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
					      hideHover: 'auto',
					      behaveLikeLine: true,
					      resize: true,
					      barColors:['gray']
					});
			   }
		   });
		   selectBox();
		   
		});
	   
  
				  
   $("#year").click(function(){
		var selected = $('#h_year').val();

	   $.ajax({
		   url:"./GuideStatisAjax.fp",
		   type:'post',
		   data:{'selected':selected},
		   dataType:'json',
		   success:function(result){
			   var jsonData = JSON.parse("["+result+"]");
			   selected = $('#h_year').val();
// 			   alert(selected);
// 			   alert(result);
					   
// 					   alert("년별 시작")
				$('#visit').empty();
				$('#book').empty();
				$('#bbook').empty();
					  new Morris.Line({
							element: 'visit',
							data: [
								{ y: jsonData[0].year+"년", a: jsonData[0].count},
								{ y: jsonData[1].year+"년", a: jsonData[1].count},
								{ y: jsonData[2].year+"년", a: jsonData[2].count},
								{ y: jsonData[3].year+"년", a: jsonData[3].count},
								{ y: jsonData[4].year+"년", a: jsonData[4].count}	
							],
							xkey: 'y',
							ykeys: ['a'],
							labels: ['방문자 수'],
							  fillOpacity: 0.6,
						      hideHover: 'auto',
						      behaveLikeLine: true,
						      resize: true,
						      pointFillColors:['#ffffff'],
						      pointStrokeColors: ['black'],
						      lineColors:['gray']
						});  
					   new Morris.Line({
							element: 'book',
							data: [
								{ y: jsonData[5].year1+"년", a: jsonData[5].count1},
								{ y: jsonData[6].year1+"년", a: jsonData[6].count1},
								{ y: jsonData[7].year1+"년", a: jsonData[7].count1},
								{ y: jsonData[8].year1+"년", a: jsonData[8].count1},
								{ y: jsonData[9].year1+"년", a: jsonData[9].count1}
								
							],
							xkey: 'y',
							ykeys: ['a'],
							labels: ['입고 수'],
							  fillOpacity: 0.6,
						      hideHover: 'auto',
						      behaveLikeLine: true,
						      resize: true,
						      pointFillColors:['#ffffff'],
						      pointStrokeColors: ['black'],
						      lineColors:['gray']
						});
					  new Morris.Line({
							element: 'bbook',
							data: [
								{ y: jsonData[10].year2+"년", a: jsonData[10].count2},
								{ y: jsonData[11].year2+"년", a: jsonData[11].count2},
								{ y: jsonData[12].year2+"년", a: jsonData[12].count2},
								{ y: jsonData[13].year2+"년", a: jsonData[13].count2},
								{ y: jsonData[14].year2+"년", a: jsonData[14].count2}
								
							],
							xkey: 'y',
							ykeys: ['a'],
							labels: ['대출 수'],
					  fillOpacity: 0.6,
				      hideHover: 'auto',
				      behaveLikeLine: true,
				      resize: true,
				      pointFillColors:['#ffffff'],
				      pointStrokeColors: ['black'],
				      lineColors:['gray']
						});


			   }//success 끝
  			 
   			});
	   selectBox();
		});	
   
   });
  </script>
</head>
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
				<div class="board">
				<h3>혜윰누리 통계</h3>
				<input type="button" value="연도별"  id="year" class="btn_type6">
				<input type="button" value="월별"  id="month" class="btn_type6">
				<input type="hidden" value="year" id="h_year">
				<input type="hidden" value="month" id="h_month">
					<div>
						<h5>방문자 수</h5>
						<div id="visit">
						
						</div>
					</div>
					<div>
						<h5>책 입고수</h5>
						<div id="book">
						
						</div>
					</div>
					<div>
						<h5>대출 수</h5>
						<div id="bbook">
						
						</div>
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