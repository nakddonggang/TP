package net.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class AdminFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 가상주소 뽑아오기
		String requestURI = request.getRequestURI();
		System.out.println("requestURI주소 : "+requestURI);

		String contextPath = request.getContextPath();
		System.out.println("contextPath 경로 : "+contextPath);
		System.out.println("contextPath 경로 길기 : "+contextPath.length());

		String command = requestURI.substring(contextPath.length());
		System.out.println("command - 뽑아온 가상주소 경로 : "+command);
		
		// 뽑아온 주소 비교
		ActionForward forward = null;
		Action action = null;
		if (command.equals("/AdminIndex.am")){
			action = new AdminIndex();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}			
		} else if (command.equals("/AdminBookWrite.am")){
			forward = new ActionForward();
			forward.setPath("./admin/admBookIOWrite.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/AdminBookWriteAction.am")){
			action = new AdminBookWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}				
		} else if (command.equals("/AdminBookIO.am")){
			action = new AdminBookIO();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}			
		} else if (command.equals("/AdminBookInfo.am")){
			action = new AdminBookInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}			
		} else if (command.equals("/AdminBookDLosWrite.am")){
			forward = new ActionForward();
			forward.setPath("./admin/admBookDLosWrite.jsp");
			forward.setRedirect(false);			
		} else if (command.equals("/AdminBookDLosWriteAction.am")){
			action = new AdminBookDLosWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}				
		} else if (command.equals("/AdminBookDLos.am")){
			action = new AdminBookDLos();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}						
		} else if (command.equals("/AdminBookRes.am")){
			action = new AdminBookRes();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
		} else if (command.equals("/AdminMemberIndex.am")){
			action = new AdminMemberIndex();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}						
		} else if (command.equals("/AdminMemberInfo.am")){
			action = new AdminMemberInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}						
		} else if (command.equals("/AdminMemberGood.am")){
			action = new AdminMemberGood();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}						
		}else if (command.equals("/AdminMemberBlack.am")){
			action = new AdminMemberBlack();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}						
		}else if (command.equals("/AdminMemberNormal.am")){
			action = new AdminMemberNormal();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}						
		}    
		
		// 이동
		if (forward!=null){
			if (forward.isRedirect())
				response.sendRedirect(forward.getPath());
			else {
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
