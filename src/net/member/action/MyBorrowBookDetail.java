package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MyBorrowBookDetail implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int book_number = Integer.parseInt(request.getParameter("book_number"));

		
		MemberDAO mdao=new MemberDAO();
		
	
		BookDTO bookList = mdao.getBookInfo(book_number);
		String dbook_reason = bookList.getDbook_reason();
		
		request.setAttribute("bookList", bookList);
		request.setAttribute("dbook_reason", dbook_reason);
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admBookInfo.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
