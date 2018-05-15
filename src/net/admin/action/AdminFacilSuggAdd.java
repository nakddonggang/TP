package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminFacilSuggAdd implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String facil_num = request.getParameter("facil_num");

		AdminDAO adao = new AdminDAO();
		
		List<FacilityDTO> facilList = adao.getFacilAddList();
		
		request.setAttribute("facilList", facilList);
		request.setAttribute("facil_num", facil_num);
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admFacilSuggAdd.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
