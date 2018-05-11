package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardQnaDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaDeleteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.deleteQna(qna_num);
		bDAO.deleteReply(qna_num);

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardQnaList.qn");
		forward.setRedirect(true);
		
		return forward;
	}
}