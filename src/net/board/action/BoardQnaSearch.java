package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardQnaSearch implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaSearch execute()");
		request.setCharacterEncoding("utf-8");
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("./board/boardQSearch.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
