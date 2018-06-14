package net.book.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.db.AdminDAO;
import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BookSearch implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		 
		// String sort 파라미터값 가져오기
//		String sort = request.getParameter("sort");
//		System.out.println("정렬해야할 값"+sort);
//		if (sort==null) sort="book_number";
		
//		String view = request.getParameter("view");
//		System.out.println(view);
//		if (view==null) view="1";
		
		// 검색 파라미터값 가져오기
		String category1 = request.getParameter("category1");
		System.out.println(category1);
		String search1 = request.getParameter("search1");
		System.out.println(search1);
		String opt1 = request.getParameter("opt1");
		System.out.println(opt1);

		String category2 = request.getParameter("category2");
		System.out.println(category2);
		String search2 = request.getParameter("search2");
		System.out.println(search2);
		String opt2 = request.getParameter("opt2");
		System.out.println(opt2);

		String category3 = request.getParameter("category3");
		System.out.println(category3);
		String search3 = request.getParameter("search3");
		System.out.println(search3);
		
		String pubDate = request.getParameter("pubDate");
		System.out.println(pubDate);
		
		// AdminDAO adao 객체 생성 및 count 메소드 호출
		BookDAO bdao = new BookDAO();
		int count = 0;

//		HttpSession session = request.getSession();
//		String member_id = (String)session.getAttribute("member_id");
//		int BorrowCheck;
//		if(member_id != null) {
//			BorrowCheck = bdao.userBorrowBookCheck(member_id);
//		} else { BorrowCheck=0;}
		
		
		// pubDate에 값이 없을 때
		if (pubDate.equals("all")) {
			// 값을 아무것도 입력하지 않았을 때
			if (search1==""&&search2==""&&search3==""){
				count=bdao.BookCount();
			// 값을 한 개 입력했을 때
			} else if (search1!=""&&search2==""&&search3==""){
				if (category1.equals("all")){
					count = bdao.Bk_SearchAllCount(search1);
				} else {
					count = bdao.Bk_SearchCount(search1, category1);
				}
			} else if (search1==""&&search2!=""&&search3==""){
				count = bdao.Bk_SearchCount(search2, category2);
			} else if (search1==""&&search2==""&&search3!=""){
				count = bdao.Bk_SearchCount(search3, category3);
			// 값을 두 개 입력했을 때
			} else if (search1!=""&&search2!=""&&search3==""){
				if (category1.equals("all")){
					count = bdao.Bk_SearchTwoAllCount(search1, opt1, category2, search2);
				} else {
					count = bdao.Bk_SearchTwoCount(category1, search1, opt1, category2, search2);
				}
			} else if (search1!=""&&search2==""&&search3!=""){
				if (category1.equals("all")){
						count = bdao.Bk_SearchTwoAllCount(search1, opt2, category3, search3);
				} else {
						count = bdao.Bk_SearchTwoCount(category1, search1, opt2, category3, search3);
				}
			} else if (search1==""&&search2!=""&&search3!=""){
				count = bdao.Bk_SearchTwoCount(category2, search2, opt2, category3, search3);
			// 값을 모두 입력했을 때
			} else if (search1!=""&&search2!=""&&search3!=""){
				if (category1.equals("all")){
					count = bdao.Bk_SearchThrAllCount(search1, opt1, category2, search2, opt2, category3, search3);
				} else {
					count = bdao.Bk_SearchThrCount(category1, search1, opt1, category2, search2, opt2, category3, search3);
				}
			} else { System.out.println("값을 입력받지 못함");}
		// pubDate에 값이 있을 때
		} else {
			// 값을 아무것도 입력하지 않았을 때
			if (search1==""&&search2==""&&search3==""){
				count=bdao.Bk_DateAllCount(pubDate);
			// 값을 한 개 입력했을 때
			} else if (search1!=""&&search2==""&&search3==""){
				if (category1.equals("all")){
					count = bdao.Bk_DateSearchAllCount(search1, pubDate);
					System.out.println("값");
				} else {
					count = bdao.Bk_DateSearchCount(search1, category1, pubDate);
				}
			} else if (search1==""&&search2!=""&&search3==""){
				count = bdao.Bk_DateSearchCount(search2, category2, pubDate);
			} else if (search1==""&&search2==""&&search3!=""){
				count = bdao.Bk_DateSearchCount(search3, category3, pubDate);
			// 값을 두 개 입력했을 때
			} else if (search1!=""&&search2!=""&&search3==""){
				if (category1.equals("all")){
					count = bdao.Bk_DateSearchTwoAllCount(search1, opt1, category2, search2, pubDate);
				} else {
					count = bdao.Bk_DateSearchTwoCount(category1, search1, opt1, category2, search2, pubDate);
				}
			} else if (search1!=""&&search2==""&&search3!=""){
				if (category1.equals("all")){
						count = bdao.Bk_DateSearchTwoAllCount(search1, opt2, category3, search3, pubDate);
				} else {
						count = bdao.Bk_DateSearchTwoCount(category1, search1, opt2, category3, search3, pubDate);
				}
			} else if (search1==""&&search2!=""&&search3!=""){
				count = bdao.Bk_DateSearchTwoCount(category2, search2, opt2, category3, search3, pubDate);
			// 값을 모두 입력했을 때
			} else if (search1!=""&&search2!=""&&search3!=""){
				if (category1.equals("all")){
					count = bdao.Bk_DateSearchThrAllCount(search1, opt1, category2, search2, opt2, category3, search3, pubDate);
				} else {
					count =bdao.Bk_DateSearchThrCount(category1, search1, opt1, category2, search2, opt2, category3, search3, pubDate);
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
						booksearchList=bdao.BookList(startRow, pageSize);
					// 값을 한 개 입력했을 때
					} else if (search1!=""&&search2==""&&search3==""){
						if (category1.equals("all")){
							booksearchList = bdao.Bk_SearchAllList(startRow, pageSize, search1);
						} else {
							booksearchList = bdao.Bk_SearchList(startRow, pageSize, search1, category1);
						}
					} else if (search1==""&&search2!=""&&search3==""){
						booksearchList = bdao.Bk_SearchList(startRow, pageSize, search2, category2);
					} else if (search1==""&&search2==""&&search3!=""){
						booksearchList = bdao.Bk_SearchList(startRow, pageSize, search3, category3);
					// 값을 두 개 입력했을 때
					} else if (search1!=""&&search2!=""&&search3==""){
						if (category1.equals("all")){
							booksearchList = bdao.Bk_SearchTwoAllList(search1, opt1, category2, search2, startRow, pageSize);
						} else {
							booksearchList =bdao.Bk_SearchTwoList(category1, search1, opt1, category2, search2, startRow, pageSize);
						}
					} else if (search1!=""&&search2==""&&search3!=""){
						if (category1.equals("all")){
							booksearchList = bdao.Bk_SearchTwoAllList(search1, opt2, category3, search3, startRow, pageSize);
						} else {
							booksearchList = bdao.Bk_SearchTwoList(category1, search1, opt2, category3, search3, startRow, pageSize);
						}
					} else if (search1==""&&search2!=""&&search3!=""){
						booksearchList = bdao.Bk_SearchTwoList(category2, search2, opt2, category3, search3, startRow, pageSize);
						// 값을 모두 입력했을 때
					} else if (search1!=""&&search2!=""&&search3!=""){
						if (category1.equals("all")){
							booksearchList = bdao.Bk_SearchThrAllList(search1, opt1, category2, search2, opt2, category3, search3, startRow, pageSize);
						} else {
							booksearchList = bdao.Bk_SearchThrList(category1, search1, opt1, category2, search2, opt2, category3, search3, startRow, pageSize);
						}
					} else { System.out.println("값을 입력받지 못함"); }
				// pubDate에 값이 있을 때
				} else {
					// 값을 아무것도 입력하지 않았을 떄
					if (search1==""&&search2==""&&search3==""){
						booksearchList=bdao.Bk_DateAllList(startRow, pageSize, pubDate);
					// 값을 한 개 입력했을 때
					} else if (search1!=""&&search2==""&&search3==""){
						if (category1.equals("all")){
							booksearchList = bdao.Bk_DateSearchAllList(startRow, pageSize, search1, pubDate);
						} else {
							booksearchList = bdao.Bk_DateSearchList(startRow, pageSize, search1, category1, pubDate);
						}
					} else if (search1==""&&search2!=""&&search3==""){
						booksearchList = bdao.Bk_DateSearchList(startRow, pageSize, search2, category2, pubDate);
					} else if (search1==""&&search2==""&&search3!=""){
						booksearchList = bdao.Bk_DateSearchList(startRow, pageSize, search3, category3, pubDate);
					// 값을 두 개 입력했을 때
					} else if (search1!=""&&search2!=""&&search3==""){
						if (category1.equals("all")){
							booksearchList = bdao.Bk_DateSearchTwoAllList(search1, opt1, category2, search2, startRow, pageSize, pubDate);
						} else {
							booksearchList = bdao.Bk_DateSearchTwoList(category1, search1, opt1, category2, search2, startRow, pageSize, pubDate);
						}
					} else if (search1!=""&&search2==""&&search3!=""){
						if (category1.equals("all")){
							booksearchList = bdao.Bk_DateSearchTwoAllList(search1, opt2, category3, search3, startRow, pageSize, pubDate);
						} else {
							booksearchList = bdao.Bk_DateSearchTwoList(category1, search1, opt2, category3, search3, startRow, pageSize, pubDate);
						}
					} else if (search1==""&&search2!=""&&search3!=""){
						booksearchList = bdao.Bk_DateSearchTwoList(category2, search2, opt2, category3, search3, startRow, pageSize, pubDate);
					// 값을 모두 입력했을 때
					} else if (search1!=""&&search2!=""&&search3!=""){
						if (category1.equals("all")){
							booksearchList = bdao.Bk_DateSearchThrAllList(search1, opt1, category2, search2, opt2, category3, search3, startRow, pageSize, pubDate);
						} else {
							booksearchList = bdao.Bk_DateSearchThrList(category1, search1, opt1, category2, search2, opt2, category3, search3, startRow, pageSize, pubDate);
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
//		request.setAttribute("view", view);			
//		request.setAttribute("sort", sort);			
//		request.setAttribute("BorrowCheck", BorrowCheck);		
				
				ActionForward forward = new ActionForward();
				forward.setPath("./book/bookSearch.jsp");
				forward.setRedirect(false);
				return forward;
	}
     
}
