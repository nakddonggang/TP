package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AcceptResBook implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AcceptResBook execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		int book_number = 2;
		
		MemberDAO mDAO = new MemberDAO();
		BookDTO bDTO = new BookDTO();
		bDTO.setMember_id(member_id);
		bDTO.setBook_number(book_number);
		mDAO.insertBbook(bDTO);				// 대출테이블에 insert
		mDAO.updateRbook(book_number);		// 예약대기순위 1 감소
		mDAO.deleteRbook();					// 예약대기순위 0인것 예약테이블에서 삭제
		mDAO.updateRbookCheck();
		mDAO.updateRbookCheck2();
		
		forward.setPath("./MemberBasketList.me");
		forward.setRedirect(true);
		
		return forward;
	}
}