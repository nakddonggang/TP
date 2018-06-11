package net.board.action;

import java.io.PrintWriter;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardNoticeAjax implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String table = "notice";
		JsonArray arr = null;
		JsonObject json = null;
		String result = "";
		
		BoardDAO bDAO = new BoardDAO();
		List<BoardDTO> list = bDAO.selectList(table, "%"+search+"%");
		
		for(int i=0; i<list.size(); i++){
			BoardDTO bDTO = list.get(i);
			json = Json.createObjectBuilder()
					 .add("notice_subject", bDTO.getNotice_subject()).build();
			result += json.toString();
			if(i != list.size()-1)	result += ",";
		}
		arr = Json.createArrayBuilder().add(result).build();

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(arr);
		out.flush();
		out.close();
		
		return null;
	}	
}