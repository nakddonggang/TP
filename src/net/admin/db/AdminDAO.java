package net.admin.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.book.db.BookDTO;
import net.facility.db.FacilityDTO;
import net.member.db.MemberDTO;
import util.myBatisSetting.sqlMapConfig;

public class AdminDAO {
	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public AdminDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	// 책 전체 개수 구하기
	public int getBookCount(){
		int count;
		count=sqlsession.selectOne("getBookCount");
		return count;
	}
	
	// 책 리스트 뿌려주기
	public List<BookDTO> getBookList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> bookList = sqlsession.selectList("getBookList", map);
		return bookList;
	}
	
// 책 정렬 메소드
	// 제목 정렬
	public List<BookDTO> getBookSortSubject(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> bookList = sqlsession.selectList("getBookSortSubject", map);
		return bookList;
	}	
	// 저자 정렬
	public List<BookDTO> getBookSortAuthor(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> bookList = sqlsession.selectList("getBookSortAuthor", map);
		return bookList;
	}	
	// 인기순
	public List<BookDTO> getBookSortNumber(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> bookList = sqlsession.selectList("getBookSortNumber", map);
		return bookList;
	}	
	// 신작순
	public List<BookDTO> getBookSortPubDate(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> bookList = sqlsession.selectList("getBookSortPubDate", map);
		return bookList;
	}	
	// 입고순
	public List<BookDTO> getBookSortDate(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> booksortList = sqlsession.selectList("getBookSortDate", map);
		return booksortList;
	}	
