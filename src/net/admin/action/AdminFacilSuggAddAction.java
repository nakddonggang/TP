package net.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.db.AdminDAO;
import net.facility.db.FacilityDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminFacilSuggAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int result =0;
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String facil_num = request.getParameter("facil_num");
		String obj_mname = request.getParameter("obj_mname");
		System.out.println("obj : "+obj_mname);
		System.out.println("facil : "+facil_num);
		FacilityDTO fDTO = new FacilityDTO();
		fDTO.setFacil_num(facil_num);
		fDTO.setObj_mname(obj_mname);
		
		AdminDAO adao = new AdminDAO();
		result = adao.insertSeat(fDTO);
		if(result == 1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
		return null;
	}
	
}
