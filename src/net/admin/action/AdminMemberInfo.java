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
		String member_id = mDTO.getMember_id();
		int overduecount = adao.AllOverDueCount(member_id);
		int borrowcount = adao.userBorrowCount(member_id);
		int overduedate = adao.AllOverDueDate(member_id);
		request.setAttribute("overduecount", overduecount);
		request.setAttribute("borrowcount", borrowcount);
		request.setAttribute("overduedate", overduedate);
		request.setAttribute("mDTO", mDTO);
		
		forward.setPath("./admin/admMemInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
