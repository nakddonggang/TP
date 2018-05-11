package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardReplyUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyUpdate() execute");
		request.setCharacterEncoding("utf-8");
		
		int qna_ref = Integer.parseInt(request.getParameter("qna_ref"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = bDAO.getQna(qna_ref);
		BoardDTO bDTO1 = bDAO.getReply(qna_ref);
		
		request.setAttribute("bDTO", bDTO);
		request.setAttribute("bDTO1", bDTO1);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("./board/boardQRepUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}