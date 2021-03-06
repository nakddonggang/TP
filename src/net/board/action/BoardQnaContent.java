package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardQnaContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaContent execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		String table = "qna";
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.updateReadcount(table, qna_num);
		BoardDTO bDTO = bDAO.getQna(qna_num);
		BoardDTO bDTO1 = bDAO.getReply(qna_num);
		
		request.setAttribute("bDTO", bDTO);
		request.setAttribute("bDTO1", bDTO1);

		forward.setPath("./board/boardQContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}