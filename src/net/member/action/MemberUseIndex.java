package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberUseIndex implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUseIndex execute()");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		if(member_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mDAO = new MemberDAO();
		List<BookDTO> bList = null;
		List<BookDTO> bList2 = null;
		
		bList = mDAO.MemberMyUseBookList(member_id, 0, 5);
		bList2 = mDAO.ReservationBookMemberList(member_id, 0, 5);
		request.setAttribute("bList", bList);
		request.setAttribute("bList2", bList2);
		
		forward.setPath("./member/myUseIndex.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
