package net.member.action;

import java.io.PrintWriter;
import java.security.PrivateKey;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginAction execute()");
		request.setCharacterEncoding("UTF-8");
		
        String securedUsername = request.getParameter("securedUsername");
        String securedPassword = request.getParameter("securedPassword");
        String autoLogin = request.getParameter("autoLogin");
        
        DescryptRSA dRSA = new DescryptRSA();
        MemberDAO mDAO = new MemberDAO();
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        Cookie cookie = null;
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.

        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
            String member_id = dRSA.DecryptRsa(privateKey, securedUsername);
            String member_pass = dRSA.DecryptRsa(privateKey, securedPassword);
            
            int check = mDAO.selectUserChk(member_id, member_pass);
            int cookie_time = 60*60*24*7;	// 쿠키 유지시간 7일
    		
    		System.out.println(check);
    		
    		if(check == 0) {
    			response.setContentType("text/html;charset=utf-8");
    			PrintWriter out = response.getWriter();
    			out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
    			out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
    			out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
    			out.print("<script src='./js/jquery-ui.min.js'></script>");
    			out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
    			out.println("<script>");
    			out.println("$(document).ready(function() { ");
    			out.println("$.Alert('비밀번호가 일치하지 않습니다.' , function(){"
    					+ "location.href = './MemberLogin.me'"
    					+ "});");
    			out.println("});");
    			out.println("</script>");
    			out.close();
    			return null;
    		}else if(check == -1){
    			response.setContentType("text/html;charset=utf-8");
    			PrintWriter out = response.getWriter();
    			out.print("<link href='./css/jquery-ui.min.css' rel='stylesheet' type='text/css'>");
    			out.print("<link href='./css/jquery-ui.theme.min.css' rel='stylesheet' type='text/css'>");
    			out.print("<script src='./js/jquery-3.3.1.min.js'></script>");
    			out.print("<script src='./js/jquery-ui.min.js'></script>");
    			out.print("<script src='./js/jQuery.Alert-1.0.js'></script>");
    			out.println("<script>");
    			out.println("$(document).ready(function() { ");
    			out.println("$.Alert('아이디가 일치하지 않습니다.' , function(){"
    					+ "location.href = './MemberLogin.me'"
    					+ "});");
    			out.println("});");
    			out.println("</script>");
    			out.close();
    			return null;
    		}
    		
    		if(autoLogin != null && autoLogin.equals("checked")){
    			cookie = new Cookie("autoMember_id",member_id);
    			cookie.setMaxAge(cookie_time);
    			cookie.setPath("/");
    		}else{
    			cookie = new Cookie("autoMember_id", null);
    			cookie.setMaxAge(0);
    			cookie.setPath("/");
    		}
    		
    		String member_level = mDAO.AdminCheck(member_id);
    		boolean admincheck = false;
    		response.addCookie(cookie);
    		session.setAttribute("member_id", member_id);
    		if(member_level.equals("3")) admincheck = true;
    		else admincheck = false;
    		session.setAttribute("admincheck", admincheck);
            System.out.println("member_id : "+member_id);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        forward.setRedirect(true);
    	forward.setPath("Main.fp");
    	return forward;
    }
}

