package net.admin.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.book.db.BookDTO;
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
	
	// 책 제목 검색결과 개수 구하기
	public int getBookSearchCount(String search, String category){
		int count;
		HashMap map = new HashMap();
		map.put("search", search);
		map.put("category", category);
		count = sqlsession.selectOne("getBookSearchCount", map);
		return count;
	}
	
	// 검색된 책 리스트 뿌려주기
	public List<BookDTO> getBookSearchList(int startRow, int pageSize, String search, String category_){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("search", search);
		map.put("category_", category_);
		List<BookDTO> booksearchList = sqlsession.selectList("getBookSearchList", map);
		return booksearchList;
	}	
	
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
		BookDTO bookList = sqlsession.selectOne("getBookInfo", book_number);
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

}
