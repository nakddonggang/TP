package net.board.db;

import java.sql.Timestamp;

public class BoardDTO {
	//	<notice table>						
	int notice_num;					//	글 번호	int(5)	PK		공지사항 번호
	String notice_type;				//	글 종류	char(20)			공지사항 종류 ex)공고/행사…
	String notice_subject;			//	글 제목	varchar(100)			공지사항 제목
	String notice_content;			//	글 내용	varchar(2000)			공지사항 내용
	String notice_file;				//	파일 이름	varchar(50)			공지사항 첨부파일 이름
	Timestamp notice_date;		//	등록일	date			공지사항 작성일
	int notice_readcount;			//	조회수	int(5)		0	공지사항 조회수

	//	<faq table>						
	int faq_num;						//	글 번호	int(5)	PK		FAQ 번호
	String faq_type;					//	글 종류	char(20)			FAQ 종류 ex)이용/회원…
	String faq_subject;				//	글 제목	varchar(100)			FAQ 질문
	String faq_content;				//	글 내용	varchar(2000)			FAQ 답변
	String faq_file;					//	파일 이름	varchar(50)			FAQ 올릴경우 파일 이름

	//	<suggest table>						
	int sug_num;					//	글 번호	int(5)	PK		사용자가 작성한 건의사항 관리자 전용 게시판에 순서대로 번호…(관리자가 확인할 때 필요/관리자 전용)
	String sug_type;					//	글 종류	char(20)			건의사항 종류 ex)도서/시설…
	String sug_subject;				//	글 제목	varchar(100)			건의사항 제목
	String sug_content;				//	글 내용	varchar(2000)			건의사항 내용
	Timestamp sug_date;			//	글 작성일	date			건의한 날짜(관리자가 확인할 때 필요/관리자 전용)

	//	<qna table>						
	int qna_num;					//	글 번호	int(5)	PK		질문게시판 글 번호
	String member_id;				//	아이디	varchar(20)		작성자 아이디
	String qna_subject;				//	글 제목	varchar(100)			질문게시판 글 제목
	String qna_content;				//	글 내용	varchar(2000)			질문게시판 글 내용
	Timestamp qna_date;			//	작성일	date			질문게시판 글 작성일
	int qna_readcount;				//	조회수	int(5)		0	해당 글 조회수
	int qna_ref;						//	참조글 번호	int(5)			관리자 답변글에 쓰일 참조번호
	String qna_check;				//	답변 유무	char(2)	check in ('0', '1')	0	관리자 답변이 달렸는지 아닌지 여부(답변대기/답변등록)
		
	//	<reply table>						
	String rep_name;				//	답변자 이름	char(10)			답변자 이름 ex) 관리자/xx부…
	String rep_email;				//	답변자 email	varchar(320)			답변자 E-mail
	String rep_content;				//	답변내용	varchar(2000)			질문에 대한 답변 내용
	
	//	<curation table>						
	int cur_num;						//	글 번호	int(5)	PK		큐레이션 순서번호
	String cur_name;				//	작성자	char(10)			큐레이션 작성자
	String cur_subject;				//	글 제목	varchar(100)			큐레이션 제목
	String cur_content;				//	글 내용	varchar(2000)			큐레이션 내용
	String cur_file;					//	파일명	varchar(50)			해당 큐레이션에 첨부된 파일이름
	int cur_readcount;				//	조회수	int(5)		0	해당 큐레이션 조회수
	String cur_type;					//	테마 종류	char(20)			큐레이션 테마 종류
	
	//getter, setter 구현
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public Timestamp getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_type() {
		return faq_type;
	}
	public void setFaq_type(String faq_type) {
		this.faq_type = faq_type;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_file() {
		return faq_file;
	}
	public void setFaq_file(String faq_file) {
		this.faq_file = faq_file;
	}
	public int getSug_num() {
		return sug_num;
	}
	public void setSug_num(int sug_num) {
		this.sug_num = sug_num;
	}
	public String getSug_type() {
		return sug_type;
	}
	public void setSug_type(String sug_type) {
		this.sug_type = sug_type;
	}
	public String getSug_subject() {
		return sug_subject;
	}
	public void setSug_subject(String sug_subject) {
		this.sug_subject = sug_subject;
	}
	public String getSug_content() {
		return sug_content;
	}
	public void setSug_content(String sug_content) {
		this.sug_content = sug_content;
	}
	public Timestamp getSug_date() {
		return sug_date;
	}
	public void setSug_date(Timestamp sug_date) {
		this.sug_date = sug_date;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Timestamp getQna_date() {
		return qna_date;
	}
	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_readcount() {
		return qna_readcount;
	}
	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}
	public int getQna_ref() {
		return qna_ref;
	}
	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}
	public String getQna_check() {
		return qna_check;
	}
	public void setQna_check(String qna_check) {
		this.qna_check = qna_check;
	}
	public String getRep_name() {
		return rep_name;
	}
	public void setRep_name(String rep_name) {
		this.rep_name = rep_name;
	}
	public String getRep_email() {
		return rep_email;
	}
	public void setRep_email(String rep_email) {
		this.rep_email = rep_email;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public int getCur_num() {
		return cur_num;
	}
	public void setCur_num(int cur_num) {
		this.cur_num = cur_num;
	}
	public String getCur_name() {
		return cur_name;
	}
	public void setCur_name(String cur_name) {
		this.cur_name = cur_name;
	}
	public String getCur_subject() {
		return cur_subject;
	}
	public void setCur_subject(String cur_subject) {
		this.cur_subject = cur_subject;
	}
	public String getCur_content() {
		return cur_content;
	}
	public void setCur_content(String cur_content) {
		this.cur_content = cur_content;
	}
	public String getCur_file() {
		return cur_file;
	}
	public void setCur_file(String cur_file) {
		this.cur_file = cur_file;
	}
	public int getCur_readcount() {
		return cur_readcount;
	}
	public void setCur_readcount(int cur_readcount) {
		this.cur_readcount = cur_readcount;
	}
	public String getCur_type() {
		return cur_type;
	}
	public void setCur_type(String cur_type) {
		this.cur_type = cur_type;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
