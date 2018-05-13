package net.admin.action;
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
		int hbook_isbn = Integer.parseInt(request.getParameter("hbook_isbn"));
		
		System.out.println(hbook_isbn+hbook_check+member_id);
		
		// DTO 생성 및 수정 값
		BookDTO bookdto = new BookDTO();
		bookdto.setMember_id(member_id);
		bookdto.setHbook_check(hbook_check);
		bookdto.setHbook_isbn(hbook_isbn);
		
		// DAO 생성 및 메소드 불러오기
		AdminDAO adao = new AdminDAO();
		adao.getHBookReWrite(bookdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminHBookList.am");
		forward.setRedirect(true);
		return forward;
	}
	
}
