package net.book.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDAO;
import net.book.db.BookDTO;

@WebServlet("/BookSortServlet")
public class BookSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// String sort 파라미터값 가져오기
		String sort = request.getParameter("sort");
		String pageNum = request.getParameter("pageNum");
		System.out.println("정렬해야할 값"+sort);
		
		response.getWriter().write(getJSON(sort, pageNum));
	}
	
	public String getJSON(String sort, String pageNum) {

		// AdminDAO adao 객체 생성 및 count 메소드 호출
		BookDAO bdao = new BookDAO();
		int count = bdao.BookCount();
		
		// 한 화면에 보여줄 책의 개수 설정
		int pageSize = 9;		
		
		// 페이지 번호 (PageNum)
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
		
		// 책 뿌려주는 메소드 생성
		List<BookDTO> booksortList = null;
		if(count!=0){
			if(sort.equals("book_subject")){
				booksortList=bdao.BookSortSubject(startRow, pageSize);
			} else if (sort.equals("book_author")){
				booksortList=bdao.BookSortAuthor(startRow, pageSize);
			} else if (sort.equals("book_number")){
				booksortList=bdao.BookSortNumber(startRow, pageSize);
			} else if (sort.equals("book_pubDate")){
				booksortList=bdao.BookSortPubDate(startRow, pageSize);
			} else if (sort.equals("book_date")){
				booksortList=bdao.BookSortIO(startRow, pageSize);
			} else{ }
		} else{ }
		
		// 게시판 전체 페이지 수
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		// 한 화면에 보여줄 페이지수 설정
		int pageBlock = 5;
		// 시작하는 페이지 번호 구하기
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		// 끝나는 페이지 번호 구하기
		int endPage = startPage+pageBlock-1;
		// 끝나는 페이지보다 전체페이지의 수가 작은 경우 if 문을 이용하여 제어해주기
		if (endPage>pageCount) endPage=pageCount;

		StringBuffer booksortRS = new StringBuffer("");
		booksortRS.append("{\"result\":[");
		
		for (int i=0; i<booksortList.size(); i++){
			booksortRS.append("[{\"value\":\"" +booksortList.get(i).getBook_number()+"\"},");
			booksortRS.append("{\"value\":\"" +booksortList.get(i).getBook_subject()+"\"},");
			booksortRS.append("{\"value\":\"" +booksortList.get(i).getBook_publisher()+"\"},");
			booksortRS.append("{\"value\":\"" +booksortList.get(i).getDbook_state()+"\"},");
			booksortRS.append("{\"value\":\"" +booksortList.get(i).getBbook_bstate()+"\"},");
			booksortRS.append("{\"value\":\"" +booksortList.get(i).getBbook_rdate()+"\"},");
			booksortRS.append("{\"value\":\"" +booksortList.get(i).getRbook_check()+"\"},");
			booksortRS.append("{\"value\":\"" +booksortList.get(i).getBook_file()+"\"},");
		}
		booksortRS.append("]},");
//		booksortRS.append("{\"count\":\""+count+"\"},");
//		booksortRS.append("{\"sort\":\""+sort+"\"},");
//		booksortRS.append("{\"pageNum\":\""+pageNum+"\"},");
//		booksortRS.append("{\"pageCount\":\""+pageCount+"\"},");
//		booksortRS.append("{\"pageBlock\":\""+pageBlock+"\"},");
//		booksortRS.append("{\"startPage\":\""+startPage+"\"},");
//		booksortRS.append("{\"endPage\":\""+endPage+"\"}");
		
		// count, pageNum, boardList, pageCount, pageBlock, startPage, endPage 저장
//		request.setAttribute("count", count);
//		request.setAttribute("sort", sort);
//		request.setAttribute("pageNum", pageNum);
//		request.setAttribute("booksortList", booksortList);
//		request.setAttribute("pageCount", pageCount);
//		request.setAttribute("pageBlock", pageBlock);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);	
		
		return booksortRS.toString();
	}
}
