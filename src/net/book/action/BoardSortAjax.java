package net.book.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.board.db.BoardDTO;
import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardSortAjax implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String sort = request.getParameter("sort");
		System.out.println(sort);
		String adsc="";
		if (sort.equals("book_subject")||sort.equals("book_author")||sort.equals("book_date")) adsc="asc";
		else if (sort.equals("book_number")||sort.equals("book_number")||sort.equals("book_pubDate")) adsc="desc";
		System.out.println(adsc);

		JSONArray arr = new JSONArray();
		
		BookDAO bdao = new BookDAO();
		List<BookDTO> list = bdao.BookSorts(sort, adsc);
//		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

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
			System.out.println(arr);
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(arr);
		out.flush();
		out.close();
		
		return null;
		
	}
	
}
