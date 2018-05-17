package net.member.db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.book.db.BookDTO;
import net.facility.db.FacilityDTO;
import util.myBatisSetting.sqlMapConfig;

public class MemberDAO {

	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		sqlsession = sessionf.openSession(true);
	}

	//맴버 추가 메소드(회원가입)
	public int insertMember(MemberDTO mDTO) {
		int result;
		result = sqlsession.insert("insertMember", mDTO);
		return result;
	}
	
	//맴버 유저체크 메소드
	public int selectUserChk(String member_id, String member_pass) {
		MemberDTO mDTO = new MemberDTO();
		int check = 0;
		mDTO = sqlsession.selectOne("selectMember", member_id);
		
		System.out.println(mDTO.getMember_id());
		
		String id = mDTO.getMember_id();
		
		if (id != null) {	
			if (mDTO.getMember_pass().equals(member_pass)) check = 1;
			else check = 0;
		} else check = -1;
		
		return check;
	}
	
	//맴버 리스트 불러오기
	public List<MemberDTO> selectMemberList(String member_id) {
		List<MemberDTO> mList = new ArrayList<MemberDTO>();
		mList = sqlsession.selectList("selectMember", member_id);
		return mList;
	}
	
	// 맴버 Info 불러오기
	public MemberDTO getMember(String member_id) {
		MemberDTO mDTO = new MemberDTO();
		mDTO = sqlsession.selectOne("selectMember" , member_id);
		return mDTO;
	}
	
	// 유저 중복 체크
	public int MemberIdCheck(String member_id) {
		return sqlsession.selectOne("getCheckId", member_id);
	}
	
	//	맴버 탈퇴
	public void DeleteMember(String member_id) {
		sqlsession.delete("deleteMember" , member_id);
	}
	
	//	맴버 수정
	public void UpdateMember(MemberDTO mDTO) {
		int result = sqlsession.update("updateMember" , mDTO);
		System.out.println(result);
	}
	
	// 맴버 사용 시설 정보
	public FacilityDTO getMemberUseFacility(String member_id) {
		FacilityDTO fDTO = new FacilityDTO();
		fDTO = sqlsession.selectOne("MemberUseFacilily", member_id);
		return fDTO;
	}
	
	// 도서바구니 담기
	public void insertBasket(MemberDTO bDTO) {
		sqlsession.insert("insertBasket", bDTO);
	}	
	
	// 도서바구니 리스트
	public List<MemberDTO> MemberBasketList(String member_id){
		List<MemberDTO> bList = new ArrayList<MemberDTO>();
		bList = sqlsession.selectList("MemberBasketList", member_id);
		return bList;
	}
	// 도서바구니 선택항목 삭제
	public void deleteBasket(List list){
		HashMap map = new HashMap<>();
		map.put("deleteList", list);
		sqlsession.delete("deleteBasket",map);
	}
	// 나의 대출도서현황
	public List<BookDTO> MemberMyUseBookList(String member_id ,int startRow, int endSize){
		HashMap map = new HashMap<>();
		List<BookDTO> bbookList = new ArrayList<BookDTO>();
		map.put("member_id", member_id);
		map.put("startRow", startRow);
		map.put("endSize", endSize);
		bbookList = sqlsession.selectList("MemberMyUseBookList", map);
		return bbookList;
	}
	
	
}
