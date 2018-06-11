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
		
		String info_id = request.getParameter("info_id");
		String pageNum = request.getParameter("pageNum");
		
		
		if(info_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		AdminDAO adao = new AdminDAO();
		MemberDTO mDTO = adao.getAdminMember(info_id);
		String bl_check = mDTO.getBl_check();
		String gm_check = mDTO.getGm_check();
		String member_id = mDTO.getMember_id();
		System.out.println("mDTO.getMember_id : "+member_id);
		int borrowcount = adao.userBorrowCount(member_id);
		request.setAttribute("borrowcount", borrowcount);
		request.setAttribute("mDTO", mDTO);
		request.setAttribute("bl_check", bl_check);
		request.setAttribute("gm_check", gm_check);
		
		forward.setPath("./admin/admMemInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
