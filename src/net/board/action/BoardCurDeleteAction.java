package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardCurDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardCurDeleteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int cur_num = Integer.parseInt(request.getParameter("cur_num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.deleteCur(cur_num);

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardCurList.cu?pageNum"+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}
}