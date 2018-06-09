package net.board.action;

import java.io.PrintWriter;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
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

		if(selected == null) selected = "all";
		String faq_type = "";
		
		/****** 리스트 처리 ******/
		if(selected.equals("all")){
			faq_type = "all";
		}else if(selected.equals("book")){
			faq_type = "대출/반납/예약";
		}else if(selected.equals("buy")){
			faq_type = "자료구입";
		}else if(selected.equals("library")){
			faq_type = "도서관 이용";
		}

		BoardDAO bDAO = new BoardDAO();
		int count = bDAO.countFaqType(faq_type);
		
		/****** 페이징 처리 ******/
		int pageSize=5;
		String pageNum=request.getParameter("pageNum");

		if(pageNum==null) pageNum="1";
		
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		
		int pageCount =count/pageSize+(count%pageSize==0? 0:1);
		int pageBlock=10;
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		List<BoardDTO> list = bDAO.selectFaqType(faq_type, startRow, pageSize);
		
		/****** JSON ******/
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
				result += json.toString();
			}else{
				json = Json.createObjectBuilder()
					     .add("faq_num", bDTO.getFaq_num())
					     .add("faq_type", bDTO.getFaq_type())
					     .add("faq_subject", bDTO.getFaq_subject())
					     .add("faq_content", bDTO.getFaq_content())
					     .add("faq_file", bDTO.getFaq_file()).build();
				result += json.toString();
			}
			if(i != list.size()-1)	result += ",";
		}
		if(list.size()==0){
			arr = Json.createArrayBuilder().add("{\"count\":"+count+"}").add("{\"pageNum\":"+pageNum+"}")
					.add("{\"pageCount\":"+pageCount+"}").add("{\"pageBlock\":"+pageBlock+"}").add("{\"startPage\":"+startPage+"}")
					.add("{\"endPage\":"+endPage+"}").build();
		}else{
			arr = Json.createArrayBuilder().add(result).add("{\"count\":"+count+"}").add("{\"pageNum\":"+pageNum+"}")
					.add("{\"pageCount\":"+pageCount+"}").add("{\"pageBlock\":"+pageBlock+"}").add("{\"startPage\":"+startPage+"}")
					.add("{\"endPage\":"+endPage+"}").build();
		}

		request.setAttribute("pageNum", pageNum);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(arr);
		out.flush();
		out.close();
		
		return null;
	}
}