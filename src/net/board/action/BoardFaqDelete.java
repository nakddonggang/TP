package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardFaqDelete  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardFaqDelete execute()");
		request.setCharacterEncoding("utf-8");
		
		int faq_num = Integer.parseInt(request.getParameter("faq_num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.deleteFaq(faq_num);

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardFaqList.fa?pageNum"+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}
   
}
