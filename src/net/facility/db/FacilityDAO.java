package net.facility.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.myBatisSetting.sqlMapConfig;

public class FacilityDAO {
	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public FacilityDAO(){
		sqlsession = sessionf.openSession(true);
	}
	
	// facility 자리 Detail
	public FacilityDTO getFacilityDetail(int facil_num) {
		FacilityDTO fDTO = new FacilityDTO();
		fDTO = sqlsession.selectOne("selectFacility", facil_num);
		return fDTO;
	}
}
