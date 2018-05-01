package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardFaqWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardFaqWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		BoardDTO bDTO=new BoardDTO();
		BoardDAO bDAO=new BoardDAO();
		ActionForward forward=new ActionForward();
		
		
		int faq_num=bDAO.selectFaq()+1;
		
		String realPath=request.getRealPath("/upload");
		System.out.println("upload폴더 물리적 경로: "+realPath);
		
		int maxSize=5*1024*1024;
		MultipartRequest multi=new MultipartRequest(request, realPath, maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		
		bDTO.setFaq_num(faq_num);
		bDTO.setFaq_type(multi.getParameter("faq_type"));
		bDTO.setFaq_subject(multi.getParameter("faq_subject"));
		bDTO.setFaq_content(multi.getParameter("faq_content"));
		bDTO.setFaq_file(multi.getFilesystemName("faq_file"));
		
		
		bDAO.insertFaq(bDTO);
		
	
	
		forward.setPath("./BoardFaqList.fa");
		forward.setRedirect(true);
		
		return forward;
	}
  
}
