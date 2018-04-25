package net.member.db;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.myBatisSetting.sqlMapConfig;

public class MemberDAO {

	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		sqlsession = sessionf.openSession(true);
	}

	//맴버 추가 메소드(회원가입)
	public int insertMember(MemberDTO mDTO) {
		int result;
		result = sqlsession.insert("insertMember", mDTO);
		return result;
	}
	
	//맴버 유저체크 메소드
	public int selectUserChk(String member_id, String member_pass) {
		MemberDTO mDTO = new MemberDTO();
		int check = 0;
		mDTO = sqlsession.selectOne("selectMember", member_id);
		
		String id = mDTO.getMember_id();
		
		if (id != null) {	
			if (mDTO.getMember_pass().equals(member_pass)) check = 1;
			else check = 0;
		} else check = -1;
		
		return check;
	}
	
	//맴버 리스트 불러오기
	public List<MemberDTO> selectMemberList(String member_id) {
		List<MemberDTO> mList = new ArrayList<MemberDTO>();
		mList = sqlsession.selectList("selectMember", member_id);
		
		return mList;
	}
	
	
	
	
}
