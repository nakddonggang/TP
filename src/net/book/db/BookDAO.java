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
	
	public List<BookDTO> popularList(){
		List<BookDTO> popularList = sqlsession.selectList("popularList");
		return popularList;
	}

}
