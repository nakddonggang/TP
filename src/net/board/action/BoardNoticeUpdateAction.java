package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardNoticeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardNoticeUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String pageNum = request.getParameter("pageNum");
		
		String realPath = request.getRealPath("/upload");
		System.out.println("upload폴더 물리적경로 : "+realPath);

		int maxSize = 5*1024*1024;	//5Mb
		MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		BoardDTO bDTO = new BoardDTO();
		bDTO.setNotice_num(notice_num);
		bDTO.setNotice_type(multi.getParameter("notice_type"));
		bDTO.setNotice_subject(multi.getParameter("notice_subject"));
		bDTO.setNotice_content(multi.getParameter("notice_content"));
		bDTO.setNotice_file(multi.getFilesystemName("notice_attachments")+","+multi.getFilesystemName("notice_image"));
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.updateNotice(bDTO);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardNoticeList.no?pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}	
}