package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminMemberIndex implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMemberIndex execute()");
		request.setCharacterEncoding("utf-8");
		
		AdminDAO adao = new AdminDAO();
		List<MemberDTO> memberList = null;

		String member_level = request.getParameter("member_level");	if(member_level==null) member_level="%";
		String pageNum = request.getParameter("pageNum");	if(pageNum == null) pageNum = "1";
		int count = adao.getMemberCount(member_level);
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;	
		int pageCount = count/pageSize+(count%pageSize==0? 0:1);
		int pageBlock = 10;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage+pageBlock-1;	if(endPage > pageCount)	endPage = pageCount;
		
		if(count !=0)	memberList = adao.getMemberList(member_level, startRow, pageSize);
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("memberList", memberList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admMemIndex.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
