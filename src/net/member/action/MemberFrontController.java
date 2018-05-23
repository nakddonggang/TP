package net.member.action;

import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		} else if(command.equals("/MemberIdCheck.me")) {
			action = new MemberIdCheck();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogin.me")) {
			try {
				rsaKeygen(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
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
		}else if(command.equals("/MemberUseFacility.me")) {
			action = new MemberUseFacility();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberBasketAdd.me")){
			action = new MemberBasketAdd();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/MemberBasketList.me")){
				action = new MemberBasketList();
				try {
					forward = action.execute(request, response);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
		}else if(command.equals("/MemberBasketDelete.me")){
			action = new MemberBasketDelete();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}	
		}else if(command.equals("/MemberMyUseBookList.me")){
			action = new MemberMyUseBookList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberBasketResAction.me")){
			action = new MemberBasketResAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/MemberUseIndex.me")) {
				action = new MemberUseIndex();
				try {
					forward = action.execute(request, response);
				} catch(Exception e) {
					e.printStackTrace();
				}
		}else if(command.equals("/ReturnBook.me")){		// 기능확인을 위한 임시주소(나중에 관리자컨트롤러로 가야할듯)
			action = new ReturnBook();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/AcceptResBook.me")){		// 기능확인을 위한 임시주소(나중에 관리자컨트롤러로 가야할듯)
			action = new AcceptResBook();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/MemberMyUseRBookList.me")){
			action = new MemberMyUseRBookList();
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
	
	protected void rsaKeygen(HttpServletRequest request, HttpServletResponse response) throws Exception {
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(2048);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		HttpSession session = request.getSession();
		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);
		request.setAttribute("publicKeyExponent", publicKeyExponent);
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
