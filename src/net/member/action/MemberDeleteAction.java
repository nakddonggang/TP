package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteAction execute()");
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = (String)session.getAttribute("member_id");
		String pass = request.getParameter("pass");
		
		MemberDAO mDAO = new MemberDAO();
		int check = mDAO.selectUserChk(id , pass);
		
		switch(check) {
		case 1:
			mDAO.DeleteMember(id, pass);
			out.print("<script>");
			out.print("alert('삭제되었습니다.');");
			out.print("location.href='./MemberLogin.me';");
			out.print("</script>");
			out.close();
		default :
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않음');");
			out.print("location.href='./MemberDelete.me';");
			out.print("</script>");
			out.close();
		}
		
		return null;
	}

}
