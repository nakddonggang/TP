package net.member.action;

import java.io.PrintWriter;

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
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
		out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
		out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
		out.print("<script src='./js/jquery-ui.min.js'></script>");
		out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function() { ");
		out.println("$.Alert('반납됨' , function(){"
				+ "location.href = './MemberUseIndex.me'"
				+ "});");
		out.println("});");
		out.println("</script>");
		out.close();

		return null;
	}

}
