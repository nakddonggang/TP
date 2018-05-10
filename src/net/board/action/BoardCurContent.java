package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardCurContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardCurContent execute()");
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		int cur_num = Integer.parseInt(request.getParameter("cur_num"));
		
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = bDAO.getCuration(cur_num);
		
		request.setAttribute("bDTO", bDTO);
		forward.setPath("./board/boardCuContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
    
}