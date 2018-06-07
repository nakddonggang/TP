package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminGuideStatis implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("AdminGuideStatis execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		
		forward.setPath("./guide/guideStatis.jsp");
		forward.setRedirect(false);
		return forward;
	}
    
}
