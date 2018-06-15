package net.admin.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminBookSearch implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 검색 파라미터값 가져오기
		String category1 = request.getParameter("category1");
		String search1 = request.getParameter("search1");
		String opt1 = request.getParameter("opt1");

		String category2 = request.getParameter("category2");
		String search2 = request.getParameter("search2");
		String opt2 = request.getParameter("opt2");

		String category3 = request.getParameter("category3");
		String search3 = request.getParameter("search3");
		
		String pubDate = request.getParameter("pubDate");
		
		// AdminDAO adao 객체 생성 및 count 메소드 호출
		AdminDAO adao = new AdminDAO();
		int count = 0;
		
		// pubDate에 값이 없을 때
		if (pubDate.equals("all")) {
			if (search1==""&&search2==""&&search3==""){
				count=adao.getBookCount();
			}// 값을 한 개 입력했을 때
			else if (search1!=""&&search2==""&&search3==""){
				if (category1.equals("all")){
					count = adao.getBookSearchAllCount(search1);
				} else {
					count = adao.getBookSearchCount(search1, category1);
				}
			} else if (search1==""&&search2!=""&&search3==""){
				count = adao.getBookSearchCount(search2, category2);
			} else if (search1==""&&search2==""&&search3!=""){
				count = adao.getBookSearchCount(search3, category3);
			// 값을 두 개 입력했을 때
			} else if (search1!=""&&search2!=""&&search3==""){
				if (category1.equals("all")){
					count = adao.SearchTwoAllCount(search1, opt1, category2, search2);
				} else {
					count = adao.SearchTwoCount(category1, search1, opt1, category2, search2);
				}
			} else if (search1!=""&&search2==""&&search3!=""){
				if (category1.equals("all")){
						count = adao.SearchTwoAllCount(search1, opt2, category3, search3);
				} else {
						count = adao.SearchTwoCount(category1, search1, opt2, category3, search3);
				}
			} else if (search1==""&&search2!=""&&search3!=""){
				count = adao.SearchTwoCount(category2, search2, opt2, category3, search3);
			// 값을 모두 입력했을 때
			} else if (search1!=""&&search2!=""&&search3!=""){
				if (category1.equals("all")){
					count = adao.SearchThrAllCount(search1, opt1, category2, search2, opt2, category3, search3);
				} else {
					count = adao.SearchThrCount(category1, search1, opt1, category2, search2, opt2, category3, search3);
				}
			} else { System.out.println("값을 입력받지 못함");}
		// pubDate에 값이 있을 때
		} else {
			// 값을 아무것도 입력하지 않았을 때
			if (search1==""&&search2==""&&search3==""){
				count=adao.getDateAllCount(pubDate);
			// 값을 한 개 입력했을 때
			} else if (search1!=""&&search2==""&&search3==""){
				if (category1.equals("all")){
					count = adao.getBookDateSearchAllCount(search1, pubDate);
					System.out.println("값");
				} else {
					count = adao.getBookDateSearchCount(search1, category1, pubDate);
				}
			} else if (search1==""&&search2!=""&&search3==""){
				count = adao.getBookDateSearchCount(search2, category2, pubDate);
			} else if (search1==""&&search2==""&&search3!=""){
				count = adao.getBookDateSearchCount(search3, category3, pubDate);
			// 값을 두 개 입력했을 때
			} else if (search1!=""&&search2!=""&&search3==""){
				if (category1.equals("all")){
					count = adao.SearchDateTwoAllCount(search1, opt1, category2, search2, pubDate);
				} else {
					count = adao.SearchDateTwoCount(category1, search1, opt1, category2, search2, pubDate);
				}
			} else if (search1!=""&&search2==""&&search3!=""){
				if (category1.equals("all")){
						count = adao.SearchDateTwoAllCount(search1, opt2, category3, search3, pubDate);
				} else {
						count = adao.SearchDateTwoCount(category1, search1, opt2, category3, search3, pubDate);
				}
			} else if (search1==""&&search2!=""&&search3!=""){
				count = adao.SearchDateTwoCount(category2, search2, opt2, category3, search3, pubDate);
			// 값을 모두 입력했을 때
			} else if (search1!=""&&search2!=""&&search3!=""){
				if (category1.equals("all")){
					count = adao.SearchDateThrAllCount(search1, opt1, category2, search2, opt2, category3, search3, pubDate);
				} else {
					count = adao.SearchDateThrCount(category1, search1, opt1, category2, search2, opt2, category3, search3, pubDate);
				}
			} else { System.out.println("값을 입력받지 못함");}		
		}
		
		// 한 화면에 보여줄 책의 개수 설정
		int pageSize = 8;		
		
		// 페이지 번호 (PageNum)
		String pageNum = request.getParameter("pageNum");
			// 페이지 번호 없으면 무조건 "1" 페이지 설정
		if (pageNum==null)
			pageNum="1";
		
		// 10개씩 게시판 글을 분류했을 때,
		int currentPage = Integer.parseInt(pageNum);
		// 첫 번째 페이지 첫행 구하기
			// 1page - 1 / 2page - 11 / 3page - 21
		int startRow = (currentPage-1)* pageSize+1;
		// 페이지 마지막행 구하기
			// 1page - 10 / 2page - 20 / 3page - 30
		int endRow = pageSize*currentPage;
		
		// 책 뿌려주는 메소드 생성
		List<BookDTO> booksearchList = null;
		System.out.println(count);
			if (count!=0) {
				// pubDate에 값이 없을 때
				if (pubDate.equals("all")) {
					// 값을 아무것도 입력하지 않았을 때
					if (search1==""&&search2==""&&search3==""){
						booksearchList=adao.getBookList(startRow, pageSize);
					// 값을 한 개 입력했을 때
					} else if  (search1!=""&&search2==""&&search3==""){
						if (category1.equals("all")){
							booksearchList = adao.getBookSearchAllList(startRow, pageSize, search1);
						} else {
							booksearchList = adao.getBookSearchList(startRow, pageSize, search1, category1);
						}
					} else if (search1==""&&search2!=""&&search3==""){
						booksearchList = adao.getBookSearchList(startRow, pageSize, search2, category2);
					} else if (search1==""&&search2==""&&search3!=""){
						booksearchList = adao.getBookSearchList(startRow, pageSize, search3, category3);
					// 값을 두 개 입력했을 때
					} else if (search1!=""&&search2!=""&&search3==""){
						if (category1.equals("all")){
							booksearchList = adao.SearchTwoAllList(search1, opt1, category2, search2, startRow, pageSize);
						} else {
							booksearchList = adao.SearchTwoList(category1, search1, opt1, category2, search2, startRow, pageSize);
						}
					} else if (search1!=""&&search2==""&&search3!=""){
						if (category1.equals("all")){
							booksearchList = adao.SearchTwoAllList(search1, opt2, category3, search3, startRow, pageSize);
						} else {
							booksearchList = adao.SearchTwoList(category1, search1, opt2, category3, search3, startRow, pageSize);
						}
					} else if (search1==""&&search2!=""&&search3!=""){
						booksearchList = adao.SearchTwoList(category2, search2, opt2, category3, search3, startRow, pageSize);
						// 값을 모두 입력했을 때
					} else if (search1!=""&&search2!=""&&search3!=""){
						if (category1.equals("all")){
							booksearchList = adao.SearchThrAllList(search1, opt1, category2, search2, opt2, category3, search3, startRow, pageSize);
						} else {
							booksearchList = adao.SearchThrList(category1, search1, opt1, category2, search2, opt2, category3, search3, startRow, pageSize);
						}
					} else { System.out.println("값을 입력받지 못함"); }
				// pubDate에 값이 있을 때
				} else {
					// 값을 아무것도 입력하지 않았을 떄
					if (search1==""&&search2==""&&search3==""){
						booksearchList=adao.getDateAllList(startRow, pageSize, pubDate);
					// 값을 한 개 입력했을 때
					} else if (search1!=""&&search2==""&&search3==""){
						if (category1.equals("all")){
							booksearchList = adao.getBookDateSearchAllList(startRow, pageSize, search1, pubDate);
						} else {
							booksearchList = adao.getBookDateSearchList(startRow, pageSize, search1, category1, pubDate);
						}
					} else if (search1==""&&search2!=""&&search3==""){
						booksearchList = adao.getBookDateSearchList(startRow, pageSize, search2, category2, pubDate);
					} else if (search1==""&&search2==""&&search3!=""){
						booksearchList = adao.getBookDateSearchList(startRow, pageSize, search3, category3, pubDate);
					// 값을 두 개 입력했을 때
					} else if (search1!=""&&search2!=""&&search3==""){
						if (category1.equals("all")){
							booksearchList = adao.SearchDateTwoAllList(search1, opt1, category2, search2, startRow, pageSize, pubDate);
						} else {
							booksearchList = adao.SearchDateTwoList(category1, search1, opt1, category2, search2, startRow, pageSize, pubDate);
						}
					} else if (search1!=""&&search2==""&&search3!=""){
						if (category1.equals("all")){
							booksearchList = adao.SearchDateTwoAllList(search1, opt2, category3, search3, startRow, pageSize, pubDate);
						} else {
							booksearchList = adao.SearchDateTwoList(category1, search1, opt2, category3, search3, startRow, pageSize, pubDate);
						}
					} else if (search1==""&&search2!=""&&search3!=""){
						booksearchList = adao.SearchDateTwoList(category2, search2, opt2, category3, search3, startRow, pageSize, pubDate);
					// 값을 모두 입력했을 때
					} else if (search1!=""&&search2!=""&&search3!=""){
						if (category1.equals("all")){
							booksearchList = adao.SearchDateThrAllList(search1, opt1, category2, search2, opt2, category3, search3, startRow, pageSize, pubDate);
						} else {
							booksearchList = adao.SearchDateThrList(category1, search1, opt1, category2, search2, opt2, category3, search3, startRow, pageSize, pubDate);
						}
					} else { System.out.println("값을 입력받지 못함");}
				}
		} else { System.out.println("count==0"); }
		// 게시판 전체 페이지 수
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		// 한 화면에 보여줄 페이지수 설정
		int pageBlock = 5;
		// 시작하는 페이지 번호 구하기
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		// 끝나는 페이지 번호 구하기
		int endPage = startPage+pageBlock-1;
		// 끝나는 페이지보다 전체페이지의 수가 작은 경우 if 문을 이용하여 제어해주기
		if (endPage>pageCount){
			endPage=pageCount;
		}	
		
		// count, pageNum, boardList, pageCount, pageBlock, startPage, endPage 저장
		request.setAttribute("count", count);
		request.setAttribute("search1", search1);
		System.out.println("확인 : "+search1);
		request.setAttribute("search2", search2);
		request.setAttribute("search3", search3);
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("category3", category3);
		request.setAttribute("opt1", opt1);
		request.setAttribute("opt2", opt2);
		request.setAttribute("pubDate", pubDate);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("booksearchList", booksearchList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);	
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admBookIndexSearch.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
