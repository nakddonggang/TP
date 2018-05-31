package net.board.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardQnaAjax implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String table = "qna";
		JSONArray arr = new JSONArray();
		BoardDAO bDAO = new BoardDAO();
		List<BoardDTO> list = bDAO.selectList(table, "%"+search+"%");
		for(int i=0; i<list.size(); i++){
			BoardDTO bDTO = list.get(i);
			JSONObject obj = new JSONObject();
			obj.put("qna_subject", bDTO.getQna_subject());
			arr.add(obj);
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(arr);
		out.flush();
		out.close();
		
		return null;
	}	
}