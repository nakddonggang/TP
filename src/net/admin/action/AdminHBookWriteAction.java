package net.admin.action;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminHBookWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 파라미터값 들고오기
		String member_id = request.getParameter("member_id");
		String hbook_check = request.getParameter("hbook_check");
		String hbook_author = request.getParameter("hbook_author");
		String hbook_subject = request.getParameter("hbook_subject");
		String hbook_isbn = request.getParameter("hbook_isbn");
		
		System.out.println(hbook_isbn+hbook_check+member_id);
		
		// DTO 생성 및 수정 값
		BookDTO bookdto = new BookDTO();
		bookdto.setMember_id(member_id);
		bookdto.setHbook_check(hbook_check);
		bookdto.setHbook_author(hbook_author);
		bookdto.setHbook_subject(hbook_subject);
		bookdto.setHbook_isbn(hbook_isbn);
		
		// DAO 생성 및 메소드 불러오기
		AdminDAO adao = new AdminDAO();
		adao.getHBookReWrite(bookdto);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
		out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
		out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
		out.print("<script src='./js/jquery-ui.min.js'></script>");
		out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function() { ");
		out.println("$.Alert('희망도서 책 수정이 완료되었습니다!' , function(){"
				+ "location.href = './AdminHBookList.am'"
				+ "});");
		out.println("});");
		out.println("</script>");
		out.close();
		
		return null;
	}
	
}
