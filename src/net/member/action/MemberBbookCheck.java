package net.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberBbookCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberBbookCheck() execute");
		request.setCharacterEncoding("utf-8");
		String member_id = request.getParameter("member_id");
		System.out.println("member_id : "+member_id);
		MemberDAO mDAO = new MemberDAO();
		int check = mDAO.memberBbookCheck(member_id);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(check);
		out.close();
		return null;
	}
}