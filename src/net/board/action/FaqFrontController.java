package net.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FaqFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 가상주소 뽑아오기
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println("뽑아온 가상주소 : "+command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/BoardFaqWrite.bo")){
			forward = new ActionForward();
			forward.setPath("./board/boardFWrite.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/BoardFaqWriteAction.bo")){
			action = new BoardFaqWriteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/BoardFaqList.bo")){
			action = new BoardFaqList();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/BoardFaqUpdate.bo")){
			action = new BoardFaqUpdate();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/BoardFaqUpdateAction.bo")){
			action = new BoardFaqUpdateAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/BoardFaqDelete.bo")){
			forward = new ActionForward();
			forward.setPath("./board/boardFDelete.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/BoardFaqDeleteAction.bo")){
			action = new BoardFaqDeleteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			if(forward.isRedirect){
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
