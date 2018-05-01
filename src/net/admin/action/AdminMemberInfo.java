package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminMemberInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		
		System.out.println("AdminMemberInfo execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		String member_id = request.getParameter("member_id");
		String pageNum = request.getParameter("pageNum");
		
		
		if(member_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		AdminDAO adao = new AdminDAO();
		MemberDTO mDTO = adao.getAdminMember(member_id);
		
		request.setAttribute("mDTO", mDTO);
		
		forward.setPath("./admin/admMemInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
