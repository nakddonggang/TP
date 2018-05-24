package net.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberBasketAdd implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();

		String member_id = (String)session.getAttribute("member_id");
		String[] checkbox = request.getParameterValues("basket_check");
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = new MemberDTO();
		
		if(member_id==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		for(int i=0; i<checkbox.length; i++){
			mDTO.setMember_id(member_id);
			mDTO.setBasket_number(mDAO.basketMaxNum()+1);
			mDTO.setBook_number(Integer.parseInt(checkbox[i]));
			mDAO.insertBasket(mDTO);
		}
		
		forward.setPath("./BookIndex.bk");
	    forward.setRedirect(true);
	    
	    return forward;
	}
}