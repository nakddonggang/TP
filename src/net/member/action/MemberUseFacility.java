package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.facility.db.FacilityDTO;
import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberUseFacility implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUseFacility execute");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String member_id = (String)session.getAttribute("member_id");
		if(member_id == null) {
			response.sendRedirect("./MemberLogin.me");
		}
		MemberDAO mDAO = new MemberDAO();
		FacilityDTO fDTO = mDAO.getMemberUseFacility(member_id);
		request.setAttribute("fDTO", fDTO);
		ActionForward forward = new ActionForward();
		forward.setPath("./member/myUseFacility.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
