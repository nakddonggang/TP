package net.book.db;

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
	
	// 책 정보 눌렀을 때 상세정보 보여주기
	public BookDTO getBookInfo(int book_number){
		BookDTO bookList = sqlsession.selectOne("book.getBookInfo", book_number);
		return bookList;
	}
	// 인기도서 리스트 출력
	public List<BookDTO> popularList(){
		List<BookDTO> popularList = sqlsession.selectList("popularList");
		return popularList;
	}
	// 신작도서 리스트 출력(2일 이내 출판된 것으로. 추후 원하는 기간이나 원하는 기준(ex>도서관 자체 입고날짜)으로 수정하면 됨)
	public List<BookDTO> newBookList(){
		List<BookDTO> newBookList = sqlsession.selectList("newBookList");
		return newBookList;
	}

}
