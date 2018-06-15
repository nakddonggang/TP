package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminBookDLosReWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		// int book_number, String pageNum 파라미터 값 가져오기
		BookDTO bdto = new BookDTO();
		int book_number = Integer.parseInt(request.getParameter("book_number"));
		String dbook_reason=request.getParameter("dbook_reason");
		String dbook_state=request.getParameter("dbook_state");
		
		bdto.setBook_number(book_number);
		bdto.setDbook_reason(dbook_reason);
		bdto.setDbook_state(dbook_state);
		
		AdminDAO adao = new AdminDAO();
		adao.DLosReWrite(bdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminBookDLos.am");
		forward.setRedirect(true);
		return forward;
	}
	
}