package net.member.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberLogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		session.removeAttribute("member_id");
		Cookie[] cookie = request.getCookies();
		if(cookie != null){
			for(int i=0; i<cookie.length; i++){
				if(cookie[i].getName().startsWith("auto")){
					cookie[i].setMaxAge(0);
					cookie[i].setPath("/");
					response.addCookie(cookie[i]);
				}
			}
		}
		
		forward.setRedirect(true);
		forward.setPath("Main.fp");
		return forward;
	}

}
