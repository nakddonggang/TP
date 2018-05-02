package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyAction execute()");
		request.getParameter("utf-8");
		String pageNum = request.getParameter("pageNum");
		int qna_ref = Integer.parseInt(request.getParameter("qna_ref"));
		
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = new BoardDTO();
		ActionForward forward = new ActionForward();
		
		bDTO.setQna_ref(qna_ref);
		bDTO.setRep_name(request.getParameter("rep_name"));
		bDTO.setRep_email(request.getParameter("rep_email"));
		bDTO.setRep_content(request.getParameter("rep_content"));
		bDAO.updateReply(bDTO);
		bDAO.updateCheck(qna_ref);
		
		forward.setPath("./BoardQnaList.qn?pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}	
}