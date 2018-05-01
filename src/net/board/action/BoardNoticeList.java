package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class BoardNoticeList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardNoticeList execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();

		BoardDAO bDAO = new BoardDAO();
		int count = bDAO.getNoticeCount();		// 怨듭��궗�빆 湲� 媛쒖닔 援ы빐 count�뿉 ���옣
		
		int pageSize = 2;	//�븳 �솕硫댁뿉 蹂댁뿬以� 湲� 媛쒖닔 �꽕�젙
		String pageNum = request.getParameter("pageNum");	// �럹�씠吏� 踰덊샇(�뙆�씪誘명꽣 "pageNum") 媛��졇�삤湲�

		if(pageNum == null){	//�럹�씠吏� 踰덊샇媛� �뾾�쑝硫� 臾댁“嫄� "1"�럹�씠吏� �꽕�젙
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;	// �럹�씠吏� 泥� �뻾 援ы븯湲�
		int endRow = currentPage*pageSize;			// 留덉�留됲뻾 援ы븯湲�
		
		List<BoardDTO> noticeList = null;
		
		if(count != 0){
			noticeList = bDAO.getNoticeList(startRow, pageSize);
		}
		
		//寃뚯떆�뙋 �쟾泥� �럹�씠吏��닔 援ы븯湲� => ex)�쟾泥� 湲� 媛쒖닔(count):50媛�, �븳 �솕硫댁뿉 蹂댁뿬以� 湲� 媛쒖닔(pageSize):10媛�
							//count:50 pageSize:10 =>�쟾泥� �럹�씠吏��닔 : 50/10+�굹癒몄�0 => 5+0=5�럹�씠吏�
							//count:58 pageSize:10 =>�쟾泥� �럹�씠吏��닔 : 58/10+�굹癒몄�1 => 5+1=6�럹�씠吏�
		int pageCount = count/pageSize+(count%pageSize==0? 0:1);
		//�븳�솕硫댁뿉 蹂댁뿬以� �럹�씠吏��닔 �꽕�젙
		int pageBlock = 3;
		//�떆�옉�븯�뒗 �럹�씠吏� 踰덊샇 援ы븯湲� : 1~10 => 1, 11~20 => 11, 21~30 => 21 / currentPage, pageBlock 議고빀
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		//�걹�굹�뒗 �럹�씠吏� 踰덊샇 援ы븯湲� : startPage pageBlock 議고빀
		//1 10 => 10, 11 10 => 20, 21 10 => 30 ...
		int endPage = startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;	
		}
		
		// count, pageNum, noticeList, pageCount
		// pageBlock, startPage, endPage ���옣
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		forward.setPath("./board/boardNews.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}