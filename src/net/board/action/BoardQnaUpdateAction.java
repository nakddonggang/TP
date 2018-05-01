package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardQnaUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("./BoardQnaContent.bo");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
