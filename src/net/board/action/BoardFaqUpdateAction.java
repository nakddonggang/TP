package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardFaqUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardFaqUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		String realPath = request.getRealPath("/upload");
		System.out.println("upload폴더 물리적경로 : "+realPath);

		int maxSize = 5*1024*1024;	//5Mb
		MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		BoardDTO bDTO = new BoardDTO();
		bDTO.setFaq_num(num);
		bDTO.setFaq_type(multi.getParameter("faq_type"));
		bDTO.setFaq_subject(multi.getParameter("faq_subject"));
		bDTO.setFaq_content(multi.getParameter("faq_content"));
		bDTO.setFaq_file(multi.getFilesystemName("faq_file"));
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.updateFaq(bDTO);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardFaqList.fa?pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}
	
}
