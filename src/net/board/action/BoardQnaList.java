package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardQnaList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("./board/boardQna.jsp");
		forward.setRedirect(false);
		
		return forward;
	}	
}