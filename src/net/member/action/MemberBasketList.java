package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberBasketList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("./member/myUseBasket.jsp");
	    forward.setRedirect(false);
	    return forward;
	}

}
