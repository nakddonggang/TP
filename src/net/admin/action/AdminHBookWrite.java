package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminHBookWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파라미터값 받아오기
		String member_id = request.getParameter("member_id");
		String hbook_subject = request.getParameter("hbook_subject");
		String hbook_author = request.getParameter("hbook_author");
		
		// DAO 생성
		AdminDAO adao = new AdminDAO();
		BookDTO bookdto = adao.getHBookInfo(member_id, hbook_subject, hbook_author);
		
		request.setAttribute("bookdto", bookdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admHBookWrite.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
