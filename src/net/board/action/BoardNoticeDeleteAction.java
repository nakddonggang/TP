package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardNoticeDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardNoticeDeleteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.deleteNotice(notice_num);

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardNoticeList.no?pageNum"+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}	
}