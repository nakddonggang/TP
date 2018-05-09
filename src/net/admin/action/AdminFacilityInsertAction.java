package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminFacilityInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminFacilityInsert execute()");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		AdminDAO aDAO =  new AdminDAO();
		FacilityDTO fDTO = new FacilityDTO();
		
		int result;
		fDTO.setFacil_num(request.getParameter("facil_num"));
		fDTO.setFacil_type(request.getParameter("facil_type"));
		fDTO.setFacil_use("0");
		result = aDAO.insertFacility(fDTO);
		System.out.println(result);
		if(result==0){
			System.out.println("Faile");
		}else{
			System.out.println("Sucsses");
		}
		
		forward.setPath("./AdminIndex.am");
		forward.setRedirect(true);
		return forward;
	}

}
