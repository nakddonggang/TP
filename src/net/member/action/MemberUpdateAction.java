package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateAction execute()");
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String member_id = (String)session.getAttribute("member_id");
		if(member_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = new MemberDTO();
		
		mDTO.setMember_post(request.getParameter("post"));
		mDTO.setMember_address1(request.getParameter("address1"));
		mDTO.setMember_address2(request.getParameter("address2"));
		mDTO.setMember_phone(request.getParameter("phone"));
		mDTO.setMember_email(request.getParameter("email"));
		mDAO.UpdateMember(mDTO);
		
		out.print("<script>");
		out.print("alert('수정되었습니다.');");
		out.print("location.href='./MemberInfo.me';");
		out.print("</script>");
		out.close();
		
		return null;
	}

}
