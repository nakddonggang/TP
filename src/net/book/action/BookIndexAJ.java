package net.book.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonValue;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BookIndexAJ  implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// String sort 파라미터값 가져오기
		String sort = request.getParameter("sort");
		System.out.println("정렬해야할 값"+sort);
		if (sort==null) sort="book_number";
		
		String view = request.getParameter("view");
		System.out.println(view);
		if (view==null) view="1";
		
		
		// 오름차순, 내림차순 결정하기
		String adsc="";
		if (sort.equals("book_subject")||sort.equals("book_author")||sort.equals("book_date")) adsc="asc";
		else if (sort.equals("book_number")||sort.equals("book_number")||sort.equals("book_pubDate")) adsc="desc";
		System.out.println(adsc);
		
		// AdminDAO adao 객체 생성 및 count 메소드 호출
		BookDAO bdao = new BookDAO();
		int count = bdao.BookCount();
		System.out.println(count);

//		HttpSession session = request.getSession();
//		String member_id = (String)session.getAttribute("member_id");
//		int BorrowCheck;
//		if(member_id != null) {
//			BorrowCheck = bdao.userBorrowBookCheck(member_id);
//		} else { BorrowCheck=0;}
//		System.out.println("borrowcheck : " +BorrowCheck);

		// 한 화면에 보여줄 책의 개수 설정
		int pageSize = 6;		
		
		// 페이지 번호 (PageNum)
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum의 값 : "+pageNum);
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

		System.out.println(pageSize+", "+pageNum+", "+currentPage+", "+startRow+", "+endRow);
		// 입출력
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 책 뿌려주는 메소드 생성
		List<BookDTO> list = bdao.BookSorts(sort, adsc, startRow, pageSize);
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		JsonObject JsonObj = null;
		JsonArray JsonArr = null;
		String books="";
		  
		for(int i=0; i<list.size(); i++){
			BookDTO bdto = list.get(i);
			if ((bdto.getBbook_bdate()==null)&&(bdto.getBbook_rdate()==null)){
				JsonObj=Json.createObjectBuilder() // { } 생성
						.add("book_number", bdto.getBook_number())
						.add("book_subject", bdto.getBook_subject())
						.add("book_author", bdto.getBook_author())
						.add("book_publisher", bdto.getBook_publisher())
						.add("bbook_bstate", bdto.getBbook_bstate())
						.add("bbook_bdate", JsonValue.NULL)
						.add("bbook_rdate",  JsonValue.NULL)
						.add("rbook_check", bdto.getRbook_check())
						.add("book_file", bdto.getBook_file()).build();
				books += JsonObj.toString();
			} else if (bdto.getBbook_bdate()==null){
				JsonObj=Json.createObjectBuilder() // { } 생성
						.add("book_number", bdto.getBook_number())
						.add("book_subject", bdto.getBook_subject())
						.add("book_author", bdto.getBook_author())
						.add("book_publisher", bdto.getBook_publisher())
						.add("bbook_bstate", bdto.getBbook_bstate())
						.add("bbook_bdate", JsonValue.NULL)
						.add("bbook_rdate", date.format(bdto.getBbook_rdate()))
						.add("rbook_check", bdto.getRbook_check())
						.add("book_file", bdto.getBook_file()).build();
				books += JsonObj.toString();
				System.out.println(books);
			} else if (bdto.getBbook_rdate()==null){
				JsonObj=Json.createObjectBuilder() // { } 생성
						.add("book_number", bdto.getBook_number())
						.add("book_subject", bdto.getBook_subject())
						.add("book_author", bdto.getBook_author())
						.add("book_publisher", bdto.getBook_publisher())
						.add("bbook_bstate", bdto.getBbook_bstate())
						.add("bbook_bdate", date.format(bdto.getBbook_bdate()))
						.add("bbook_rdate", JsonValue.NULL)
						.add("rbook_check", bdto.getRbook_check())
						.add("book_file", bdto.getBook_file()).build();
				books += JsonObj.toString();
				System.out.println(books);
			} else {
				JsonObj=Json.createObjectBuilder() // { } 생성
						.add("book_number", bdto.getBook_number())
						.add("book_subject", bdto.getBook_subject())
						.add("book_author", bdto.getBook_author())
						.add("book_publisher", bdto.getBook_publisher())
						.add("bbook_bstate", bdto.getBbook_bstate())
						.add("bbook_bdate", date.format(bdto.getBbook_bdate()))
						.add("bbook_rdate", date.format(bdto.getBbook_rdate()))
						.add("rbook_check", bdto.getRbook_check())
						.add("book_file", bdto.getBook_file()).build();
				books += JsonObj.toString();
				System.out.println(books);
			}
			
			System.out.println(JsonObj);
			if(i != list.size()-1) books += ",";
		} // result >> String에 넣어주는 역할

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
		System.out.println(pageCount+", "+pageBlock+", "+startPage+", "+endPage);
		
		// 배열을 제외한 나머지 값 추가로 JsonArray에 넣어주기
		if (list.size() == 0) {
			JsonArr=Json.createArrayBuilder()
			.add("{\"count\":"+count+"}")
			.add("{\"sort\":\""+sort+"\"}")
			.add("{\"pageNum\":\""+pageNum+"\"}")
			.add("{\"pageCount\":"+pageCount+"}")
			.add("{\"pageBlock\":"+pageBlock+"}")
			.add("{\"startPage\":"+startPage+"}")
			.add("{\"endPage\":"+endPage+"}")
			.add("{\"view\":\""+view+"\"}")
			.build();
		} else { 
			JsonArr=Json.createArrayBuilder()
			.add(books)
			.add("{\"count\":"+count+"}")
			.add("{\"sort\":\""+sort+"\"}")
			.add("{\"pageNum\":\""+pageNum+"\"}")
			.add("{\"pageCount\":"+pageCount+"}")
			.add("{\"pageBlock\":"+pageBlock+"}")
			.add("{\"startPage\":"+startPage+"}")
			.add("{\"endPage\":"+endPage+"}")
			.add("{\"view\":\""+view+"\"}")
			.build();
		} // [ ] 생성
		
		System.out.println(JsonArr);
		out.print(JsonArr);
		out.flush();
		out.close();
		
		return null;
	}
	
	
}