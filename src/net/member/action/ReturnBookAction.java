package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class ReturnBookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReturnBookAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int book_number = Integer.parseInt(request.getParameter("book_number"));
		BookDTO bDTO = new BookDTO();
		MemberDAO mDAO = new MemberDAO();
		
		mDAO.ReturnHistoryBorrowBook(book_number);
		mDAO.ReturnBorrowBook(book_number);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BookIndex.bk");
		forward.setRedirect(true);
		return forward;
	}

}
