package net.facility.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.facility.db.FacilityDAO;
import net.facility.db.FacilityDTO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class FacilityView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FacilityView execute()");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");

		FacilityDAO fDAO = new FacilityDAO();
		FacilityDTO fDTO = new FacilityDTO();
		fDTO = fDAO.getFacilityDetail(member_id);
		
		request.setAttribute("fDTO", fDTO);
		ActionForward forward = new ActionForward();
		forward.setPath("./service/serveFacilView.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
