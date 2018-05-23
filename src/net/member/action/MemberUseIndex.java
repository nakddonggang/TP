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
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		if(member_id == null) {
			response.sendRedirect("./MemberLogin.me");
		}
		
		int pageSize = 5;	//한 화면에 보여줄 글 개수 설정
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		String pageNum2=request.getParameter("pageNum2");
		if(pageNum2==null) pageNum2="1";

		int currentPage = Integer.parseInt(pageNum);
		int currentPage2 = Integer.parseInt(pageNum2);
		int startRow = (currentPage-1)*pageSize+1;	// 페이지 첫 행 구하기
		int startRow2 = (currentPage2-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int endRow2=currentPage2*pageSize;
		
		MemberDAO mDAO = new MemberDAO();
		List<BookDTO> bList = null;
		List<BookDTO> bList2 = null;
		
		int count = mDAO.useBbookMemberCount(member_id);
		int count2 = mDAO.ReservationBookMemberCount(member_id);
		int pageCount =count/pageSize+(count%pageSize==0? 0:1);
		int pageCount2 = count2/pageSize+(count2%pageSize==0? 0:1);
		int pageBlock=5;
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		int startPage2=((currentPage2-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int endPage2=startPage+pageBlock-1;
		if(endPage>pageCount) endPage=pageCount;
		if(endPage2>pageCount2) endPage2=pageCount2;
		
		bList = mDAO.MemberMyUseBookList(member_id, startRow-1, endRow);
		bList2 = mDAO.ReservationBookMemberList(member_id, startRow2-1, endRow2);
		request.setAttribute("bList", bList);
		request.setAttribute("bList2", bList2);
		request.setAttribute("count", count);
		request.setAttribute("count2", count2);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageNum2", pageNum2);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageCount2", pageCount2);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("startPage2", startPage2);
		request.setAttribute("endPage", endPage);
		request.setAttribute("endPage2", endPage2);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/myUseIndex.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
