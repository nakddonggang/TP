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

public class BoardFaqAjax implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String selected = request.getParameter("selected");
		System.out.println(selected);
		String faq_type = "";
		
		if(selected.equals("all")){
			faq_type = "all";
		}else if(selected.equals("book")){
			faq_type = "대출/반납/예약";
		}else if(selected.equals("buy")){
			faq_type = "자료구입";
		}else if(selected.equals("library")){
			faq_type = "도서관 이용";
		}
		System.out.println("ajax page "+faq_type);
		
		JSONArray arr = new JSONArray();
		BoardDAO bDAO = new BoardDAO();
		List<BoardDTO> list = bDAO.selectFaqType(faq_type);
		System.out.println(list.size());
		for(int i=0; i<list.size(); i++){
			BoardDTO bDTO = list.get(i);
			JSONObject obj = new JSONObject();
			obj.put("faq_num", bDTO.getFaq_num());
			obj.put("faq_type", bDTO.getFaq_type());
			obj.put("faq_subject", bDTO.getFaq_subject());
			obj.put("faq_content", bDTO.getFaq_content());
			obj.put("faq_file", bDTO.getFaq_file());
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