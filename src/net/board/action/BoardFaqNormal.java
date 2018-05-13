package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardFaqNormal implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardFaqNormal execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		BoardDAO bDAO=new BoardDAO();
		int count = bDAO.getFaqCount();
		
		int pageSize=10;
		String pageNum=request.getParameter("pageNum");
		
		if(pageNum==null) {pageNum="1";}
		
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		
		List<BoardDTO> faqList=null;
		
		if(count !=0) {
			faqList=bDAO.getFaqList(startRow, pageSize);
		}
		
		int pageCount =count/pageSize+(count%pageSize==0? 0:1);
		int pageBlock=10;
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("faqList", faqList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		
		forward.setPath("./board/boardFDelete.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}