package net.board.action;

import java.util.Date;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardQnaWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = new BoardDTO();
		
		ActionForward forward = new ActionForward();
		
		int qna_num = bDAO.selectQMaxNum()+1;
		
		bDTO.setQna_num(qna_num);
		bDTO.setMember_id(member_id);
		bDTO.setQna_subject(request.getParameter("qna_subject"));
		bDTO.setQna_content(request.getParameter("qna_content"));
		bDTO.setQna_date(new Date(System.currentTimeMillis()));
		bDTO.setQna_readcount(0);
		bDTO.setQna_ref(qna_num);
		bDTO.setQna_check("0");
		
		bDAO.insertQna(bDTO);

		forward.setPath("./BoardQnaList.qn");
		forward.setRedirect(true);
		
		return forward;
	}
}