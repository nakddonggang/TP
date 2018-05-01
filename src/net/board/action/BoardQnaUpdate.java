package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardQnaUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaUpdate execute()");
		request.setCharacterEncoding("utf-8");
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("./board/boardQnaUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
