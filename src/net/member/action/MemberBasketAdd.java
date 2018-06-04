package net.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberBasketAdd implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = new MemberDTO();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String member_id = (String)session.getAttribute("member_id");
		String[] checkbox = request.getParameterValues("basket_check");
		
		if(member_id==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		for(int i=0; i<checkbox.length; i++){
			int check = mDAO.basketCheck(Integer.parseInt(checkbox[i]), member_id);		// 이미 basket에 있는 도서인지 체크
			if(check == 0){
				mDTO.setMember_id(member_id);
				mDTO.setBasket_number(mDAO.basketMaxNum()+1);
				mDTO.setBook_number(Integer.parseInt(checkbox[i]));
				mDAO.insertBasket(mDTO);
			}else{
				out.print("<script>");
				out.print("alert('이미 바구니에 포함된 도서가 있습니다.');");
				out.print("location.href='./BookIndex.bk';");
				out.print("</script>");
				out.close();
				return null;
			}
		}
		forward.setPath("./BookIndex.bk?direct=1");
	    forward.setRedirect(true);
	    
	    return forward;
	}
}