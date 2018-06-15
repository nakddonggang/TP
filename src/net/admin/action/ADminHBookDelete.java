package net.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class ADminHBookDelete implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 한글처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String member_id = request.getParameter("member_id");
		String hbook_subject = request.getParameter("hbook_subject");
		String hbook_author = request.getParameter("hbook_author");
		System.out.println(member_id);
		System.out.println(hbook_subject);
		System.out.println(hbook_author);
		
		AdminDAO adao = new AdminDAO();
		adao.HBookDelete(member_id, hbook_subject, hbook_author);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminHBookList.am?direct=1");
		forward.setRedirect(true);
	    return forward;
	}
	
}
