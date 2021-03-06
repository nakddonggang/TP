package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BorrowBookAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BorrowBookAction execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		int bbookMaxNumber = 0;
		int book_number = Integer.parseInt(request.getParameter("book_number"));
		
		MemberDAO mDAO = new MemberDAO();
		BookDTO bDTO = new BookDTO();
		int check = mDAO.userBorrowBookCount(member_id);
		bbookMaxNumber = mDAO.HistoryMaxNumber()+1;
		bDTO.setMember_id(member_id);
		bDTO.setBook_number(book_number);
		bDTO.setBbook_number(bbookMaxNumber);
		System.out.println("int bbookMaxNumber : "+bbookMaxNumber);
		
		System.out.println("check = "+check);
		if(check >= 5) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
			out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
			out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
			out.print("<script src='./js/jquery-ui.min.js'></script>");
			out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function() { ");
			out.println("$.Alert('대출할 수 있는 권수를 초과하였습니다. 반납하고 이용해 주세요.' , function(){"
					+ "location.href = './BookIndex.bk'"
					+ "});");
			out.println("});");
			out.println("</script>");
			out.close();
		} else {
		mDAO.HistoryInsertBorrowBook(bDTO);	// 전체대출테이블 insert
		mDAO.insertBbook(bDTO);				// 대출테이블에 insert
		mDAO.updateRbook(book_number);		// 예약대기순위 1 감소
		}
		mDAO.deleteRbook();					// 예약대기순위 0인것 예약테이블에서 삭제
		mDAO.updateRbookCheck();
		mDAO.updateRbookCheck2();			// rbook_num < 3 인것들 예약가능으로 수정
		
		forward.setPath("./MemberUseIndex.me");
		forward.setRedirect(true);
		
		return forward;
	}
}