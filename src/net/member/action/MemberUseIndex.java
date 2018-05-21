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

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;	// 페이지 첫 행 구하기
		int endRow=currentPage*pageSize;
		
		MemberDAO mDAO = new MemberDAO();
		List<BookDTO> bList = null;
		
		int count = mDAO.useBbookMemberCount(member_id);
		int pageCount =count/pageSize+(count%pageSize==0? 0:1);
		int pageBlock=10;
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		bList = mDAO.MemberMyUseBookList(member_id, startRow, endRow);
		request.setAttribute("bList", bList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/myUseIndex.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
