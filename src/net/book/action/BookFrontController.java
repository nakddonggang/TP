package net.book.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BookFrontController extends HttpServlet{
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
				
				
				if (command.equals("/BookInfo.bk")){
					action = new BookInfo();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {e.printStackTrace();}			
				}else if(command.equals("/BookPopular.bk")){
					action = new BookPopular();
					try{
						forward = action.execute(request, response);
					}catch(Exception e){
						e.printStackTrace();
					}
				}else if(command.equals("/BookNew.bk")){
					action = new BookNew();
					try{
						forward = action.execute(request, response);
					}catch(Exception e){
						e.printStackTrace();
					}
				}else if(command.equals("/BookSearch.bk")){
					action = new BookSearch();
					try{
						forward = action.execute(request, response);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
		
		
		
		
		
		
		
		
		
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
