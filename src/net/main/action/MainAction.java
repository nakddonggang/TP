package net.main.action;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import net.book.db.BookDAO;
import net.book.db.BookDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MainAction execute()");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		Cookie[] cookie = request.getCookies();
		String member_id = "";
		
		if(cookie != null){
			for(int i=0; i<cookie.length; i++){
				System.out.println("cookie["+i+"]"+cookie[i].getValue());
				System.out.println(cookie[i].getName());
				System.out.println(cookie[i].getMaxAge());
				
				if(cookie[i].getName().startsWith("auto")){
					member_id = cookie[i].getValue();
					session.setAttribute("member_id", member_id);			
				}
			}
		}
		
		///////////////////////공지사항 불러오는 값 /////////////////////////////
		BoardDAO bDAO = new BoardDAO();
		int count = bDAO.getNoticeCount();		// 공지사항 글 개수 구해 count에 저장
		
		int pageSize = 5;	//한 화면에 보여줄 글 개수 설정
		int startRow = 1;
		
		List<BoardDTO> noticeList = null;
		
		if(count != 0){
			noticeList = bDAO.getNoticeList(startRow, pageSize);
		}
		
	
		//////////////////////큐레이션 불러오는 값 /////////////////////////////
		
		count = bDAO.getCurationCount();		// Curation 글 개수 구해 count에 저장
		
		pageSize =2;	//한 화면에 보여줄 글 개수 설정
		
		List<BoardDTO> curationList = null;
		
		if(count != 0){
			curationList = bDAO.getCurationList(startRow, pageSize);
		}
		
		
		//////////////////////인기도서 불러오는 값 /////////////////////////////
		BookDAO bkDAO = new BookDAO();
		List<BookDTO> popularList = null;
		if(bkDAO.popularList().size()!=0){
			popularList = bkDAO.popularList();
		}
		
		System.out.println("popularList: " + bkDAO.popularList().size());
		
		request.setAttribute("popularList", popularList);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("curationList", curationList);
	
		forward.setPath("./main/main.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
