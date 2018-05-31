package net.book.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.myBatisSetting.sqlMapConfig;

public class BookDAO {
	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public BookDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	// bookindex.jsp > 책 전체 count 개수 구하기
	public int BookCount(){
		int count;
		count=sqlsession.selectOne("BookCount");
		return count;
	}	
	
	// bookindex.jsp > 책 리스트 뿌려주기
	public List<BookDTO> BookList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BookDTO> bookList = sqlsession.selectList("BookList", map);
		return bookList;
	}

	// 책 정보 눌렀을 때 상세정보 보여주기
	public BookDTO getBookInfo(int book_number) {
		BookDTO bookList = sqlsession.selectOne("book.getBookInfo", book_number);
		return bookList;
	}
	
// 책정렬
		public List<BookDTO> BookSorts(String bookSR, String adsc){
			HashMap map = new HashMap();
			map.put("bookSR", bookSR);
			map.put("adsc", adsc);
			List<BookDTO> bookList = sqlsession.selectList("BookSorts", map);
			return bookList;
		}	
// 책정렬
		
// START 상세검색
		// 검색결과로 나온 책 전체 개수 구하기
		public int Bk_SearchAllCount(String search){
			int count;
			HashMap map = new HashMap();
			map.put("all", "%"+search+"%");
			count=sqlsession.selectOne("Bk_SearchAllCount", map);
			return count;
		}
		
		// 검색결과로 나온 책 전체 리스트 뿌려주기
		public List<BookDTO> Bk_SearchAllList(int startRow, int pageSize, String search){
			HashMap map = new HashMap();
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			map.put("value", search);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_SearchAllList", map);
			return booksearchList;
		}		
		
		// 책 제목 검색결과 개수 구하기
		public int Bk_SearchCount(String search, String category){
			int count;
			HashMap map = new HashMap();
			map.put("value", search);
			map.put("category", category);
			count = sqlsession.selectOne("Bk_SearchCount", map);
			return count;
		}
		
		// 검색된 책 리스트 뿌려주기
		public List<BookDTO> Bk_SearchList(int startRow, int pageSize, String search, String category_){
			HashMap map = new HashMap();
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			map.put("search", search);
			map.put("category_", category_);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_SearchList", map);
			return booksearchList;
		}	
		
		// 상세검색 책 개수 구하기 1
		public int Bk_SearchTwoCount(String category1, String value1, String option, String category2, String value2){
			int count;
			HashMap map = new HashMap();
			map.put("category1", category1);
			map.put("value1", value1);
			map.put("option", option);
			map.put("category2", category2);
			map.put("value2", value2);
			count = sqlsession.selectOne("Bk_SearchTwoCount", map);
			return count;
		}
		
		// 상세검색 책 리스트 뿌려주기 1
		public List<BookDTO> Bk_SearchTwoList(String category1, String search1, String option, String category2, String search2, int startRow, int pageSize){
			HashMap map = new HashMap();
			map.put("category1", category1);
			map.put("search1", search1);
			map.put("option", option);
			map.put("category2", category2);
			map.put("search2", search2);
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_SearchTwoList", map);
			return booksearchList;
		}	
		
		// 상세검색 책 개수 구하기 2
		public int Bk_SearchTwoAllCount(String all, String option, String category, String value){
			int count;
			HashMap map = new HashMap();
			map.put("all", "%"+all+"%");
			map.put("option", option);
			map.put("category", category);
			map.put("value", value);
			count = sqlsession.selectOne("Bk_SearchTwoAllCount", map);
			return count;
		}
		
		// 상세검색 책 리스트 뿌려주기 2
		public List<BookDTO> Bk_SearchTwoAllList(String value, String option, String category1, String value1, int startRow, int pageSize){
			HashMap map = new HashMap();
			map.put("value", value);
			map.put("option", option);
			map.put("category1", category1);
			map.put("value1", value1);
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_SearchTwoAllList", map);
			return booksearchList;
		}	

		// 상세검색 책 개수 구하기 1
		public int Bk_SearchThrCount(String category1, String value1, String option1, String category2, String value2, String option2, String category3, String value3){
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
			count = sqlsession.selectOne("Bk_SearchThrCount", map);
			return count;
		}
		
		// 상세검색 책 리스트 뿌려주기 1
		public List<BookDTO> Bk_SearchThrList(String category1, String search1, String option1, String category2, String search2, String option2, String category3, String search3, int startRow, int pageSize){
			HashMap map = new HashMap();
			map.put("category1", category1);
			map.put("search1", search1);
			map.put("option1", option1);
			map.put("category2", category2);
			map.put("search2", search2);
			map.put("option2", option2);
			map.put("category3", category3);
			map.put("search3", search3);
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_SearchThrList", map);
			return booksearchList;
		}	
		
		// 상세검색 책 개수 구하기 2
		public int Bk_SearchThrAllCount(String all, String option1, String category1, String value1, String option2, String category2, String value2){
			int count;
			HashMap map = new HashMap();
			map.put("all", "%"+all+"%");
			map.put("option1", option1);
			map.put("category1", category1);
			map.put("value1", value1);
			map.put("option2", option2);
			map.put("category2", category2);
			map.put("value2", value2);
			count = sqlsession.selectOne("Bk_SearchThrAllCount", map);
			return count;
		}
		
		// 상세검색 책 리스트 뿌려주기 2
		public List<BookDTO> Bk_SearchThrAllList(String value, String option1, String category1, String value1, String option2, String category2, String search2, int startRow, int pageSize){
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
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_SearchThrAllList", map);
			return booksearchList;
		}			
		
		
		// 발행일을 검색내용에 넣을 때 책 검색
		
		// 검색결과로 나온 책 전체 개수 구하기
		public int Bk_DateSearchAllCount(String search, String pubDate){
			int count;
			HashMap map = new HashMap();
			map.put("all", "%"+search+"%");
			map.put("pubDate", pubDate);
			count=sqlsession.selectOne("Bk_DateSearchAllCount", map);
			return count;
		}
		
		// 검색결과로 나온 책 전체 리스트 뿌려주기
		public List<BookDTO> Bk_DateSearchAllList(int startRow, int pageSize, String search, String pubDate){
			HashMap map = new HashMap();
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			map.put("value", search);
			map.put("pubDate", pubDate);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_DateSearchAllList", map);
			return booksearchList;
		}		
		
		// 책 제목 검색결과 개수 구하기
		public int Bk_DateSearchCount(String search, String category, String pubDate){
			int count;
			HashMap map = new HashMap();
			map.put("value", search);
			map.put("category", category);
			map.put("pubDate", pubDate);
			count = sqlsession.selectOne("Bk_DateSearchCount", map);
			return count;
		}
		
		// 검색된 책 리스트 뿌려주기
		public List<BookDTO> Bk_DateSearchList(int startRow, int pageSize, String search, String category_, String pubDate){
			HashMap map = new HashMap();
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			map.put("search", search);
			map.put("category_", category_);
			map.put("pubDate", pubDate);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_DateSearchList", map);
			return booksearchList;
		}	
		
		// 상세검색 책 개수 구하기 1
		public int Bk_DateSearchTwoCount(String category1, String value1, String option, String category2, String value2 , String pubDate){
			int count;
			HashMap map = new HashMap();
			map.put("category1", category1);
			map.put("value1", value1);
			map.put("option", option);
			map.put("category2", category2);
			map.put("value2", value2);
			map.put("pubDate", pubDate);
			count = sqlsession.selectOne("Bk_DateSearchTwoCount", map);
			return count;
		}
		
		// 상세검색 책 리스트 뿌려주기 1
		public List<BookDTO> Bk_DateSearchTwoList(String category1, String search1, String option, String category2, String search2, int startRow, int pageSize, String pubDate){
			HashMap map = new HashMap();
			map.put("category1", category1);
			map.put("search1", search1);
			map.put("option", option);
			map.put("category2", category2);
			map.put("search2", search2);
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			map.put("pubDate", pubDate);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_DateSearchTwoList", map);
			return booksearchList;
		}	
		
		// 상세검색 책 개수 구하기 2
		public int Bk_DateSearchTwoAllCount(String all, String option, String category, String value, String pubDate){
			int count;
			HashMap map = new HashMap();
			map.put("all", "%"+all+"%");
			map.put("option", option);
			map.put("category", category);
			map.put("value", value);
			map.put("pubDate", pubDate);
			count = sqlsession.selectOne("Bk_DateSearchTwoAllCount", map);
			return count;
		}
		
		// 상세검색 책 리스트 뿌려주기 2
		public List<BookDTO> Bk_DateSearchTwoAllList(String value, String option, String category1, String value1, int startRow, int pageSize, String pubDate){
			HashMap map = new HashMap();
			map.put("value", value);
			map.put("option", option);
			map.put("category1", category1);
			map.put("value1", value1);
			map.put("startRow", startRow-1);
			map.put("pageSize", pageSize);
			map.put("pubDate", pubDate);
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_DateSearchTwoAllList", map);
			return booksearchList;
		}	

		// 상세검색 책 개수 구하기 1
		public int Bk_DateSearchThrCount(String category1, String value1, String option1, String category2, String value2, String option2, String category3, String value3, String pubDate){
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
			count = sqlsession.selectOne("Bk_DateSearchThrCount", map);
			return count;
		}
		
		// 상세검색 책 리스트 뿌려주기 1
		public List<BookDTO> Bk_DateSearchThrList(String category1, String value1, String option1, String category2, String value2, String option2, String category3, String value3, int startRow, int pageSize, String pubDate){
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
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_DateSearchThrList", map);
			return booksearchList;
		}	
		
		// 상세검색 책 개수 구하기 2
		public int Bk_DateSearchThrAllCount(String all, String option1, String category1, String value1, String option2, String category2, String value2, String pubDate){
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
			count = sqlsession.selectOne("Bk_DateSearchThrAllCount", map);
			return count;
		}
		
		// 상세검색 책 리스트 뿌려주기 2
		public List<BookDTO> Bk_DateSearchThrAllList(String value, String option1, String category1, String value1, String option2, String category2, String search2, int startRow, int pageSize, String pubDate){
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
			List<BookDTO> booksearchList = sqlsession.selectList("Bk_DateSearchThrAllList", map);
			return booksearchList;
		}		
