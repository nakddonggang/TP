package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardQnaUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDTO bDTO = new BoardDTO();
		bDTO.setQna_num(num);
		bDTO.setQna_subject(request.getParameter("qna_subject"));
		bDTO.setQna_content(request.getParameter("qna_content"));
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.updateQna(bDTO);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardQnaList.qn?pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}	
}