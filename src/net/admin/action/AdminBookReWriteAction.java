package net.admin.action;

import java.io.PrintWriter;
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

public class AdminBookReWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// file 객체
		
		// book_number 찾기
		int book_number=Integer.parseInt(request.getParameter("book_number"));
		
		// 발행일 받아오기
		String book_pubDate = request.getParameter("book_pubDate");
		System.out.println(book_pubDate);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = (Date)format.parse(book_pubDate);
		System.out.println(date);	

		// BookDTO 객체 생성 및 파라미터값 받기
		BookDTO bookdto = new BookDTO();
		bookdto.setBook_number(book_number);
		bookdto.setBook_subject(request.getParameter("book_subject"));
		bookdto.setBook_author(request.getParameter("book_author"));
		bookdto.setBook_pubDate(date);
		bookdto.setBook_publisher(request.getParameter("book_publisher"));
		bookdto.setBook_form(request.getParameter("book_form"));
		bookdto.setBook_notation(request.getParameter("book_notation"));
		bookdto.setBook_isbn(request.getParameter("book_isbn"));
		bookdto.setBook_classification(request.getParameter("book_classification"));
		
		ActionForward forward = new ActionForward();
		// AdminDAO 객체 생성 및 insert 메소드 불러오기
			// if 문 result 값
		AdminDAO adao = new AdminDAO();
		adao.admBookReWrite(bookdto);

		out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
		out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
		out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
		out.print("<script src='./js/jquery-ui.min.js'></script>");
		out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function() { ");
		out.println("$.Alert('입고 수정이 완료되었습니다!' , function(){"
				+ "location.href = './AdminIndex.am'"
				+ "});");
		out.println("});");
		out.println("</script>");
		out.close();
		
		return null;

	}
	
}
