package net.member.action;

import java.io.PrintWriter;
import java.security.PrivateKey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateAction execute()");
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
        
        String securedId = request.getParameter("securedId");
        String securedName = request.getParameter("securedName");
        String securedPost = request.getParameter("securedPost");
        String securedAddress1 = request.getParameter("securedAddress1");
        String securedAddress2 = request.getParameter("securedAddress2");
        String securedPhone1 = request.getParameter("securedPhone1");
        String securedPhone2 = request.getParameter("securedPhone2");
        String securedPhone3 = request.getParameter("securedPhone3");
        String securedEmail1 = request.getParameter("securedEmail1");
        String securedEmail2 = request.getParameter("securedEmail2");
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		DescryptRSA dRSA = new DescryptRSA();
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = new MemberDTO();
        
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.

        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
		
        try {
		    String member_id = dRSA.DecryptRsa(privateKey, securedId);
		    String member_name = dRSA.DecryptRsa(privateKey, securedName);
		    String member_post = dRSA.DecryptRsa(privateKey, securedPost);
		    String member_address1 = dRSA.DecryptRsa(privateKey, securedAddress1);
		    String member_address2 = dRSA.DecryptRsa(privateKey, securedAddress2);
		    String member_phone1 = dRSA.DecryptRsa(privateKey, securedPhone1);
		    String member_phone2 = dRSA.DecryptRsa(privateKey, securedPhone2);
		    String member_phone3 = dRSA.DecryptRsa(privateKey, securedPhone3);
		    String member_email1 = dRSA.DecryptRsa(privateKey, securedEmail1);
		    String member_email2 = dRSA.DecryptRsa(privateKey, securedEmail2);
		    
			String member_phone = member_phone1 + member_phone2 + member_phone3;
			String member_email = member_email1 + "@" + member_email2;
			
			if(member_id == null) {
				forward.setPath("./MemberLogin.me");
				forward.setRedirect(true);
				return forward;
			}
		

				
		mDTO.setMember_id(member_id);
		mDTO.setMember_name(member_name);
		mDTO.setMember_post(member_post);
		mDTO.setMember_address1(member_address1);
		mDTO.setMember_address2(member_address2);
		mDTO.setMember_phone(member_phone);
		mDTO.setMember_email(member_email);
		
		mDAO.UpdateMember(mDTO);
		
        } catch (Exception ex) {
            ex.printStackTrace();
        }
		out.print("<script>");
		out.print("$.Alert('수정되었습니다.');");
		out.print("location.href='./MemberInfo.me';");
		out.print("</script>");
		out.close();
		
		return null;
	}

}
