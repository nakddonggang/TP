package net.admin.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;

public class AdminBookWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// BookDTO 객체 생성 및 파라미터값 받기
		BookDTO bookdto = new BookDTO();
		bookdto.setBook_subject(request.getParameter("book_subject"));
		bookdto.setBook_author(request.getParameter("book_author"));
		bookdto.setBook_publisher(request.getParameter("book_publisher"));
		bookdto.setBook_form(request.getParameter("book_form"));
		bookdto.setBook_notation(request.getParameter("book_notation"));
		bookdto.setBook_isbn(request.getParameter("book_isbn"));
		bookdto.setBook_classification(request.getParameter("book_classification"));
		bookdto.setBook_date(new Timestamp(System.currentTimeMillis()));
		
		// AdminDAO 객체 생성 및 insert 메소드 불러오기
			// if 문 result 값
		AdminDAO adao = new AdminDAO();
		int result = adao.insertBook(bookdto);
		if(result ==0){
			System.out.println("Fail");
		} else {
			System.out.println("Success");
		}
		
		// ActionForward
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminBookIO.am");
		forward.setRedirect(true);
		return null;
	}
	
}
