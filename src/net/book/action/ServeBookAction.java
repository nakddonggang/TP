package net.book.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class ServeBookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//  BookDTO 객체 생성 및 파라미터값 받기
		BookDTO bookdto = new BookDTO();
		bookdto.setMember_id(request.getParameter("member_id"));
		bookdto.setHbook_subject(request.getParameter("hbook_subject"));
		bookdto.setHbook_author(request.getParameter("hbook_author"));
		bookdto.setHbook_publisher(request.getParameter("hbook_publisher"));
		bookdto.setHbook_explain(request.getParameter("hbook_explain"));
		bookdto.setHbook_check(request.getParameter("hbook_check"));
		bookdto.setHbook_isbn("0");

		ActionForward forward = new ActionForward();
		
		BookDAO bdao = new BookDAO();
		int result = bdao.insertHBook(bookdto);
		if (result==0){
			System.out.println("fail");
			return null;
		} else {
			System.out.println("success");
			out.println("<script>");
			out.println("alert('희망도서 신청이 완료되었습니다')");
			out.println("location.href='./BookIndex.bk'");
			out.println("</script>");
			out.close();
			return null;
		}
		
	}
	
}
