package net.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.db.AdminDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminFacilUseButton implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminFacilUseButton execute()");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String facil_num = request.getParameter("facil_num");
		String facil_use = request.getParameter("facil_use");
		System.out.println("facil_num : " + facil_num);
		System.out.println("facil_use : " + facil_use);
		
		if(facil_use.equals("0")) {
			facil_use = "2";
			System.out.println("change facil_use : " + facil_use);
		} else if(facil_use.equals("1")) {
			facil_use = "1";
			System.out.println("change facil_use : " + facil_use);
		} else if(facil_use.equals("2")) {
			facil_use = "0";
			System.out.println("change facil_num : " + facil_use);
		}
		
		int result = 0;
		AdminDAO aDAO = new AdminDAO();
		result = aDAO.ajaxFacil_useUpdateButton(facil_use, facil_num);
		
		if(result == 0) {
			System.out.println("Failed");
		} else if(result == 1){
			System.out.println("Success");
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(facil_use);
		out.close();
		return null;
	}

}
