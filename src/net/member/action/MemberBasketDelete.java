package net.member.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberBasketDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		String[] checkbox = request.getParameterValues("checkbox");
		List list = new ArrayList<>();
		
		if(checkbox==null){
			forward.setPath("./MemberBasketList.me");
			forward.setRedirect(true);
			return forward;
		}
		
		for(int i=0; i<checkbox.length; i++){
			list.add(Integer.parseInt(checkbox[i])); 
		}
		
		MemberDAO mDAO = new MemberDAO();
		mDAO.deleteBasket(list);
		
		forward.setPath("./MemberBasketList.me");
		forward.setRedirect(true);
		
		return forward;
	}
}