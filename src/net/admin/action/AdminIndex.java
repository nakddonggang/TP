package net.admin.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminIndex implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// AdminDAO 객체생성 및 total 책의 개수 가져오기
		AdminDAO adao = new AdminDAO();
		int count = adao.getBookCount();
		
		// 한 화면에 보여줄 책의 개수 설정
		int pageSize = 5;		
		
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
		
		// 입출력
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 책 뿌려주는 메소드 생성
		List<BookDTO> bookList = null;
		if (count!=0) {
			bookList=adao.getBookList(startRow, pageSize);
		} else {
			System.out.println("책 목록이 없습니다");
		}

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
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bookList", bookList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admBookIndex.jsp");
		forward.setRedirect(false);
		return forward;
		
	}
	
}
