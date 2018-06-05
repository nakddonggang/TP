package net.main.db;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.myBatisSetting.sqlMapConfig;

public class VisitCountDAO 
{
	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
    private static VisitCountDAO instance;
    
    // 싱글톤 패턴
    private VisitCountDAO(){
    	sqlsession = sessionf.openSession(true);
    }
    
    public static VisitCountDAO getInstance(){
        if(instance==null)
            instance=new VisitCountDAO();
        return instance;
    }
    
    public void setTotalCount() throws SQLException {
    	sqlsession.insert("setTotalCount");
    } // end setTotalCount()
    
    /**
     * 총 방문자수를 가져온다.
     * @return totalCount : 총 방문자 수
     */
    public int getTotalCount() {
    	int totalCount = 0;
    	totalCount = sqlsession.selectOne("getTotalCount");
    	return totalCount;
    } // end getTotalCount()
    
    /**
     * 오늘 방문자 수를 가져온다.
     * @return todayCount : 오늘 방문자
     */
    public int getTodayCount() {
		int todayCount = 0;
		todayCount = sqlsession.selectOne("getTodayCount");
		return todayCount;
    }// end getTodayCount()
}