// END 상세검색

	// 인기도서 리스트 출력
	public List<BookDTO> popularList() {
		List<BookDTO> popularList = sqlsession.selectList("popularList");
		return popularList;
	}

	// 신작도서 리스트 출력(2일 이내 출판된 것으로. 추후 원하는 기간이나 원하는 기준(ex>도서관 자체 입고날짜)으로 수정하면 됨)
	public List<BookDTO> newBookList() {
		List<BookDTO> newBookList = sqlsession.selectList("newBookList");
		return newBookList;
	}

	// 책 제목 검색결과 개수 구하기
	public int getBookSearchCount(String search) {
		int count;
		count = sqlsession.selectOne("book.getBookSearchCount", search);
		return count;
	}

	// 검색된 책 리스트 뿌려주기
	public List<BookDTO> getBookSearchList(int startRow, int pageSize, String search) {
		HashMap map = new HashMap();
		map.put("startRow", startRow - 1);
		map.put("pageSize", pageSize);
		map.put("search", search);
		List<BookDTO> booksearchList = sqlsession.selectList("book.getBookSearchList", map);
		return booksearchList;
	}

	// 희망도서 신청 insert 해주기
	public int insertHBook(BookDTO bookdto){
		int result;
		result = sqlsession.insert("insertHBook", bookdto);
		return result;
	}
	
	// BookIndex 에서 user아이뒤로 빌린책 조회
	public int userBorrowBookCheck(String member_id) {
		System.out.println("userBorrowBookCheck()");
		System.out.println("member_id : " + member_id);
		int result;
		result = sqlsession.selectOne("MyBorrowBookCheck", member_id);
		System.out.println("userBorrowBookCheck : "+result);
		return result;
	}
}
