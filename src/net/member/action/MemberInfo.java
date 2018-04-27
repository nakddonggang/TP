package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberInfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberInfo execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String member_id = (String)session.getAttribute("member_id");
		if(member_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		MemberDTO mDTO = new MemberDTO();
		MemberDAO mDAO = new MemberDAO();
		mDTO = mDAO.getMember(member_id);
		
		request.setAttribute("mDTO", mDTO);
		
		forward.setPath("./MemberInfo.me");
		forward.setRedirect(true);
		return forward;
	}

}
