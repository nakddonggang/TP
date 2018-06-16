package net.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminBookDLosWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		int book_number = Integer.parseInt(request.getParameter("book_number"));
		
		// BookDTO 객체생성 및 파라미터값 담기
		BookDTO bookdto = new BookDTO();
		bookdto.setBook_number(book_number);
		bookdto.setDbook_reason(request.getParameter("dbook_reason"));
		bookdto.setDbook_state(request.getParameter("dbook_state"));
		
		// AdminDAO 객체 생성 및 insert 메소드 불러오기
		AdminDAO adao = new AdminDAO();
		int result = adao.insertDBook(bookdto);
		if(result ==0){
			System.out.println("Fail");
			return null;
		} else {
			request.setCharacterEncoding("utf-8");		
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
			out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
			out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
			out.print("<script src='./js/jquery-ui.min.js'></script>");
			out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function() { ");
			out.println("$.Alert('손망실 등록이 완료되었습니다' , function(){"
					+ "location.href = './AdminIndex.am'"
					+ "});");
			out.println("});");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		
	}
	
}
