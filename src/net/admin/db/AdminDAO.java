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
	
	// 梨� �쟾泥� 媛쒖닔 援ы븯湲�
	public int getBookCount(){
		int count;
		count=sqlsession.selectOne("getBookCount");
		return count;
	}
	
	// 梨� 由ъ뒪�듃 肉뚮젮二쇨린
	public List<BookDTO> getBookList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> bookList = sqlsession.selectList("getBookList", map);
		return bookList;
	}
	
	// admBookWrite �엯怨좏븳 梨� insert �빐二쇨린
	public int insertBook(BookDTO bookdto){
		int result;
		// book_number 媛� 利앷��떆耳쒖＜湲�
		int book_number = sqlsession.selectOne("getBookNum");
		book_number+=book_number+1;
		bookdto.setBook_number(book_number);
		result = sqlsession.insert("insertBook", bookdto);
		return result;
	}
	
	// 梨� �젙蹂� �닃���쓣 �븣 �긽�꽭�젙蹂� 蹂댁뿬二쇨린
	public List<BookDTO> getBookInfo(int book_number){
		HashMap map = new HashMap();
		map.put("book_number", book_number);
		List<BookDTO> bookList = sqlsession.selectList("getBookInfo", map);
		return bookList;
	}
	
	// �넀留앹떎 梨� insert �빐二쇨린
	public int insertDBook(BookDTO bookdto){
		int result;
		result=sqlsession.insert("insertDBook", bookdto);
		return result;
	}
	
	// �넀留앹떎 梨� �쟾泥� 由ъ뒪�듃 媛쒖닔 援ы븯湲�
	public int getDBookCount(){
		int count;
		count = sqlsession.selectOne("getDBookCount");
		return count;
	}
	
	// �넀留앹떎 由ъ뒪�듃
	public List<BookDTO> getDBookList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> dbookList = sqlsession.selectList("getDBookList", map);
		return dbookList;
	}
	public int getMemberCount(){
		int count;
		count = sqlsession.selectOne("getMemberCount");
		return count;
	}
	
	public List<MemberDTO> getMemberList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<MemberDTO> memberList = sqlsession.selectList("getMemberList",map);
		return memberList;
	}
	public List<MemberDTO> getMemberInfo(String member_id){
		HashMap map = new HashMap();
		map.put("Member_id", member_id);
		List<MemberDTO> memberList = sqlsession.selectList("getMemberInfo", map);
		return memberList;
	}
}
