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
		request.setCharacterEncoding("utf-8");
		
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = new MemberDTO();
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		String member_id = (String)session.getAttribute("member_id");
		if(member_id==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		int basket_number = mDAO.basketMaxNum()+1;
		mDTO.setMember_id(member_id);
		mDTO.setBasket_number(basket_number);
		mDTO.setBook_number(Integer.parseInt(request.getParameter("book_number")));
		mDAO.insertBasket(mDTO);
		
		forward.setPath("./MemberBasketList.me");
	    forward.setRedirect(true);
	    
	    return forward;
	}
}