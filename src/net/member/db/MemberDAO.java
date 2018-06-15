package net.member.db;

import java.util.ArrayList;
import java.util.Date;
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
	
	// admin 체크 매소드
	public String AdminCheck(String member_id) {
		MemberDTO mDTO = new MemberDTO();
		String member_level = "0";
		mDTO = sqlsession.selectOne("selectMember", member_id);
		String id = mDTO.getMember_id();
		
		System.out.println("mDTO.getMember_level : "+mDTO.getMember_level());
		System.out.println("mDTO.getMember_id : "+mDTO.getMember_id());
		
		if(id != null) {
			if(mDTO.getMember_level().equals("3")) member_level = "3";
			else member_level = "0";
		}
		return member_level;
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
	public void insertBasket(MemberDTO mDTO) {
		sqlsession.insert("insertBasket", mDTO);
	}	
	
	// 이미 바구니에 있는지 여부 체크
	public int basketCheck(int book_number, String member_id){
		HashMap map = new HashMap();
		map.put("book_number", book_number);
		map.put("member_id", member_id);
		return sqlsession.selectOne("basketCheck", map);
	}
	
	// 바구니 카운트
	public int basketCount(String member_id){
		HashMap map = new HashMap();
		map.put("member_id", member_id);
		return sqlsession.selectOne("basketCount", map);
	}
	
	// 도서바구니 리스트
	public List<MemberDTO> MemberBasketList(String member_id, int startRow, int pageSize){
		List<MemberDTO> bList = new ArrayList<MemberDTO>();
		HashMap map = new HashMap();
		map.put("member_id", member_id);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		bList = sqlsession.selectList("MemberBasketList", map);
		return bList;
	}
	// 도서바구니 선택항목 삭제
	public void deleteBasket(List list){
		HashMap map = new HashMap<>();
		map.put("deleteList", list);
		sqlsession.delete("deleteBasket",map);
	}
	// 도서바구니 예약버튼 클릭 시 해당 책 대출중인지 여부 확인
	public int selectBbook(int book_number){
		int bbook_check = sqlsession.selectOne("selectBbook", book_number);
		return bbook_check;
	}
	// 누가 대출중인지
	public String selectBbookId(int book_number){
		String member_id = sqlsession.selectOne("selectBbookId", book_number);
		return member_id;
	}
	// rbook 테이블에 해당 책 예약대기순위 조회
	public int rbookNumMax(int book_number){
		int rbookNumMax = sqlsession.selectOne("rbookNumMax", book_number);
		return rbookNumMax;
	}
	// rbook 테이블에 insert
	public void insertRbook(int book_number, String member_id, int rbook_num){
		HashMap map = new HashMap<>();
		map.put("book_number", book_number);
		map.put("member_id", member_id);
		map.put("rbook_num", rbook_num);
		sqlsession.insert("insertRbook",map);
	}
	// rbook 테이블 rbook_num=3인것들 찾아서 rbook_check='0'으로 수정
	public void updateRbookCheck(int book_number){
		sqlsession.update("updateRbookCheck", book_number);
	}
	// rbook_num<3인것들은 rbook_check='1'로 수정
	public void updateRbookCheck2(){
		sqlsession.update("updateRbookCheck2");
	}
	// 해당 책 이미 예약했는지 체크
	public int rbookCkMember(int book_number, String member_id){
		HashMap map = new HashMap<>();
		map.put("book_number", book_number);
		map.put("member_id", member_id);
		int result = sqlsession.selectOne("rbookCkMember", map);
		return result;
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
	// 예약완료된 도서 바구니에서 삭제
	public void deleteRes(int book_number, String member_id){
		HashMap map = new HashMap<>();
		map.put("book_number", book_number);
		map.put("member_id", member_id);
		sqlsession.delete("deleteRes", map);
	}
	// basket_number에 해당하는 책번호 불러오기
	public int matchBookNum(int basket_number){
		int book_number = sqlsession.selectOne("matchBookNum", basket_number);
		return book_number;
	}
	// 바구니 최대번호 조회
	public int basketMaxNum(){
		int basket_number = sqlsession.selectOne("basketMaxNum");
		return basket_number;
	}
	// 관리자가 대출승인 눌렀을경우 예약대기순위 1씩 감소
	public void updateRbook(int book_number){
		sqlsession.update("updateRbook", book_number);
	}
	// 관리자가 대출승인 눌렀을경우 해당 도서 대출테이블에 insert
	public void insertBbook(BookDTO bDTO){
		sqlsession.insert("insertBbook", bDTO);
	}
	// 예약대기순위 0인 것은 대출된 것이므로 대기순위 0인 것 예약테이블에서 삭제
	public void deleteRbook(){
		sqlsession.delete("deleteRbook");
	}
	// 관리자가 대출도서반납 버튼 누르면 대출테이블에서 삭제
	public void deleteBbook(int book_number){
		sqlsession.delete("deleteBbook", book_number);
	}
	
	
	// myUseRBookList.jsp > 책 전체 count 개수 구하기
		public int BookCount(){
			int count;
			count=sqlsession.selectOne("BookCount");
			return count;
		}	
		
		// myUseRBookList.jsp > 책 리스트 뿌려주기
		public List<BookDTO> myUseRBookList(String member_id, int startRow, int pageSize){
			HashMap map = new HashMap();
			map.put("member_id", member_id);
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			List<BookDTO> rbookList = sqlsession.selectList("myUseRBookList", map);
			return rbookList;
		}
	
	// 회원이 대여중인 책 총수량 검색구문
	public int useBbookMemberCount(String member_id) {
		int count = sqlsession.selectOne("useBbookMemberCount", member_id);
		return count;
	}
	
	// 회원이 예약중인 책 총수량 검색구문
	public int ReservationBookMemberCount(String member_id) {
		int count = sqlsession.selectOne("ReservationBookMemberCount", member_id);
		return count;
	}
	
	// 회원이 예약중인 도서 목록 보여주는 구문
	public List<BookDTO> ReservationBookMemberList(String member_id,int startRow, int endSize) {
		List<BookDTO> bList = new ArrayList<BookDTO>();
		HashMap map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("startRow", startRow);
		map.put("endSize", endSize);
		bList = sqlsession.selectList("ReservationBookMemberList",map);
		return bList;
	}
	
	// 반납기간 2일이하인 책 체크
	 public int memberBbookCheck(String member_id){
		 int result = sqlsession.selectOne("memberBbookCheck", member_id);
		 return result;
	 }
	 
	 // 대출 할때 자동으로 전체저장테이블에 저장 구문 
	 public void HistoryInsertBorrowBook(BookDTO bDTO) {
		 sqlsession.insert("insertHistoryBorrowBook", bDTO);
	 }
	 
	 // 유저가 대출한 책 권수 조회 구문
	 public int userBorrowBookCount(String member_id) {
		 return sqlsession.selectOne("MyBorrowBookCount", member_id);
	 }
	 
	 // 책반납
	 public void ReturnBorrowBook(int book_number) {
		 sqlsession.delete("ReturnBorrowBook", book_number);
	 }
	 
	 // 히스토리 알북 업데이트
	 public void ReturnHistoryBorrowBook(int book_number) {
		 sqlsession.update("ReturnHistoryBorrowBook", book_number);
	 }
	 
	 // 히스토리 알북 책 번호
	 public int HistoryMaxNumber() {
		 return sqlsession.selectOne("HistoryBorrowMaxBookNumber");
	 }
	 
	 public List<BookDTO> myUseBorrowBookList(int startRow , int pageSize , String member_id) {
		 List<BookDTO> bbList = new ArrayList<BookDTO>();
		 HashMap map = new HashMap<>();
		 map.put("member_id", member_id);
		 map.put("startRow", startRow-1);
		 map.put("pageSize", pageSize);
		 bbList = sqlsession.selectList("myUseBorrowBookList", map);
		 return bbList;
	 }
	 
	 public int BorrowBookCountList(String member_id) {
		 return sqlsession.selectOne("BorrowBookCountList", member_id);
	 }
	 
	 // 멤버 rbook 전체 리스트
	 public int memberRbookCount(String member_id, int book_number){
		 HashMap map = new HashMap();
		 map.put("member_id", member_id);
		 map.put("book_number", book_number);
		 return sqlsession.selectOne("memberRbookCount", map);
	 }
	
}