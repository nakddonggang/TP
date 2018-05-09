package net.facility.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.facility.db.FacilityDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class FacilityUnUseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FacilityUnUseAction execute()");
		String facil_num = request.getParameter("facil_num");
		int check = Integer.parseInt(request.getParameter("facil_use"))-1;
		System.out.println("check : " + check);
		
		FacilityDAO fDAO = new FacilityDAO();
		FacilityDTO fDTO = new FacilityDTO();
		fDAO.UnUseFacility(facil_num, Integer.toString(check));
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Facility.fy");
		forward.setRedirect(true);
		return forward;
	}

}
