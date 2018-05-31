package net.board.action;

import java.io.PrintWriter;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonValue;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		BoardDAO bDAO = new BoardDAO();
		List<BoardDTO> list = bDAO.selectFaqType(faq_type);
		System.out.println(list.size());
		JsonArray arr = null;
		JsonObject json = null;
		String result = "";
		
		for(int i=0; i<list.size(); i++){
			BoardDTO bDTO = list.get(i);
			if(bDTO.getFaq_file() == null){
				json = Json.createObjectBuilder()
						.add("faq_num", bDTO.getFaq_num())
						.add("faq_type", bDTO.getFaq_type())
						.add("faq_subject", bDTO.getFaq_subject())
						.add("faq_content", bDTO.getFaq_content())
						.add("faq_file", JsonValue.NULL).build();
			}else{
				json = Json.createObjectBuilder()
					     .add("faq_num", bDTO.getFaq_num())
					     .add("faq_type", bDTO.getFaq_type())
					     .add("faq_subject", bDTO.getFaq_subject())
					     .add("faq_content", bDTO.getFaq_content())
					     .add("faq_file", bDTO.getFaq_file()).build();
			}
			System.out.println(json);
			result += json.toString();
			if(i != list.size()-1)	result += ",";
		}
		System.out.println(result);
		arr = Json.createArrayBuilder().add(result).build();
		System.out.println(arr);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(arr);
		out.flush();
		out.close();
		
		return null;
	}
}