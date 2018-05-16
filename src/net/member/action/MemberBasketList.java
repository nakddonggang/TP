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

public class MemberBasketList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		HttpSession session =request.getSession();
		String member_id =(String)session.getAttribute("member_id");
		if(member_id==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mDAO = new MemberDAO();		
		List<MemberDTO> bList=mDAO.MemberBasketList(member_id);	
		request.setAttribute("bList", bList);

		forward.setPath("./member/myUseBasket.jsp");
	    forward.setRedirect(false);
	    return forward;
	}

}
