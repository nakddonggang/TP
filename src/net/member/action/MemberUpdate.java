package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdate execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = mDAO.getMember(member_id);
		request.setAttribute("mDTO", mDTO);
		
		forward.setPath("./member/memberUpdate.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
