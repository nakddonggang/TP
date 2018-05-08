package net.facility.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.facility.db.FacilityDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class FacilityUseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FacilityUseAction execute()");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		if(member_id == null) {
			response.sendRedirect("./MemberLogin.me");
		}
		
		int check = Integer.parseInt(request.getParameter("facil_use")+1);
		String facil_num = request.getParameter("facil_num");
		System.out.println("check : " + check);
		
		FacilityDAO fDAO = new FacilityDAO();
		FacilityDTO fDTO = new FacilityDTO();
		fDAO.UseFacility(facil_num, member_id, Integer.toString(check));
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Facility.fy");
		forward.setRedirect(true);
		return forward;
	}

}
