package net.main.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;



public class MainFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI= request.getRequestURI();
		System.out.println("URI주소: " + requestURI);
		
		String contextPath = request.getContextPath();
		System.out.println("컨텍스트 경로: " + contextPath);
		
		String command=requestURI.substring(contextPath.length());
		System.out.println("뽑아온 가상주소 경로: " + command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/Main.fp")){
			forward = new ActionForward();
			forward.setPath("main/main.jsp");
			forward.setRedirect(false);
		}
//		if(command.equals("/MemberJoinAction.me")) {
//			action = new MemberJoinAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
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
