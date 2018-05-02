package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardReplyUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		int qna_ref = Integer.parseInt(request.getParameter("qna_ref"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDTO bDTO = new BoardDTO();
		bDTO.setQna_ref(qna_ref);
		bDTO.setRep_name(request.getParameter("rep_name"));
		bDTO.setRep_email(request.getParameter("rep_email"));
		bDTO.setRep_content(request.getParameter("rep_content"));
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.updateReply(bDTO);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardQnaList.qn?pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}
}