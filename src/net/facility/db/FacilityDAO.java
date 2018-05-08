package net.facility.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.member.db.MemberDTO;
import util.myBatisSetting.sqlMapConfig;

public class FacilityDAO {
	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	HashMap map = null;
	
	public FacilityDAO(){
		sqlsession = sessionf.openSession(true);
	}
	
	// facility 자리 Detail
	public FacilityDTO getFacilityDetail(String facil_num) {
		FacilityDTO fDTO = new FacilityDTO();
		fDTO = sqlsession.selectOne("selectFacility", facil_num);
		return fDTO;
	}
	
	// facility 자리 사용유무 변환
	public FacilityDTO UseFacility(String facil_num , String member_id , String facil_use) {
		FacilityDTO fDTO = new FacilityDTO();
		map = new HashMap();
		 map.put("facil_num" , facil_num);
		 map.put("member_id" , member_id);
		 map.put("facil_use" , facil_use);
		sqlsession.update("updateFacility", map);
		return fDTO;
	}
	
	//	facility 자리 반납
	public FacilityDTO UnUseFacility(String facil_num , String facil_use) {
		FacilityDTO fDTO = new FacilityDTO();
		map = new HashMap();
		map.put("facil_num", facil_num);
		map.put("facil_use", facil_use);
		sqlsession.update("UnupdateFacility", map);
		return fDTO;
	}
	
	//	facility 목록 출력
	public List<FacilityDTO> getFacilityList() {
		List<FacilityDTO> Facilitylist = sqlsession.selectList("getFacilityList");
		return Facilitylist;
	}
	
	//	facility 중복 확인
	public int useMember(String member_id) {
		FacilityDTO fDTO = new FacilityDTO();
		int check = 0;
		check = sqlsession.selectOne("selectFacilMember", member_id);
		return check;
	}
}
