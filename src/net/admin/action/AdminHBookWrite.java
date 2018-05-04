package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminHBookWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admHBookWrite.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
