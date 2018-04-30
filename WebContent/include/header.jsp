<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header>
	<h1 class="logo">
		<a href="../Main/Main"><img src="" alt="Logo" /></a>
	</h1>
	
	<div class="mb_wrap DIV_MB_WRAP">
	
		<nav>
			<div class="inner">
				<ul>
					<li><a href="#"  id="btn-open-dialog">LOGIN</a></li>
					<li class="btn_newsletter"><a href="../book/bookSearch.jsp">통합 검색</a></li>
					<li><a href="#">도서관 서비스</a>
						<ul class="DIV_SUB_MNU">
							<li><a href="../service/serveBook.jsp">희망도서 신청</a></li>
							<!-- 희망도서 신청 페이지 -->
							<li><a href="../service/serveFacil.jsp">시설이용 신청</a></li>
							<li><a href="../service/serveQues.jsp">사서에게 물어보세요</a></li>
						</ul></li>
					<li><a href="#">게시판</a>
						<ul class="DIV_SUB_MNU">
							<li><a href="../board/boardNews.jsp">공지사항</a></li>
							<li><a href="../board/boardCu.jsp">큐레이션</a></li>
							<li><a href="../board/boardQna.jsp">QnA</a></li>
							<li><a href="../board/boardFaq.jsp">자주하는 질문</a></li>
						</ul></li>
					<li><a href="#">내 서재</a>
						<ul class="DIV_SUB_MNU">
							<li><a href="../member/memberInfo.jsp">개인정보관리</a></li>
							<li><a href="../member/myUseIndex.jsp">이용현황</a></li>
							<li></li>
						</ul></li>
					<li><a href="#">도서관 안내</a>
						<ul class="DIV_SUB_MNU">
							<li><a href="../guide/guideIntro.jsp">도서관 소개</a></li>
							<li><a href="../guide/guideMap.jsp">찾아오시는 길</a></li>
							<li><a href="../guide/guideStatis.jsp">도서관 통계</a></li>
						</ul></li>
					
					<li><a href="#">관리자 페이지</a>
						<ul class="DIV_SUB_MNU">
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul></li>
				</ul>
			</div>
		</nav>
		
		<div class="footer">
			<ul>
				<li><a href="#"><span>출판도시문화재단</span></a></li>
				<li><a href="#" class="addr" style="cursor: default;">우)10881<br />경기도 파주시 <br />회동길 145<br />상호명: <br />(재)출판도시문화재단<br />사업자등록번호: <br />128-82-08500<br />전화번호: <br />031-955-0082<br />대표자: 김언호
				</a></li>
			</ul>
		</div>
		
	</div>
	
	<div class="mb_nav">
		<a href="#" class="A_SIDE jsc_sidebar_trigger"><img src="../resource/img/ico_nav.png" alt="네비게이션 아이콘" /></a>
	</div>
	<div class="mb_nav_clo">
		<a href="#" class="A_CLOSE nav_clo"><img src="../resource/img/ico_nav_clo.png" alt="메뉴 닫기" /></a>
	</div>
	
</header>

<div id="loginDialog">
	<jsp:include page="../include/login.jsp" />
</div>

