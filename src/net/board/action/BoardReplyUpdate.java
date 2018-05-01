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
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int qna_ref = Integer.parseInt(request.getParameter("qna_ref"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = bDAO.getQna(qna_num);

		bDTO = bDAO.getReply(qna_ref);
		
		request.setAttribute("bDTO", bDTO);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("./board/boardQRepUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}