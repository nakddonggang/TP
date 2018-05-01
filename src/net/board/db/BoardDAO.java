package net.board.db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.myBatisSetting.sqlMapConfig;

public class BoardDAO {
	SqlSessionFactory sessionf = sqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BoardDAO(){
		sqlsession = sessionf.openSession(true);
	}
	

	public void insertFaq(BoardDTO bDTO) {
		sqlsession.insert("insertFaq",bDTO);
	}
	
	public int selectFaq() {
		int result;
		result=sqlsession.selectOne("selectFaq");
		return result;
	}
	
	/* **************큐레이션(Curation)************** */
	//Curation 게시판 Max Number 구하기
	public int selectCMaxNum() {
		int maxNum;
		maxNum = sqlsession.selectOne("selectCMaxNum");
		return maxNum;
	}
	//Curation 게시판 글쓰기
	public void insertCur(BoardDTO bDTO) {
		sqlsession.insert("insertCur", bDTO);
	}
	//Curation 게시판 글 수정
	public void updateCur(BoardDTO bDTO){
		sqlsession.update("updateCur", bDTO);
	}
	//Curation 게시판 글 삭제
	public void deleteCur(int cur_num){
		sqlsession.delete("deleteCur", cur_num);
	}
	//Curation 게시판 글 개수 구하기
	public int getCurationCount(){
		int count;
		count = sqlsession.selectOne("getCurationCount");
		return count;
	}
	//Curation 게시판 리스트
	public List<BoardDTO> getCurationList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BoardDTO> curationList = sqlsession.selectList("getCurationList",map);
		return curationList;
	}
	//Curation 게시판 번호에 해당하는 글 가져오기
	public BoardDTO getCuration(int num){
		BoardDTO bDTO = sqlsession.selectOne("getCuration", num);
		return bDTO;
	}
	//Curation 게시판 제목 검색결과 개수
	public int getCSearchCount(String search){
		int count;
		count = sqlsession.selectOne("getCSearchCount", search);
		return count;
	}
	//Curation 게시판 검색결과 보여주기
	public List<BoardDTO> getCSearchList(int startRow, int pageSize, String search){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("search", search);
		List<BoardDTO> searchList = sqlsession.selectList("getCSearchList", map);
		return searchList;
	}
		
	/* **************공지사항(Notice)************** */
	//Notice 게시판 Max Number 구하기
	public int selectNMaxNum() {
		int maxNum;
		maxNum = sqlsession.selectOne("selectNMaxNum");
		return maxNum;
	}
	//Notice 게시판 글쓰기
	public void insertNotice(BoardDTO bDTO){
		sqlsession.insert("insertNotice", bDTO);
	}
	//Notice 게시판 글 수정
	public void updateNotice(BoardDTO bDTO){
		sqlsession.update("updateNotice", bDTO);
	}
	//Notice 게시판 글 삭제
	public void deleteNotice(int notice_num){
		sqlsession.delete("deleteNotice", notice_num);
	}
	//Notice 게시판 글 개수 구하기
	public int getNoticeCount(){
		int count;
		count = sqlsession.selectOne("getNoticeCount");
		return count;
	}
	//Notice 게시판 리스트
	public List<BoardDTO> getNoticeList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BoardDTO> noticeList = sqlsession.selectList("getNoticeList",map);
		return noticeList;
	}
	//Notice 게시판 번호에 해당하는 글 가져오기
	public BoardDTO getNotice(int num){
		BoardDTO bDTO = sqlsession.selectOne("getNotice", num);
		return bDTO;
	}
	//Notice 게시판 제목 검색결과 개수
	public int getNSearchCount(String search){
		int count;
		count = sqlsession.selectOne("getNSearchCount", search);
		return count;
	}
	//Notice 게시판 검색결과 보여주기
	public List<BoardDTO> getNSearchList(int startRow, int pageSize, String search){
		HashMap map = new HashMap();
		search = search.replaceAll(search, "%"+search+"%");
		map.put("search", search);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BoardDTO> searchList = sqlsession.selectList("getNSearchList", map);
		return searchList;
	}
	
	/* **************Q&A************** */
	//Q&A 게시판 Max Number 구하기
	public int selectQMaxNum() {
		int maxNum;
		maxNum = sqlsession.selectOne("selectQMaxNum");
		return maxNum;
	}
	//Q&A 게시판 글쓰기
	public void insertQna(BoardDTO bDTO, String id) {
		HashMap map = new HashMap();
		map.put("bDTO", bDTO);
		map.put("member_id", id);	
		sqlsession.insert("insertQna", map);
	}
	//Q&A 게시판 글 수정
	public void updateQna(BoardDTO bDTO){
		sqlsession.update("updateQna", bDTO);
	}
	//Q&A 게시판 글 삭제
	public void deleteQna(int qna_num){
		sqlsession.delete("deleteQna", qna_num);
	}
	//Q&A 게시판 글 개수 구하기
	public int getQnaCount(){
		int count;
		count = sqlsession.selectOne("getQnaCount");
		return count;
	}
	//Q&A 게시판 리스트
	public List<BoardDTO> getQnaList(int startRow, int pageSize){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		List<BoardDTO> qnaList = sqlsession.selectList("getQnaList", map);
		return qnaList;
	}
	//Q&A 게시판 번호에 해당하는 글 가져오기
	public BoardDTO getQna(int num){
		BoardDTO bDTO = sqlsession.selectOne("getQna", num);
		return bDTO;
	}
	//Q&A 게시판 제목 검색결과 개수
	public int getQSearchCount(String search){
		int count;
		count = sqlsession.selectOne("getQSearchCount", search);
		return count;
	}
	//Q&A 게시판 검색결과 보여주기
	public List<BoardDTO> getQSearchList(int startRow, int pageSize, String search){
		HashMap map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		map.put("search", search);
		List<BoardDTO> searchList = sqlsession.selectList("getQSearchList", map);
		return searchList;
	}
	
	/* **************Q&A 답변글************** */
	//Q&A 답변글쓰기
	public void insertReply(BoardDTO bDTO) {	
		sqlsession.insert("insertReply", bDTO);
	}
	//Q&A 답변글 달린 것 체크 수정 : "0" => "1"\
	public void updateCheck(int qna_ref){
		sqlsession.update("updateCheck", qna_ref);
	}
	//Q&A 답변글 수정
	public void updateReply(BoardDTO bDTO){
		sqlsession.update("updateReply", bDTO);
	}
	//Q&A 답변글 삭제
	public void deleteReply(int qna_ref){
		sqlsession.delete("deleteReply", qna_ref);
	}
	//Q&A 게시판 글 번호에 해당하는 답변글 가져오기
	public BoardDTO getReply(int num){
		BoardDTO bDTO = sqlsession.selectOne("getReply", num);
		return bDTO;
	}
}