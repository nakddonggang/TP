package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

public class BoardCurUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardCurUpdate execute()");
		request.setCharacterEncoding("utf-8");
		
		int cur_num = Integer.parseInt(request.getParameter("cur_num"));
		String pageNum = request.getParameter("pageNum");
		String table = "curation";
		String column = "cur_num";
		
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = bDAO.getBoard(table, column, cur_num);
		
		request.setAttribute("bDTO", bDTO);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardCuUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}