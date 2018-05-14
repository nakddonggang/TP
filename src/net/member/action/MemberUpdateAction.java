package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateAction execute()");
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String phone = request.getParameter("phone_frist")+request.getParameter("member_phone1")+request.getParameter("member_phone2");
		String email_check = request.getParameter("selectEmail");
		if(email_check.equals("1")) {
			email_check = request.getParameter("str_email02");
		}
		String email = request.getParameter("str_email01")+"@"+email_check;
		
		String member_id = (String)session.getAttribute("member_id");
		if(member_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = new MemberDTO();
				
		mDTO.setMember_id(member_id);
		mDTO.setMember_name(request.getParameter("member_name"));
		mDTO.setMember_post(request.getParameter("member_post"));
		mDTO.setMember_address1(request.getParameter("member_address1"));
		mDTO.setMember_address2(request.getParameter("member_address2"));
		mDTO.setMember_phone(phone);
		mDTO.setMember_email(email);
		
		mDAO.UpdateMember(mDTO);
		
		out.print("<script>");
		out.print("alert('수정되었습니다.');");
		out.print("location.href='./MemberInfo.me';");
		out.print("</script>");
		out.close();
		
		return null;
	}

}
