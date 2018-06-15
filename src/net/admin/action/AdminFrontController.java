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
			forward = new ActionForward();
			forward.setPath("./admin/admBookIndexAJ.jsp");
			forward.setRedirect(false);		
		}  else if (command.equals("/AdminBookIndex.am")){
			action = new AdminBookIndex();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}					
		} else if (command.equals("/AdminBookWrite.am")){
			forward = new ActionForward();
			forward.setPath("./admin/admBookIO.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/AdminBookWriteAction.am")){
			action = new AdminBookWriteAction();
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
		} else if (command.equals("/AdminBookDLosInfo.am")){
			action = new AdminBookDLosInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}						
		} else if (command.equals("/AdminBookRes.am")){
			action = new AdminBookRes();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
		} else if (command.equals("/AdminBookSearch.am")){
			action = new AdminBookSearch();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}	
		} else if (command.equals("/AdminBookReWrite.am")){
			action = new AdminBookReWrite();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}			
		} else if (command.equals("/AdminBookReWriteAction.am")){
			action = new AdminBookReWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}			
		} else if (command.equals("/AdminHBookList.am")){
			action = new AdminHBookList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}				
		} else if (command.equals("/AdminHBookWrite.am")){
			action = new AdminHBookWrite();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}				
		} else if (command.equals("/AdminHBookWriteAction.am")){
			action = new AdminHBookWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}				
		} else if (command.equals("/AdminMemberIndex.am")){
			forward = new ActionForward();
			forward.setPath("./admin/admMemIndex.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/AdminMemberAjax.am")){
			action = new AdminMemberAjax();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
		} else if (command.equals("/AdminMemberInfo.am")){
			action = new AdminMemberInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}						
		}else if(command.equals("/AdminFacilityInsert.am")) {
			forward = new ActionForward();
			forward.setPath("./admin/admFacilityInsert.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/AdminFacilityInsertAction.am")) {
			action = new AdminFacilityInsertAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/AdminFacilSugg.am")){
			forward = new ActionForward();
			forward.setPath("./admin/admFacilSugg.jsp");
			forward.setRedirect(false);			
		}else if(command.equals("/AdminFacilSuggInfo.am")) {
			action = new AdminFacilSuggInfo();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) { e.printStackTrace();}
		}else if(command.equals("/AdminFacilSuggUpdate.am")) {
			action = new AdminFacilSuggUpdate();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) { e.printStackTrace();}
		}else if(command.equals("/AdminFacilSuggAdd.am")) {
			action = new AdminFacilSuggAdd();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) { e.printStackTrace();}
		}else if(command.equals("/AdminFacilSuggAddAction.am")) {
			action = new AdminFacilSuggAddAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) { e.printStackTrace();}
		}else if(command.equals("/AdminFacilUseButton.am")) {
			action = new AdminFacilUseButton();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AdminAllFacilityUserInfo.am")) {
			action = new AdminAllFacilityUserInfo();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminAllFacilitySearch.am")) {
			action = new AdminAllFacilitySearch();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ADminHBookDelete.am")){
			action = new ADminHBookDelete();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}				
		} 
		// 여기까지 Facility 구간
		
		
		
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
