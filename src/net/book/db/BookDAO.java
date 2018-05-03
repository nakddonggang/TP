package net.book.db;

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
			BookDTO bookList = sqlsession.selectOne("getBookInfo", book_number);
			return bookList;
		}

}
