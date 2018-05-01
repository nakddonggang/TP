package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;


public class MemberFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI= request.getRequestURI();
		System.out.println("URI주소: " + requestURI);
		
		String contextPath = request.getContextPath();
		System.out.println("컨텍스트 경로: " + contextPath);
		
		String command=requestURI.substring(contextPath.length());
		System.out.println("뽑아온 가상주소 경로: " + command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/MemberJoin.me")) {
			forward = new ActionForward();
			forward.setPath("./member/memberInsert.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogin.me")) {
			forward = new ActionForward();
			forward.setPath("./member/memberLogin.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberLoginAction.me")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberInfo.me")) {
			action = new MemberInfo();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			} // try_catch end
		}else if(command.equals("/MemberUpdate.me")) {
			action = new MemberUpdate();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			} // try_catch end
		} else if(command.equals("/MemberDelete.me")) {
			forward = new ActionForward();
			forward.setPath("./member/memberDelete.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/MemberDeleteAction.me")) {
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberUpdate.me")) {
			action = new MemberUpdate();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberUpdateAction.me")) {
			action = new MemberUpdateAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogout.me")){
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
}
