package net.admin.action;

import java.io.PrintWriter;

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
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
		out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
		out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
		out.print("<script src='./js/jquery-ui.min.js'></script>");
		out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function() { ");
		out.println("$.Alert('손망실 책 수정이 완료되었습니다!' , function(){"
				+ "location.href = './AdminBookDLos.am'"
				+ "});");
		out.println("});");
		out.println("</script>");
		out.close();
		
		return null;
	}
	
}