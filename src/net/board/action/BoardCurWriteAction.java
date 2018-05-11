package net.board.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardCurWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardDTO bDTO = new BoardDTO();
		BoardDAO bDAO = new BoardDAO();
		
		int cur_num = bDAO.selectCMaxNum()+1;				// 게시판 max 번호 구한 뒤 +1
		
		String realPath = request.getRealPath("/upload");
		System.out.println("upload폴더 물리적경로 : "+realPath);
		
		int maxSize = 5*1024*1024;	//5Mb
		MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		bDTO.setCur_num(cur_num);
		bDTO.setCur_name(multi.getParameter("cur_name"));
		bDTO.setCur_type(multi.getParameter("cur_type"));
		bDTO.setCur_subject(multi.getParameter("cur_subject"));
		bDTO.setCur_file(multi.getFilesystemName("cur_file"));
		bDTO.setCur_content(multi.getParameter("cur_content"));
		bDTO.setCur_readcount(0);
	
		bDAO.insertCur(bDTO);
			
		forward.setPath("./BoardCurList.cu");
		forward.setRedirect(true);
		return forward;
	}
}