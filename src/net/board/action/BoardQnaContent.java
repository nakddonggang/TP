package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardQnaContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaContent execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		forward.setPath("./board/boardQContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}	
}