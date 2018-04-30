package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardCurUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardCurUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		String realPath = request.getRealPath("/upload");
		System.out.println("upload폴더 물리적경로 : "+realPath);

		int maxSize = 5*1024*1024;	//5Mb
		MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		BoardDTO bDTO = new BoardDTO();
		bDTO.setCur_num(num);
		bDTO.setCur_name(multi.getParameter("cur_name"));
		bDTO.setCur_type(multi.getParameter("cur_type"));
		bDTO.setCur_subject(multi.getParameter("cur_subject"));
		bDTO.setCur_content(multi.getParameter("cur_content"));
		bDTO.setCur_file(multi.getFilesystemName("cur_file"));
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.updateCur(bDTO);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardCurList.cu?pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}	
}