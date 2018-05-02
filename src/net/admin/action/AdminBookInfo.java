package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminBookInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// int book_number, String pageNum 파라미터 값 가져오기
		int book_number = Integer.parseInt(request.getParameter("book_number"));
		String pageNum = request.getParameter("pageNum");

		// AdminDAO 객체 생성
		AdminDAO adao = new AdminDAO();
		
		// BookDTO 객체 생성
		BookDTO bookList = adao.getBookInfo(book_number);
		String dbook_reason = bookList.getDbook_reason();
		
		request.setAttribute("bookList", bookList);
		request.setAttribute("dbook_reason", dbook_reason);
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admBookInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
