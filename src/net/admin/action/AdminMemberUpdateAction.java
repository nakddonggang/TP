package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminMemberUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		String member_id = request.getParameter("member_id");
		String grade = request.getParameter("grade");
		String member_level = "";
		
		if("nomal".equals(grade))	member_level = "0";
		else if("black".equals(grade))	member_level = "1";
		else if("good".equals(grade))	member_level = "2";
		else if("admin".equals(grade))	member_level = "3";
		
		AdminDAO aDAO = new AdminDAO();
		aDAO.updateMemberLevel(member_level, member_id);
		
		forward.setPath("./AdminMemberInfo.am?info_id="+member_id+"&pageNum=1");
		forward.setRedirect(true);
		
		return forward;
	}
}