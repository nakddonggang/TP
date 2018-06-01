package net.book.action;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.stream.JsonLocation;
import javax.json.stream.JsonParser;
import javax.json.stream.JsonParser.Event;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;
import util.websocketSetting.ChatMessage;
import util.websocketSetting.Message;
import util.websocketSetting.UsersMessage;

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

		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int BorrowCheck;
		if(member_id != null) {
			BorrowCheck = bdao.userBorrowBookCheck(member_id);
		} else { BorrowCheck=0;}
		System.out.println("borrowcheck : " +BorrowCheck);

		// 한 화면에 보여줄 책의 개수 설정
		int pageSize = 8;		
		
		// 페이지 번호 (PageNum)
		String pageNum = request.getParameter("pageNum");
			// 페이지 번호 없으면 무조건 "1" 페이지 설정
		if (pageNum==null)
			pageNum="1";
		
		// 10개씩 게시판 글을 분류했을 때,
		int currentPage = Integer.parseInt(pageNum);
		// 첫 번째 페이지 첫행 구하기
			// 1page - 1 / 2page - 11 / 3page - 21
		int startRow = (currentPage-1)* pageSize+1;
		// 페이지 마지막행 구하기
			// 1page - 10 / 2page - 20 / 3page - 30
		int endRow = pageSize*currentPage;
		
		// 입출력
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 게시판 전체 페이지 수
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		// 한 화면에 보여줄 페이지수 설정
		int pageBlock = 5;
		// 시작하는 페이지 번호 구하기
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		// 끝나는 페이지 번호 구하기
		int endPage = startPage+pageBlock-1;
		// 끝나는 페이지보다 전체페이지의 수가 작은 경우 if 문을 이용하여 제어해주기
		if (endPage>pageCount){
			endPage=pageCount;
		}	
		
		// Json 님 부르기
//		JSONArray arr = new JSONArray();
		
		// 책 뿌려주는 메소드 생성
		List<BookDTO> list = null;
		if (count!=0) bdao.BookSorts(sort, adsc);
		List<BookDTO> booksortList = null;
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		String result="";
		JsonObject JsonObj = null;
		JsonArray JsonArr = null;
		  
		for(int i=0; i<list.size(); i++){
			BookDTO bdto = list.get(i);
			JsonObj=Json.createObjectBuilder() // { } 생성
					.add("book_number", bdto.getBook_number())
					.add("book_subject", bdto.getBook_subject())
					.add("book_author", bdto.getBook_author())
					.add("book_publisher", bdto.getBook_publisher())
					.add("dbook_state", bdto.getDbook_state())
					.add("bbook_bstate", bdto.getDbook_state())
					.add("bbook_bdate", date.format(bdto.getBbook_bdate()))
					.add("bbook_rdate", date.format(bdto.getBbook_rdate()))
					.add("rbook_check", bdto.getRbook_check())
					.add("book_file", bdto.getBook_file()).build();
			result += JsonObj.toString();
			
			if(i != list.size()-1) result += ",";
		} // result >> String에 넣어주는 역할
		JsonArr = Json.createArrayBuilder().add(result).build(); // [ ] 생성
		System.out.println(JsonArr);
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(JsonArr);
		
//		user.add("count", count);
//		user.add("sort", sort);
//		user.add("pageNum", pageNum);
//		user.add("pageCount", pageCount);
//		user.add("pageBlock", pageBlock);
//		user.add("startPage", startPage);
//		user.add("endPage", endPage);	
//		user.add("BorrowCheck", BorrowCheck);
//		
//		 user.build().toString();
		  
		
//		for(int i=0; i<list.size(); i++){
//			BookDTO bdto = list.get(i);
//			JSONObject obj = new JSONObject();
//			obj.put("book_number", bdto.getBook_number());
//			obj.put("book_subject", bdto.getBook_subject());
//			obj.put("book_author", bdto.getBook_author());
//			obj.put("book_publisher", bdto.getBook_publisher());
//			obj.put("dbook_state", bdto.getDbook_state());
//			obj.put("bbook_bstate", bdto.getDbook_state());
//			obj.put("bbook_bdate", bdto.getBbook_bdate());
//			obj.put("bbook_rdate", bdto.getBbook_rdate());
//			obj.put("rbook_check", bdto.getRbook_check());
//			obj.put("book_file", bdto.getBook_file());
//			arr.add(obj);
//		}
//		System.out.println(arr);
//		response.setContentType("text/html; charset=utf-8");
//		out.println(arr);
//		out.flush();
//		out.close();
		
//		 count, pageNum, boardList, pageCount, pageBlock, startPage, endPage 저장
//		request.setAttribute("count", count);
//		request.setAttribute("sort", sort);
//		request.setAttribute("pageNum", pageNum);
//		request.setAttribute("pageCount", pageCount);
//		request.setAttribute("pageBlock", pageBlock);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);			
//		request.setAttribute("BorrowCheck", BorrowCheck);
		
		return null;
	}
	
	
}