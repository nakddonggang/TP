package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminFacilSuggUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String facil_num =request.getParameter("facil_num");
		int facilList_size =Integer.parseInt(request.getParameter("facilList_size")); 
	
		
		
		FacilityDTO fDTO = new FacilityDTO();
		fDTO.setFacil_num(request.getParameter("facil_num"));
		fDTO.setFacil_use(request.getParameter("facil_use"));
		
		for(int i=0; i < facilList_size; i++){
			fDTO.setObj_mname(request.getParameter("obj_mname"+i));
			fDTO.setObj_condition(request.getParameter("obj_condition"+i));
			fDTO.setObj_d_reason(request.getParameter("obj_d_reason"+i));
		
			AdminDAO adao = new AdminDAO();
			adao.updateFacilSugg(fDTO);
		
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admFacilSugg.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
