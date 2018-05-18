package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDTO;
import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberMyUseBookList implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session =request.getSession();
		String member_id=(String)session.getAttribute("member_id");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		MemberDAO mDAO = new MemberDAO();
		
		int pageSize = 5;	//한 화면에 보여줄 글 개수 설정

		String pageNum ="1";

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;	// 페이지 첫 행 구하기
		
		List<BookDTO> bbList = null;
		
		bbList = mDAO.MemberMyUseBookList(member_id, startRow-1, pageSize);
		request.setAttribute("bbList", bbList);
		
		forward.setPath("./myUseBook.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
