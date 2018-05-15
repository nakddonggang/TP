package net.admin.action;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminFacilSuggInfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		String facil_num = request.getParameter("facil_num");
		AdminDAO adao = new AdminDAO();
		FacilityDTO fDTO = adao.getFacility(facil_num);
		String facil_use = fDTO.getFacil_use();

		int pageSize = 5;

		// 페이지 번호 (PageNum)
		String pageNum = request.getParameter("pageNum");
		// 페이지 번호 없으면 무조건 "1" 페이지 설정
		if (pageNum == null)
			pageNum = "1";

		// 10개씩 게시판 글을 분류했을 때,
		int currentPage = Integer.parseInt(pageNum);
		// 첫 번째 페이지 첫행 구하기
		// 1page - 1 / 2page - 11 / 3page - 21
		int startRow = (currentPage - 1) * pageSize + 1;
		// 페이지 마지막행 구하기
		// 1page - 10 / 2page - 20 / 3page - 30
		int endRow = pageSize * currentPage;

		
		
		List<FacilityDTO> facilList = adao.getFacilList(facil_num,startRow, pageSize);
		
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("facilList", facilList);
     	request.setAttribute("facil_use", facil_use);
     	request.setAttribute("facil_num", facil_num);
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admFacilSuggInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
