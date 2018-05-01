package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginAction execute()");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDAO mDAO = new MemberDAO();
		ActionForward forward = new ActionForward();
		
		String member_id=request.getParameter("member_id");
		String member_pass=request.getParameter("member_pass");
		System.out.println(member_id);
		System.out.println(member_pass);
		
		int check = mDAO.selectUserChk(member_id, member_pass);
		
		if(check == 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('비밀번호 틀림');");
			out.print("location.href='./MemberLogin.me';");
			out.print("</script>");
			out.close();
			return null;
		}else if(check == -1){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('아이디 틀림');");
			out.print("location.href='./MemberLogin.me';");
			out.print("</script>");
			out.close();
			return null;
		}
		
		session.setAttribute("member_id", member_id);
		
		forward.setRedirect(true);
		forward.setPath("Main.fp");
		return forward;
	}

}
