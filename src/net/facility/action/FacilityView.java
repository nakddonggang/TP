package net.facility.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.facility.db.FacilityDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class FacilityView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FacilityView execute()");
		request.setCharacterEncoding("utf-8");
		
		String num = request.getParameter("facil_num");
		String change = "";
		System.out.println(num.substring(0,1));
		switch(num.substring(0,1)) {
		case "A" :
			change = num.replace("A", "0");
			System.out.println(change);
			break;
		case "B" :
			change = num.replace("B", "1");
			System.out.println(change);
			break;
		case "C" :
			change = num.replace("C", "2");
			System.out.println(change);
			break;
		case "D" :
			change = num.replace("D", "3");
			System.out.println(change);
			break;
			default :
				change = num.replace("E", "4");
				System.out.println(change);
		}
		FacilityDTO fDTO = new FacilityDTO();
		FacilityDAO fDAO = new FacilityDAO();
		System.out.println("change : " + Integer.parseInt(change));
		fDTO = fDAO.getFacilityDetail(Integer.parseInt(change));
		request.setAttribute("fDTO", fDTO);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./service/serveFacilView.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
