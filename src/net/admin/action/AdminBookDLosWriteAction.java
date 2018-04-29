package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;

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
		} else {
			System.out.println("Success");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminBookDLos.am");
		forward.setRedirect(true);
		return forward;
	}
	
}
