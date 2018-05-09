package net.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MainAction execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		
		///////////////////////공지사항 불러오는 값 /////////////////////////////
		BoardDAO bDAO = new BoardDAO();
		int count = bDAO.getNoticeCount();		// 공지사항 글 개수 구해 count에 저장
		
		int pageSize = 5;	//한 화면에 보여줄 글 개수 설정
		String pageNum = request.getParameter("pageNum");	// 페이지 번호(파라미터 "pageNum") 가져오기

		if(pageNum == null){	//페이지 번호가 없으면 무조건 "1"페이지 설정
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;	// 페이지 첫 행 구하기
		int endRow = currentPage*pageSize;			// 마지막행 구하기
		
		List<BoardDTO> noticeList = null;
		
		if(count != 0){
			noticeList = bDAO.getNoticeList(startRow, pageSize);
		}
		
	
		//////////////////////큐레이션 불러오는 값 /////////////////////////////
		
		count = bDAO.getCurationCount();		// Curation 글 개수 구해 count에 저장
		
		pageSize =5;	//한 화면에 보여줄 글 개수 설정
		pageNum = request.getParameter("pageNum");	// 페이지 번호(파라미터 "pageNum") 가져오기

		if(pageNum == null){	//페이지 번호가 없으면 무조건 "1"페이지 설정
			pageNum = "1";
		}

		currentPage = Integer.parseInt(pageNum);
		startRow = (currentPage-1)*pageSize+1;	// 페이지 첫 행 구하기
		endRow= currentPage*pageSize;			// 마지막행 구하기
		
		List<BoardDTO> curationList = null;
		
		if(count != 0){
			curationList = bDAO.getCurationList(startRow, pageSize);
		}
		
		// count, pageNum, noticeList, pageCount 저장
			
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("curationList", curationList);
		
				forward.setPath("./main/main.jsp");
				forward.setRedirect(false);
				
				return forward;
	}
	
}
