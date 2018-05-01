package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardCurWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardDTO bDTO = new BoardDTO();
		BoardDAO bDAO = new BoardDAO();
		
		bDTO.setCur_name(request.getParameter("cur_name"));
		bDTO.setCur_type(request.getParameter("cur_type"));
		bDTO.setCur_subject(request.getParameter("cur_subject"));
		bDTO.setCur_content(request.getParameter("cur_content"));
	
		bDAO.insertCur(bDTO);
	
		forward.setPath("./BoardCurList.cu");
		forward.setRedirect(true);
		return forward;
	}
}