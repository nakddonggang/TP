package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class ADminHBookDelete implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		int book_number = Integer.parseInt(request.getParameter("book_number"));
		AdminDAO adao = new AdminDAO();
		adao.HBookDelete(book_number);
		
		ActionForward forward = new ActionForward();
//		forward.setPath("./AdminBookDLos.am");
		forward.setRedirect(true);
		return forward;
	}
	
}
