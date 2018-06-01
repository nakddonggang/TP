package net.book.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BookSortAjax  implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// String sort 파라미터값 가져오기
		String sort = request.getParameter("sort");
		System.out.println("정렬해야할 값"+sort);
		
		// 오름차순, 내림차순 결정하기
		String adsc="";
		if (sort.equals("book_subject")||sort.equals("book_author")||sort.equals("book_date")) adsc="asc";
		else if (sort.equals("book_number")||sort.equals("book_number")||sort.equals("book_pubDate")) adsc="desc";
		System.out.println(adsc);
		
		// AdminDAO adao 객체 생성 및 count 메소드 호출
		BookDAO bdao = new BookDAO();
		int count = bdao.BookCount();
		
		// 입출력
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// Json 님 부르기
		JSONArray arr = new JSONArray();
		
		// 책 뿌려주는 메소드 생성
		List<BookDTO> list = null;
		if (count!=0) bdao.BookSorts(sort, adsc);
		List<BookDTO> booksortList = null;
		
		for(int i=0; i<list.size(); i++){
			BookDTO bdto = list.get(i);
			JSONObject obj = new JSONObject();
			obj.put("book_number", bdto.getBook_number());
			obj.put("book_subject", bdto.getBook_subject());
			obj.put("book_author", bdto.getBook_author());
			obj.put("book_publisher", bdto.getBook_publisher());
			obj.put("dbook_state", bdto.getDbook_state());
			obj.put("bbook_bstate", bdto.getDbook_state());
			obj.put("bbook_bdate", bdto.getBbook_bdate());
			obj.put("bbook_rdate", bdto.getBbook_rdate());
			obj.put("rbook_check", bdto.getRbook_check());
			obj.put("book_file", bdto.getBook_file());
			arr.add(obj);
		}
		System.out.println(arr);
		response.setContentType("text/html; charset=utf-8");
		out.println(arr);
		out.flush();
		out.close();

		return null;
	}
	
}