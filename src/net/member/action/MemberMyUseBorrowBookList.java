package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberMyUseBorrowBookList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberMyUseBorrowBookList execute()");
		HttpSession session = request.getSession();
		String member_id=(String)session.getAttribute("member_id");
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
	
		MemberDAO mDAO = new MemberDAO();
		
		
		List<BookDTO> bbList = null;
		
		bbList=mDAO.myUseBorrowBookList(member_id);
		
		request.setAttribute("bbList", bbList);
		forward.setPath("./member/myUseBorrowBookList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
