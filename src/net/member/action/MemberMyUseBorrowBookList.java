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
		
		
		
		
		String pageNum=request.getParameter("pageNum");
	    if(pageNum==null) {pageNum="1";}
	    
	    int pageSize = 10;
	    int pageBlock=5;
	    
		int startRow = (Integer.parseInt(pageNum)-1)*pageSize+1;
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
	
		MemberDAO mDAO = new MemberDAO();
		int count = mDAO.BorrowBookCountList(member_id);
		List<BookDTO> bbList = null;
		if(count != 0){
			bbList=mDAO.myUseBorrowBookList(startRow, pageSize , member_id);
		}
		int pageCount =count/pageSize+(count%pageSize==0? 0:1);
		int startPage=((Integer.parseInt(pageNum)-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("startRow", startRow);
		request.setAttribute("count", count);
		request.setAttribute("bbList", bbList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		forward.setPath("./member/myUseBorrowBookList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
