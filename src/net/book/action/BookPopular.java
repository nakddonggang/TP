package net.book.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BookPopular implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookPopular execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		BookDAO bkDAO = new BookDAO();
		List<BookDTO> popularList = bkDAO.popularList();
		request.setAttribute("popularList", popularList);
		
		forward.setPath("./book/bookPopul.jsp");
		forward.setRedirect(false);
		
		return forward;
	}	
}