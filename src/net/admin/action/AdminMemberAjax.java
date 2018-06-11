package net.admin.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminMemberAjax implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMemberAjax execute()");
		request.setCharacterEncoding("utf-8");
		
		AdminDAO adao = new AdminDAO();
		List<MemberDTO> memberList = null;

		String member_level = request.getParameter("member_level");	if(member_level==null) member_level="%";
		String pageNum = request.getParameter("pageNum");	if(pageNum == null) pageNum = "1";
		int count = adao.getMemberCount(member_level);
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;	
		int pageCount = count/pageSize+(count%pageSize==0? 0:1);
		int pageBlock = 10;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage+pageBlock-1;	if(endPage > pageCount)	endPage = pageCount;
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		if(count !=0)	memberList = adao.getMemberList(member_level, startRow, pageSize);
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		JsonArray arr = null;
		JsonObject obj = null;
		String result = "";
		if(memberList != null){
			for(int i=0; i<memberList.size(); i++){
				MemberDTO mDTO = memberList.get(i);
				String member_date = transFormat.format(mDTO.getMember_date());
				obj = Json.createObjectBuilder()
						.add("member_id", mDTO.getMember_id())
						.add("member_pass", mDTO.getMember_pass())
						.add("member_name", mDTO.getMember_name())
						.add("member_post", mDTO.getMember_post())
						.add("member_address1", mDTO.getMember_address1())
						.add("member_address2", mDTO.getMember_address2())
						.add("member_phone", mDTO.getMember_phone())
						.add("member_email", mDTO.getMember_email())
						.add("member_date", member_date)
						.add("member_level", mDTO.getMember_level())
						.add("borrow_count", mDTO.getBorrow_count())
						.add("gm_check", mDTO.getGm_check())
						.add("bl_count", mDTO.getBl_count())
						.add("bl_date", mDTO.getBl_date())
						.add("bl_check", mDTO.getBl_check())
						.build();
				result += obj.toString();
				if(i != memberList.size()-1)	result += ",";
			}
			arr = Json.createArrayBuilder().add(result).add("{\"count\":"+count+"}").add("{\"pageNum\":"+pageNum+"}")
					.add("{\"pageCount\":"+pageCount+"}").add("{\"pageBlock\":"+pageBlock+"}").add("{\"startPage\":"+startPage+"}")
					.add("{\"endPage\":"+endPage+"}").build();
		}else{
			arr =Json.createArrayBuilder().add("{\"count\":"+count+"}").add("{\"pageNum\":"+pageNum+"}")
					.add("{\"pageCount\":"+pageCount+"}").add("{\"pageBlock\":"+pageBlock+"}").add("{\"startPage\":"+startPage+"}")
					.add("{\"endPage\":"+endPage+"}").build(); 
		}
		System.out.println(arr);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(arr);
		out.flush();
		out.close();
		return null;
	}	
}