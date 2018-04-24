package net.board.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.myBatisSetting.sqlMapConfig;

public class BoardDAO {
	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BoardDAO(){
		sqlsession = sessionf.openSession(true);
	}
}
