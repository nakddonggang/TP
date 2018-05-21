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

		String[] checkbox = request.getParameterValues("checkbox");		// check한 바구니 번호들 배열에 저장
		int[] book_number = new int[checkbox.length];
		
		if(checkbox==null){		// 아무것도 선택안했을 경우 다시 바구니로 돌아감
			forward.setPath("./MemberBasketList.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mDAO = new MemberDAO();
		List list = new ArrayList<>();
		int[] book_state = new int[checkbox.length];
		System.out.println("checkbox length : "+checkbox.length);
		
		for(int i=0; i<checkbox.length; i++){
			book_number[i] = mDAO.matchBookNum(Integer.parseInt(checkbox[i]));			// 바구니 번호에 해당하는 책 번호 불러와서 저장
			list.add(book_number[i]);	// 체크한 책 번호들  리스트에 저장
			book_state[i] = mDAO.selectBbook((int)list.get(i));	// 해당 책 bbook테이블에 조회대출중인지 여부
		}
		
		System.out.println("list size : "+list.size());
		System.out.println("book_state legnth : "+book_state.length);
		
		for(int i=0; i<book_state.length; i++){		// 선택한 항목개수만큼 반복
			int rbook_num = mDAO.rbookNumMax((int)list.get(i));	// 선택한 책 번호의 최대 rbook_num 조회해 저장
			System.out.println("book_number : "+list.get(i));
			System.out.println("rbook_num : "+rbook_num);
			int rbookCkMember = mDAO.rbookCkMember((int)list.get(i), member_id);
			System.out.println("rbookCkMember : "+rbookCkMember);
			System.out.println("book_state : "+book_state[i]);
			if(book_state[i]==0){
				if(rbook_num<3 && rbookCkMember==0){	// 예약대기자가 3명이 되지 않고 아직 예약하지 않았을 경우
					mDAO.insertRbook((int)list.get(i), member_id, rbook_num);	// 예약테이블에 insert
					mDAO.deleteRes((int)list.get(i), member_id);
				}else{	// 예약대기자가 3명 이상일 경우, 이미 예약한 경우 예약 불가
					forward.setPath("./MemberBasketList.me?alert=1");
					forward.setRedirect(true);
					return forward;
				}
			}else{	// 선택한 책 대출중임
				if(rbook_num<3 && rbookCkMember==0){
					mDAO.insertRbook((int)list.get(i), member_id, rbook_num);	// 예약테이블에 insert
					mDAO.deleteRes((int)list.get(i), member_id);
				}else{
					forward.setPath("./MemberBasketList.me?alert=1");
					forward.setRedirect(true);
					return forward;
				}
			}		
		}
				
		mDAO.updateRbookCheck();	// rbook 테이블 전체에서 예약대기자가 3명인 경우 rbook_check를 '0'으로 수정(예약불가)
		
		forward.setPath("./MemberBasketList.me");
		forward.setRedirect(true);
		
		return forward;
	}
}