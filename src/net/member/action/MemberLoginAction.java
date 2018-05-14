package net.member.action;

import java.io.PrintWriter;
import java.security.PrivateKey;

import javax.crypto.Cipher;
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
/*
		
		
		
*/
		
        String securedUsername = request.getParameter("securedUsername");
        String securedPassword = request.getParameter("securedPassword");
        
        MemberDAO mDAO = new MemberDAO();
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.

        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
            String member_id = decryptRsa(privateKey, securedUsername);
            String member_pass = decryptRsa(privateKey, securedPassword);
            
            int check = mDAO.selectUserChk(member_id, member_pass);
    		
    		System.out.println(check);
    		
    		if(check == 0) {
    			response.setContentType("text/html;charset=utf-8");
    			PrintWriter out = response.getWriter();
    			out.print("<script>");
    			out.print("alert('비밀번호 틀림');");
    			out.print("location.href='./MemberLogin.me';");
    			out.print("</script>");
    			out.close();
    			return null;
    		}else if(check == -1){
    			response.setContentType("text/html;charset=utf-8");
    			PrintWriter out = response.getWriter();
    			out.print("<script>");
    			out.print("alert('아이디 틀림');");
    			out.print("location.href='./MemberLogin.me';");
    			out.print("</script>");
    			out.close();
    			return null;
    		}
    		
    		session.setAttribute("member_id", member_id);
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        forward.setRedirect(true);
    	forward.setPath("Main.fp");
    	return forward;
    }

    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        System.out.println("will decrypt : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }

    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
}

