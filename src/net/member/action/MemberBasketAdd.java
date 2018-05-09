package net.member.action;

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
		
int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO bDAO = new MemberDAO();
		MemberDTO bDTO = new MemberDTO();
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		String id = (String)session.getAttribute("id");
		if(id==null){
			forward.setPath("./MemberBasketAdd.me");
			forward.setRedirect(true);
			return forward;
		}
		
		bDTO.setBasket_number(Integer.parseInt(request.getParameter("basket_number")));
		bDTO.setBook_number(Integer.parseInt(request.getParameter("book_number")));
		
		
		
		forward.setPath("./MemberBasketList.me");
	      forward.setRedirect(true);
	      return forward;
	}

}
