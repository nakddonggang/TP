package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

public class BoardFaqWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardFaqWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		BoardDTO bDTO=new BoardDTO();
		BoardDAO bDAO=new BoardDAO();
		ActionForward forward=new ActionForward();
		
		int faq_num;
		int result;
		
		
		bDTO.setFaq_num(Integer.parseInt(request.getParameter("faq_num")));
		bDTO.setFaq_type(request.getParameter("faq_type"));
		bDTO.setFaq_subject(request.getParameter("faq_subject"));
		bDTO.setFaq_content(request.getParameter("faq_content"));
		bDTO.setFaq_file(request.getParameter("faq_file"));
		
		
		bDAO.insertFaq(bDTO);
		
	
	
		forward.setPath("./BoardFaqList.bo");
		forward.setRedirect(true);
		
		return forward;
	}
  
}