// 책 정렬 메소드 끝
	
	// 검색결과로 나온 책 전체 개수 구하기
	public int getBookSearchAllCount(String search){
		int count;
		HashMap map = new HashMap();
		map.put("all", "%"+search+"%");
		count=sqlsession.selectOne("getBookSearchAllCount", map);
		return count;
	}
	
	// 검색결과로 나온 책 전체 리스트 뿌려주기
	public List<BookDTO> getBookSearchAllList(int startRow, int pageSize, String search){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("value", search);
		List<BookDTO> booksearchList = sqlsession.selectList("getBookSearchAllList", map);
		return booksearchList;
	}		
	
	// 책 제목 검색결과 개수 구하기
	public int getBookSearchCount(String search, String category){
		int count;
		HashMap map = new HashMap();
		map.put("value", search);
		map.put("category", category);
		count = sqlsession.selectOne("admin.getBookSearchCount", map);
		return count;
	}
	
	// 검색된 책 리스트 뿌려주기
	public List<BookDTO> getBookSearchList(int startRow, int pageSize, String search, String category_){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("search", search);
		map.put("category_", category_);
		List<BookDTO> booksearchList = sqlsession.selectList("admin.getBookSearchList", map);
		return booksearchList;
	}	
	
	// 상세검색 책 개수 구하기 1
	public int SearchTwoCount(String category1, String value1, String option, String category2, String value2){
		int count;
		HashMap map = new HashMap();
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option", option);
		map.put("category2", category2);
		map.put("value2", value2);
		count = sqlsession.selectOne("SearchTwoCount", map);
		return count;
	}
	
	// 상세검색 책 리스트 뿌려주기 1
	public List<BookDTO> SearchTwoList(String category1, String search1, String option, String category2, String search2, int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("category1", category1);
		map.put("search1", search1);
		map.put("option", option);
		map.put("category2", category2);
		map.put("search2", search2);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> booksearchList = sqlsession.selectList("SearchTwoList", map);
		return booksearchList;
	}	
	
	// 상세검색 책 개수 구하기 2
	public int SearchTwoAllCount(String all, String option, String category, String value){
		int count;
		HashMap map = new HashMap();
		map.put("all", "%"+all+"%");
		map.put("option", option);
		map.put("category", category);
		map.put("value", value);
		count = sqlsession.selectOne("SearchTwoAllCount", map);
		return count;
	}
	
	// 상세검색 책 리스트 뿌려주기 2
	public List<BookDTO> SearchTwoAllList(String value, String option, String category1, String value1, int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("value", value);
		map.put("option", option);
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> booksearchList = sqlsession.selectList("SearchTwoAllList", map);
		return booksearchList;
	}	

	// 상세검색 책 개수 구하기 1
	public int SearchThrCount(String category1, String value1, String option1, String category2, String value2, String option2, String category3, String value3){
		int count;
		HashMap map = new HashMap();
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option1", option1);
		map.put("category2", category2);
		map.put("value2", value2);
		map.put("option2", option2);
		map.put("category3", category3);
		map.put("value3", value3);
		count = sqlsession.selectOne("SearchThrCount", map);
		return count;
	}
	
	// 상세검색 책 리스트 뿌려주기 1
	public List<BookDTO> SearchThrList(String category1, String value1, String option1, String category2, String value2, String option2, String category3, String value3, int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option1", option1);
		map.put("category2", category2);
		map.put("value2", value2);
		map.put("option2", option2);
		map.put("category3", category3);
		map.put("value3", value3);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> booksearchList = sqlsession.selectList("SearchThrList", map);
		return booksearchList;
	}	
	
	// 상세검색 책 개수 구하기 2
	public int SearchThrAllCount(String all, String option1, String category1, String value1, String option2, String category2, String value2){
		int count;
		HashMap map = new HashMap();
		map.put("all", "%"+all+"%");
		map.put("option1", option1);
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option2", option2);
		map.put("category2", category2);
		map.put("value2", value2);
		count = sqlsession.selectOne("SearchThrAllCount", map);
		return count;
	}
	
	// 상세검색 책 리스트 뿌려주기 2
	public List<BookDTO> SearchThrAllList(String value, String option1, String category1, String value1, String option2, String category2, String search2, int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("value", value);
		map.put("option1", option1);
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option2", option2);
		map.put("category2", category2);
		map.put("search2", search2);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> booksearchList = sqlsession.selectList("SearchThrAllList", map);
		return booksearchList;
	}			
	
	
	// 발행일을 검색내용에 넣을 때 책 검색
	
	// 검색결과로 나온 책 전체 개수 구하기
	public int getBookDateSearchAllCount(String search, String pubDate){
		int count;
		HashMap map = new HashMap();
		map.put("all", "%"+search+"%");
		map.put("pubDate", pubDate);
		count=sqlsession.selectOne("getBookDateSearchAllCount", map);
		return count;
	}
	
	// 검색결과로 나온 책 전체 리스트 뿌려주기
	public List<BookDTO> getBookDateSearchAllList(int startRow, int pageSize, String search, String pubDate){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("value", search);
		map.put("pubDate", pubDate);
		List<BookDTO> booksearchList = sqlsession.selectList("getBookDateSearchAllList", map);
		return booksearchList;
	}		
	
	// 책 제목 검색결과 개수 구하기
	public int getBookDateSearchCount(String search, String category, String pubDate){
		int count;
		HashMap map = new HashMap();
		map.put("value", search);
		map.put("category", category);
		map.put("pubDate", pubDate);
		count = sqlsession.selectOne("getBookDateSearchCount", map);
		return count;
	}
	
	// 검색된 책 리스트 뿌려주기
	public List<BookDTO> getBookDateSearchList(int startRow, int pageSize, String search, String category_, String pubDate){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("search", search);
		map.put("category_", category_);
		map.put("pubDate", pubDate);
		List<BookDTO> booksearchList = sqlsession.selectList("getBookDateSearchList", map);
		return booksearchList;
	}	
	
	// 상세검색 책 개수 구하기 1
	public int SearchDateTwoCount(String category1, String value1, String option, String category2, String value2 , String pubDate){
		int count;
		HashMap map = new HashMap();
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option", option);
		map.put("category2", category2);
		map.put("value2", value2);
		map.put("pubDate", pubDate);
		count = sqlsession.selectOne("SearchDateTwoCount", map);
		return count;
	}
	
	// 상세검색 책 리스트 뿌려주기 1
	public List<BookDTO> SearchDateTwoList(String category1, String search1, String option, String category2, String search2, int startRow, int pageSize, String pubDate){
		HashMap map = new HashMap();
		map.put("category1", category1);
		map.put("search1", search1);
		map.put("option", option);
		map.put("category2", category2);
		map.put("search2", search2);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("pubDate", pubDate);
		List<BookDTO> booksearchList = sqlsession.selectList("SearchDateTwoList", map);
		return booksearchList;
	}	
	
	// 상세검색 책 개수 구하기 2
	public int SearchDateTwoAllCount(String all, String option, String category, String value, String pubDate){
		int count;
		HashMap map = new HashMap();
		map.put("all", "%"+all+"%");
		map.put("option", option);
		map.put("category", category);
		map.put("value", value);
		map.put("pubDate", pubDate);
		count = sqlsession.selectOne("SearchDateTwoAllCount", map);
		return count;
	}
	
	// 상세검색 책 리스트 뿌려주기 2
	public List<BookDTO> SearchDateTwoAllList(String value, String option, String category1, String value1, int startRow, int pageSize, String pubDate){
		HashMap map = new HashMap();
		map.put("value", value);
		map.put("option", option);
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("pubDate", pubDate);
		List<BookDTO> booksearchList = sqlsession.selectList("SearchDateTwoAllList", map);
		return booksearchList;
	}	

	// 상세검색 책 개수 구하기 1
	public int SearchDateThrCount(String category1, String value1, String option1, String category2, String value2, String option2, String category3, String value3, String pubDate){
		int count;
		HashMap map = new HashMap();
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option1", option1);
		map.put("category2", category2);
		map.put("value2", value2);
		map.put("option2", option2);
		map.put("category3", category3);
		map.put("value3", value3);
		map.put("pubDate", pubDate);
		count = sqlsession.selectOne("SearchDateThrCount", map);
		return count;
	}
	
	// 상세검색 책 리스트 뿌려주기 1
	public List<BookDTO> SearchDateThrList(String category1, String value1, String option1, String category2, String value2, String option2, String category3, String value3, int startRow, int pageSize, String pubDate){
		HashMap map = new HashMap();
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option1", option1);
		map.put("category2", category2);
		map.put("value2", value2);
		map.put("option2", option2);
		map.put("category3", category3);
		map.put("value3", value3);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("pubDate", pubDate);
		List<BookDTO> booksearchList = sqlsession.selectList("SearchDateThrList", map);
		return booksearchList;
	}	
	
	// 상세검색 책 개수 구하기 2
	public int SearchDateThrAllCount(String all, String option1, String category1, String value1, String option2, String category2, String value2, String pubDate){
		int count;
		HashMap map = new HashMap();
		map.put("all", "%"+all+"%");
		map.put("option1", option1);
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option2", option2);
		map.put("category2", category2);
		map.put("value2", value2);
		map.put("pubDate", pubDate);
		count = sqlsession.selectOne("SearchDateThrAllCount", map);
		return count;
	}
	
	// 상세검색 책 리스트 뿌려주기 2
	public List<BookDTO> SearchDateThrAllList(String value, String option1, String category1, String value1, String option2, String category2, String search2, int startRow, int pageSize, String pubDate){
		HashMap map = new HashMap();
		map.put("value", value);
		map.put("option1", option1);
		map.put("category1", category1);
		map.put("value1", value1);
		map.put("option2", option2);
		map.put("category2", category2);
		map.put("search2", search2);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("pubDate", pubDate);
		List<BookDTO> booksearchList = sqlsession.selectList("SearchDateThrAllList", map);
		return booksearchList;
	}		
	// end 발행일을 검색내용에 넣을 때 책 검색
	
	
	// admBookWrite 입고한 책 insert 해주기
	public int insertBook(BookDTO bookdto){
		int result;
		// book_number 값 증가시켜주기
		int book_number = sqlsession.selectOne("getBookNum");
		book_number+=1;
		bookdto.setBook_number(book_number);
		result = sqlsession.insert("insertBook", bookdto);
		return result;
	}
	
	// 책 정보 눌렀을 때 상세정보 보여주기
	public BookDTO getBookInfo(int book_number){
		BookDTO bookList = sqlsession.selectOne("admin.getBookInfo", book_number);
		return bookList;
	}
	
	// 손망실 책 정보 존재하는지 select 구문
	public int getDBookInfo(){
		int result;
		result = sqlsession.selectOne("getDBookInfo");
		return result;
	}
	
	// 손망실 책 insert 해주기
	public int insertDBook(BookDTO bookdto){
		int result;
		result=sqlsession.insert("insertDBook", bookdto);
		return result;
	}
	
	// 손망실 책 전체 리스트 개수 구하기
	public int getDBookCount(){
		int count;
		count = sqlsession.selectOne("getDBookCount");
		return count;
	}
	
	// 손망실 리스트
	public List<BookDTO> getDBookList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> dbookList = sqlsession.selectList("getDBookList", map);
		return dbookList;
	}
	
	// 예약관리 책 전체 리스트 개수 구하기
	public int getRBookCount(){
		int count;
		count = sqlsession.selectOne("getRBookCount");
		return count;
	}
	
	// 예약관리 리스트
	public List<BookDTO> getRBookList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> rbookList = sqlsession.selectList("getRBookList", map);
		return rbookList;
	}
	
	// 희망도서 책 전체 리스트 개수 구하기
	public int getHBookCount(){
		int count;
		count = sqlsession.selectOne("getHBookCount");
		return count;
	}
	
	// 희망도서 신청 목록 리스트
	public List<BookDTO> getHBookList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> hbookList = sqlsession.selectList("getHBookList", map);
		return hbookList;
	}	
	
	// 희망도서 눌러서 정보보기
	public BookDTO getHBookInfo(String member_id, String hbook_subject, String hbook_author){
		HashMap map = new HashMap();
		map.put("member_id", member_id);
		map.put("hbook_subject", hbook_subject);
		map.put("hbook_author", hbook_author);
		BookDTO hbookinfo = sqlsession.selectOne("getHBookInfo", map);
		return hbookinfo;
	}
	
	// 희망도서 처리상태 수정하기
	public int getHBookReWrite(String member_id){
		int result = 0;
		result = sqlsession.selectOne("getHBookReWrite", member_id);
		return result;
	}
	
	public int getMemberCount(){
		int count;
		count = sqlsession.selectOne("getMemberCount");
		return count;
	}
	public int getBlackMemberCount(){
		int count;
		count = sqlsession.selectOne("getBlackMemberCount");
		return count;
	}
	public int getGoodMemberCount(){
		int count;
		count = sqlsession.selectOne("getGoodMemberCount");
		return count;
	}
	public List<MemberDTO> getMemberList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<MemberDTO> memberList = sqlsession.selectList("getMemberList",map);
		return memberList;
	}
	public MemberDTO getAdminMember(String member_id) {
		MemberDTO mDTO = new MemberDTO();
		mDTO = sqlsession.selectOne("getAdminMember" , member_id);
		return mDTO;
	}
	
	//	facility 시설자리 생성
	public int insertFacility(FacilityDTO fDTO) {
		int result;
		result = sqlsession.insert("AdminFacilityInsert", fDTO);
		return result;
	}
}
