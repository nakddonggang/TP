package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BookInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		//int book_number = Integer.parseInt(request.getParameter("book_number"));
		int book_number = 1;
		String pageNum = request.getParameter("pageNum");

		BookDAO bdao=new BookDAO();
		
		BookDTO bookList =bdao.getBookInfo(book_number);
		
		request.setAttribute("book_number", book_number);
		request.setAttribute("bookList", bookList);

		
		return null;
	}
    
}
