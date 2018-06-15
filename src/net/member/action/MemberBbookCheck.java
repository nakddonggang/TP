package net.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberBbookCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberBbookCheck() execute");
		request.setCharacterEncoding("utf-8");
		String member_id = request.getParameter("member_id");
		MemberDAO mDAO = new MemberDAO();
		int check = mDAO.memberBbookCheck(member_id);
		List<BookDTO> rList = mDAO.myRbook(member_id);
		JsonObject obj = null;
		JsonArray arr = null;
		String result = "";
		System.out.println("rList size : "+rList.size());
		
		for(int i=0; i<rList.size(); i++){
			BookDTO bDTO = rList.get(i);
			obj = Json.createObjectBuilder().add("book_subject", bDTO.getBook_subject()).build();
			result += obj.toString();
			if(i != rList.size()-1)	result += ",";
		}
		
		if(rList.size()==0)	arr = Json.createArrayBuilder().add("{\"check\":"+check+"}").build();
		else arr = Json.createArrayBuilder().add(result).add("{\"book_count\":"+rList.size()+"}").add("{\"check\":"+check+"}").build();
		System.out.println(arr);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(arr);
		out.flush();
		out.close();
		return null;
	}
}