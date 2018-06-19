package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

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
			mDAO.DeleteMember(id);
			session.removeAttribute("member_id");
			out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
			out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
			out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
			out.print("<script src='./js/jquery-ui.min.js'></script>");
			out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function() { ");
			out.println("$.Alert('탈퇴되었습니다.' , function(){"
					+ "location.href = './MemberLogin.me'"
					+ "});");
			out.println("});");
			out.println("</script>");
			out.close();

		default :
			out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
			out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
			out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
			out.print("<script src='./js/jquery-ui.min.js'></script>");
			out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function() { ");
			out.println("$.Alert('비밀번호가 일치하지 않습니다.' , function(){"
					+ "location.href = './MemberDelete.me'"
					+ "});");
			out.println("});");
			out.println("</script>");
			out.close();
		}
		return null;
	}

}
