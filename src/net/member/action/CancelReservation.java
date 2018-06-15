package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class CancelReservation implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)	pageNum="1";
		String member_id = (String)session.getAttribute("member_id");
		int book_number = Integer.parseInt(request.getParameter("book_number"));
		
		MemberDAO mDAO = new MemberDAO();
		int rbook_num = mDAO.selectRbookNum(member_id, book_number);	// 취소하는 행의 rbook_num 조회
		mDAO.cancelRes(member_id, book_number);							// 예약 테이블에서 삭제
		mDAO.updateRbookNum(book_number, rbook_num);					// 이후의 해당책 rbook_num들 -1 해줌
		mDAO.updateRbookCheck2();
		mDAO.updateRbookCheck();
		
		forward.setPath("./MemberMyUseRBookList.me?pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}
}