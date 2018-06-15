package net.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class MemberBasketList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		String alert = request.getParameter("alert");
		
		HttpSession session =request.getSession();
		String member_id =(String)session.getAttribute("member_id");
		if(member_id==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mDAO = new MemberDAO();
		
		int count = mDAO.basketCount(member_id);
		// 한 화면에 보여줄 책의 개수 설정
		int pageSize = 9;		
				
		// 페이지 번호 (PageNum)
		String pageNum = request.getParameter("pageNum");
		// 페이지 번호 없으면 무조건 "1" 페이지 설정
		if (pageNum==null) pageNum="1";
				
		// 10개씩 게시판 글을 분류했을 때,
		int currentPage = Integer.parseInt(pageNum);
		// 첫 번째 페이지 첫행 구하기
		// 1page - 1 / 2page - 11 / 3page - 21
		int startRow = (currentPage-1)* pageSize+1;
		// 페이지 마지막행 구하기
		// 1page - 10 / 2page - 20 / 3page - 30
		int endRow = pageSize*currentPage;

		// 게시판 전체 페이지 수
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		// 한 화면에 보여줄 페이지수 설정
		int pageBlock = 5;
		// 시작하는 페이지 번호 구하기
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		// 끝나는 페이지 번호 구하기
		int endPage = startPage+pageBlock-1;
		// 끝나는 페이지보다 전체페이지의 수가 작은 경우 if 문을 이용하여 제어해주기
		if (endPage>pageCount){
			endPage=pageCount;
		}		
		
		
		
		
		
		List<MemberDTO> bList=mDAO.MemberBasketList(member_id, startRow, pageSize);
		List bbook_bstate = new ArrayList<>();
		List rbook_check = new ArrayList<>();
		List check_member = new ArrayList<>();
		
		for(int i=0; i<bList.size();i++){
			MemberDTO mDTO = bList.get(i);
			bbook_bstate.add(mDAO.selectBbook(mDTO.getBook_number()));
			rbook_check.add(mDAO.rbookNumMax(mDTO.getBook_number()));
			check_member.add(mDAO.memberRbookCount(member_id, mDTO.getBook_number()));
		}
		request.setAttribute("bList", bList);
		request.setAttribute("bbook_bstate", bbook_bstate);
		request.setAttribute("rbook_check", rbook_check);
		request.setAttribute("check_member", check_member);
		// count, pageNum, rbList, pageCount, pageBlock, startPage, endPage 저장
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		if(alert != null){
			request.setAttribute("alert", alert);
		}

		forward.setPath("./member/myUseBasket.jsp");
	    forward.setRedirect(false);
	    return forward;
	}

}
