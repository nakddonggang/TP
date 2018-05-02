package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminBookDLosInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		int book_number = Integer.parseInt(request.getParameter("book_number"));
		String pageNum = request.getParameter("pageNum");
		
		AdminDAO adao = new AdminDAO();
		BookDTO bookList = adao.getBookInfo(book_number);
		request.setAttribute("bookList", bookList);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admBookDLosInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
