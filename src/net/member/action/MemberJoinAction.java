package net.member.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberJoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinAction execute()");
	
		request.setCharacterEncoding("UTF-8");
		MemberDTO mDTO = new MemberDTO();
		MemberDAO mDAO = new MemberDAO();
		ActionForward forward = new ActionForward();
		int result;

		mDTO.setMember_id(request.getParameter("member_id"));
		mDTO.setMember_pass(request.getParameter("member_pass"));
		mDTO.setMember_name(request.getParameter("member_name"));
		mDTO.setMember_post(request.getParameter("member_post"));
		mDTO.setMember_address1(request.getParameter("member_address1"));
		mDTO.setMember_address2(request.getParameter("member_address2"));
		mDTO.setMember_phone(request.getParameter("member_phone"));
		mDTO.setMember_email(request.getParameter("member_email"));
		
		result = mDAO.insertMember(mDTO);
	
		if(result==0){
			System.out.println("Faile");
		}else{
			System.out.println("Sucsses");
		}
		
		forward.setRedirect(true);
		forward.setPath("MemberLogin.me");
		return forward;
	}
}
