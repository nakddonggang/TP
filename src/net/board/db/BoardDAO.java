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
	
	public int insertCur(BoardDTO bDTO) {
		int result;
		int count = sqlsession.selectOne("countCur");
		if((Integer)count == null ) count = -1;
		System.out.println(count);
		count += 1;
		bDTO.setCur_num(count);
		result = sqlsession.insert("insertCur", bDTO);
		return result;
	}
}
