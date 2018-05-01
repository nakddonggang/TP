package net.board.action;

import java.sql.Timestamp;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import net.member.db.MemberDTO;

public class BoardQnaWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardQnaWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("id", "1111");			// 테스트
		String id = (String)session.getAttribute("id");
		
		int qna_num = 0;
		int result;
		
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = new BoardDTO();
		MemberDTO mDTO = new MemberDTO();
		
		ActionForward forward = new ActionForward();
		
		qna_num = bDAO.selectMaxNum()+1;
		
		bDTO.setQna_num(qna_num);
		bDTO.setQna_subject(request.getParameter("qna_subject"));
		bDTO.setQna_content(request.getParameter("qna_content"));
		bDTO.setQna_date(new Timestamp(System.currentTimeMillis()));
		bDTO.setQna_readcount(0);
		bDTO.setQna_ref(qna_num);
		bDTO.setQna_check("0");
		
		Vector vector = new Vector();
		vector.add(0, bDTO);
		vector.add(1, id);
		
		result = bDAO.insertQna(vector);
		
		if(result==0){
			System.out.println("Faile");
		}else{
			System.out.println("Sucsses");
		}
		
		forward.setPath("./BoardQnaList.bo");
		forward.setRedirect(true);
		
		return forward;
	}
}