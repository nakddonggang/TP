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

public class BoardNoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardNoticeWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		BoardDTO bDTO = new BoardDTO();
		BoardDAO bDAO = new BoardDAO();
		
		int notice_num;
		String table = "notice";
		String column = "notice_num";
		
		notice_num = bDAO.selectNMaxNum()+1;				// 게시판 max 번호 구한 뒤 +1
		
		String realPath = request.getRealPath("/upload");
		System.out.println("upload폴더 물리적경로 : "+realPath);
		
		int maxSize = 5*1024*1024;	//5Mb
		MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		bDTO.setNotice_num(notice_num);
		bDTO.setNotice_type(multi.getParameter("notice_type"));
		bDTO.setNotice_subject(multi.getParameter("notice_subject"));
		bDTO.setNotice_content(multi.getParameter("notice_content"));
		bDTO.setNotice_file(multi.getFilesystemName("notice_file"));
		bDTO.setNotice_date(new Date(System.currentTimeMillis()));
		bDTO.setNotice_readcount(0);
		
		bDAO.insertNotice(bDTO);
		
		forward.setPath("./BoardNoticeList.no");
		forward.setRedirect(true);		
		return forward;
	}
}