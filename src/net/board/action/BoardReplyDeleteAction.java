package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardReplyDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyDeleteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int qna_ref = Integer.parseInt(request.getParameter("qna_ref"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = new BoardDTO();
		bDTO.setQna_ref(qna_ref);
		bDAO.updateReply(bDTO);
		bDAO.deleteCheck(qna_ref);

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardQnaList.qn?pageNum"+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}
}