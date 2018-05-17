package net.facility.action;

import java.text.SimpleDateFormat;
import java.util.Date;

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
		String start_time = request.getParameter("facil_stime");
		String facil_num = request.getParameter("facil_num");
		String facil_comment = "";

		
		int check = 0;
		System.out.println("start_time : " + start_time);
		System.out.println("check : " + check);
		
		FacilityDAO fDAO = new FacilityDAO();
		FacilityDTO fDTO = new FacilityDTO();
		
		fDAO.updateHistory_facility(facil_num, Integer.toString(check), facil_comment, start_time);
		System.out.println("사용완료 내역 저장 완료");
		fDAO.UnUseFacility(facil_num, Integer.toString(check));
		
		ActionForward forward = new ActionForward();
		forward.setPath("./FacilityView.fy?facil_num=" + facil_num);
		forward.setRedirect(true);
		return forward;
	}

}
