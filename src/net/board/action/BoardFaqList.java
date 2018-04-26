package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardFaqList  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardFaqList execute()");
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardFaq.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
