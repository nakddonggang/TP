package net.facility.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.facility.db.FacilityDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class FacilityInfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FacilityInfo execute()");
		FacilityDTO fDTO = new FacilityDTO();
		FacilityDAO fDAO = new FacilityDAO();
		List<FacilityDTO> Facilitylist = fDAO.getFacilityList();
		
		request.setAttribute("Facilitylist" , Facilitylist);
		ActionForward forward = new ActionForward();
		forward.setPath("./service/serveFacil.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
