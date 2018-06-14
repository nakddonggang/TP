package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminAllFacilitySearch implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		System.out.println("search : "+search);
		AdminDAO aDAO = new AdminDAO();
		int count = aDAO.AdminAllFacilityCount("%"+search+"%");
		System.out.println("count : "+count);
		int pageSize = 10;
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null) pageNum="1";
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)* pageSize+1;
		int endRow = pageSize*currentPage;
		
		List<FacilityDTO> fDTO_List = null;
		if(count != 0) fDTO_List = aDAO.AdminAllFaciliyList2(startRow, pageSize, "%"+search+"%");
		else System.out.println("List 불러오기 실패");
		
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if (endPage>pageCount) {
			endPage=pageCount;	
		}
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("fDTO_List", fDTO_List);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);	
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/AdminAllFacilitySearch.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
