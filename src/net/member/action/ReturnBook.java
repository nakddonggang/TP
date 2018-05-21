package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class ReturnBook implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReturnBook execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		int book_number = 3;
		
		MemberDAO mDAO = new MemberDAO();
		mDAO.deleteBbook(book_number);
		
		forward.setPath("./MemberBasketList.me");
		forward.setRedirect(true);
		
		return forward;
	}
}