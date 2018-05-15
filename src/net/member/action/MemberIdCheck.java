package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberIdCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Idcheck start");
		request.setCharacterEncoding("utf-8");
		String member_id = (String)request.getParameter("member_id");
		int check = 0;
		MemberDAO mDAO = new MemberDAO();
		check = mDAO.MemberIdCheck(member_id);
		System.out.println("check : "+check);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(check);
		out.close();
		return null;
	}

}
