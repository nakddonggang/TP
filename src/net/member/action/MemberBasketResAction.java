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

public class MemberBasketResAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberBasketResAction execute()");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");

		String[] checkbox = request.getParameterValues("checkbox");		// check한 책 번호들 배열에 저장
		if(checkbox==null){		// 아무것도 선택안했을 경우 다시 바구니로 돌아감
			forward.setPath("./MemberBasketList.me");
			forward.setRedirect(true);
			return forward;
		}
		
		List list = new ArrayList<>();
		for(int i=0; i<checkbox.length; i++){
			list.add(Integer.parseInt(checkbox[i]));	// 가져온 checkbox들  리스트에 int형으로 저장
		}
		
		List<BookDTO> book_state = null;
		MemberDAO mDAO = new MemberDAO();
		book_state = mDAO.selectBbook(list);	// 해당 책 bbook테이블에 조회대출중인지 여부 
		
		int rbook_num;	// 해당책 최대 rbook_num 담아둘 변수
		int rbookCkMember;	// 동일한 책에 동일한 이용자가 다시 예약 못하도록 검사할때 결과 담아둘 변수
		
		if(book_state.size() != 0){		// bbook테이블 조회결과가 있을 경우(대출중인 경우)
			for(int i=0; i<book_state.size(); i++){		// 선택한 항목개수만큼 반복
				BookDTO bkDTO = book_state.get(i);
				rbook_num = mDAO.rbookNumMax(bkDTO.getBook_number());	// 선택한 책 번호의 최대 rbook_num 조회해 저장
				rbookCkMember = mDAO.rbookCkMember(bkDTO.getBook_number(), member_id);
				if(rbook_num<3 && rbookCkMember==0){	// 예약대기자가 3명이 되지 않고 아직 예약하지 않았을 경우
					mDAO.insertRbook(bkDTO.getBook_number(), member_id, bkDTO.getBbook_bstate(), rbook_num);	// 예약테이블에 insert
				}else{	// 예약대기자가 3명 이상일 경우, 이미 예약한 경우 예약 불가
				//예약 불가능
				}		
			}
		}else{	// 선택한 책이 대출가능한 상태면(bbook 테이블에서 조회되지 않는 경우)
			for(int i=0; i<list.size(); i++){		// 선택한 항목개수만큼 반복
				int book_number = (int)list.get(i);
				rbook_num = mDAO.rbookNumMax(book_number);	// 선택한 책 번호의 최대 rbook_num 조회해 저장
				rbookCkMember = mDAO.rbookCkMember(book_number, member_id);
				if(rbookCkMember == 0){	
					mDAO.insertRbook(book_number, member_id, null, rbook_num);	// 예약테이블에 insert
				}else{	// 이미 예약한 책이니 예약 불가
					
				}
			}
		}
		
		mDAO.updateRbookCheck();	// rbook 테이블 전체에서 예약대기자가 3명인 경우 rbook_check를 '0'으로 수정(예약불가)
		
		forward.setPath("./MemberBasketList.me");
		forward.setRedirect(true);
		
		return forward;
	}
}