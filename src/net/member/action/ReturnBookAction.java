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
		
		String[] book_numbers = request.getParameterValues("returnBookCheckBox");
		int book_number = 0;
		BookDTO bDTO = new BookDTO();
		MemberDAO mDAO = new MemberDAO();
		
		for(int i=0; i<book_numbers.length; i++) {
			book_number = Integer.parseInt(book_numbers[i]);
			mDAO.ReturnHistoryBorrowBook(book_number);
			mDAO.ReturnBorrowBook(book_number);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberUseIndex.me");
		forward.setRedirect(true);
		return forward;
	}

}
