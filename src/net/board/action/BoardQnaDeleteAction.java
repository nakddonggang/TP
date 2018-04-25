package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardQnaDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaDeleteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("./BoardQnaList.bo");
		forward.setRedirect(true);
		
		return forward;
	}
	
}