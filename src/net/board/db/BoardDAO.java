package net.board.db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.member.db.MemberDTO;
import util.myBatisSetting.sqlMapConfig;

public class BoardDAO {
	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BoardDAO(){
		sqlsession = sessionf.openSession(true);
	}
	
	//NOtice 게시판 글쓰기
	public int insertNotice(BoardDTO bDTO){
		int result;
		result = sqlsession.insert("insertNotice", bDTO);
		return result;
	}
	
	
	//Qna 게시판 글쓰기
	public int insertQna(Vector vector) {
		int result;
		HashMap map = new HashMap<>();
		List<BoardDTO> list = (List<BoardDTO>)vector.get(0);
		String id = (String)vector.get(1);
		map.put("list", list);
		map.put("id", id);
		
		result = sqlsession.insert("insertQna", map);
		return result;
	}
	
	public int selectMaxNum() {
		int maxNum;
		maxNum = sqlsession.selectOne("selectMaxNum");
		return maxNum;
	}
	
}