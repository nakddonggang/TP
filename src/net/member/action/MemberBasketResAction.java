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

		String[] checkbox = request.getParameterValues("checkbox");		// check한 basket 번호들 배열에 저장
		int[] book_number = new int[checkbox.length];					// basket 번호에 매칭되는 책 번호 저장하기 위한 배열
		
		if(checkbox==null){		// 아무것도 선택안했을 경우 다시 바구니로 돌아감
			forward.setPath("./MemberBasketList.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mDAO = new MemberDAO();
		List list = new ArrayList<>();		// 책 번호들 담을 list 변수 선언
		int[] book_state = new int[checkbox.length];
		String[] bbook_id = new String[checkbox.length];
		System.out.println("checkbox length : "+checkbox.length);
		
		for(int i=0; i<checkbox.length; i++){
			book_number[i] = mDAO.matchBookNum(Integer.parseInt(checkbox[i]));			// 바구니 번호에 해당하는 책 번호 불러와서 저장
			list.add(book_number[i]);	// 체크한 책 번호들  list에 저장
			book_state[i] = mDAO.selectBbook((int)list.get(i));	// 해당 책 bbook테이블에 조회대출중인지 여부
			bbook_id[i] = mDAO.selectBbookId((int)list.get(i));	// 누가 대출중인지 조회
		}
		
		System.out.println("list size : "+list.size());
		System.out.println("book_state legnth : "+book_state.length);
		
		for(int i=0; i<book_state.length; i++){		// 선택한 항목개수만큼 반복
			int rbook_num = mDAO.rbookNumMax((int)list.get(i));	// 선택한 책 번호의 최대 rbook_num 조회해 저장
			System.out.println("book_number : "+list.get(i));
			System.out.println("rbook_num : "+rbook_num);
			int rbookCkMember = mDAO.rbookCkMember((int)list.get(i), member_id);	// 해당 회원이 책 이미 예약했는지 체크 0이면 예약하지 않음
			System.out.println("rbookCkMember : "+rbookCkMember);
			System.out.println("book_state : "+book_state[i]);
			System.out.println("bbook_id : "+bbook_id[i]);
			if(book_state[i]==0){	// 책이 대출가능하면
				if(rbook_num<3 && rbookCkMember==0){	// 예약대기자가 3명이 되지 않고 아직 예약하지 않았을 경우
					mDAO.insertRbook((int)list.get(i), member_id, rbook_num);	// 예약테이블에 insert
					mDAO.deleteRes((int)list.get(i), member_id);				// 예약하고 바구니에서 삭제	
				}else{	// 예약대기자가 3명 이상일 경우 or 이미 예약한 경우 예약 불가
					forward.setPath("./MemberBasketList.me?alert=1");
					forward.setRedirect(true);
					return forward;
				}
			}else{	// 선택한 책 대출중이면
				if(rbook_num<3 && rbookCkMember==0 && !member_id.equals(bbook_id[i])){	// 예약번호 3미만 && 예약한적 없음 && 대출한 사람 아닐경우
					mDAO.insertRbook((int)list.get(i), member_id, rbook_num);	// 예약테이블에 insert
					mDAO.deleteRes((int)list.get(i), member_id);				// 예약하고 바구니에서 삭제
					
				}else{
					forward.setPath("./MemberBasketList.me?alert=1");
					forward.setRedirect(true);
					return forward;
				}
			}		
		}
		mDAO.updateRbookCheck();	// rbook 테이블 전체에서 예약대기자가 3명인 경우 rbook_check를 '0'으로 수정(예약불가)
		mDAO.updateRbookCheck2();	// rbook 테이블 전체에서 예약대기자가 3명미만인 경우 rbook_check를 '1'으로 수정(예약불가)
		
		forward.setPath("./MemberBasketList.me");
		forward.setRedirect(true);
		
		return forward;
	}
}