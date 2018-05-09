package net.admin.action;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.admin.db.AdminDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminBookWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// file 객체
		String realPath=request.getRealPath("/upload");
		System.out.println("upload폴더 물리적 경로: "+realPath);		
		int maxSize=5*1024*1024;
		MultipartRequest multi=new MultipartRequest(request, realPath, maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		// 발행일 받아오기
		String book_pubDate = multi.getParameter("book_pubDate");
		System.out.println(book_pubDate);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = (Date)format.parse(book_pubDate);
		System.out.println(date);	

		// BookDTO 객체 생성 및 파라미터값 받기
		BookDTO bookdto = new BookDTO();
		bookdto.setBook_subject(multi.getParameter("book_subject"));
		bookdto.setBook_author(multi.getParameter("book_author"));
		bookdto.setBook_pubDate(date);
		bookdto.setBook_publisher(multi.getParameter("book_publisher"));
		bookdto.setBook_form(multi.getParameter("book_form"));
		bookdto.setBook_notation(multi.getParameter("book_notation"));
		bookdto.setBook_isbn(multi.getParameter("book_isbn"));
		bookdto.setBook_classification(multi.getParameter("book_classification"));
		bookdto.setBook_file(multi.getFilesystemName("book_file"));
		
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
		forward.setPath("./AdminIndex.am");
		forward.setRedirect(true);
		return forward;
	}
	
}
