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
		String alert = request.getParameter("alert");
		
		HttpSession session =request.getSession();
		String member_id =(String)session.getAttribute("member_id");
		if(member_id==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mDAO = new MemberDAO();		
		List<MemberDTO> bList=mDAO.MemberBasketList(member_id);
		List bbook_bstate = new ArrayList<>();
		List rbook_check = new ArrayList<>();
		
		for(int i=0; i<bList.size();i++){
			MemberDTO mDTO = bList.get(i);
			bbook_bstate.add(mDAO.selectBbook(mDTO.getBook_number()));
			rbook_check.add(mDAO.rbookNumMax(mDTO.getBook_number()));
		}
		request.setAttribute("bList", bList);
		request.setAttribute("bbook_bstate", bbook_bstate);
		request.setAttribute("rbook_check", rbook_check);
		
		if(alert != null){
			request.setAttribute("alert", alert);
		}

		forward.setPath("./member/myUseBasket.jsp");
	    forward.setRedirect(false);
	    return forward;
	}

}
