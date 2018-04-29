package net.book.db;

import java.sql.Timestamp;

public class BookDTO {
	//	<book table>	
	int book_number;				//	고유번호			int(5)	PK								도서관이 보유한 책들에 자체적으로 부여한 번호
	String book_subject;				//	표제					varchar(100)						책 제목
	String book_author;				//	저자					char(40)								책 저자
	String book_publisher;			//	발행처				char(20)								출판사
	Timestamp book_pubDate;	//	발행일				date									책 발행일
	String book_form;				//	형태					char(20)								책 형태
	String book_notation;			//	주기					varchar(100)						책 주기
	String book_isbn;					//	국제표준번호		int(18)								국제표준번호 ISBN
	String book_classification;		//	분류기호			varchar(40)							책 분류기호
	Timestamp book_date;				//	입고일				date									도서관에 입고된 날짜
	
	//	<dbook table>						
	String dbook_reason;			//	사유					char(40)								파기 사유
	String dbook_state;				//	도서상태			char(40)								책 상태
	
	//	<bbook table>						
	Timestamp bbook_bdate;		//	대출일자			date									책 빌려간 날짜
	Timestamp bbook_rdate;		//	반납일자			date									책 반납한 날짜
	String bbook_bstate;			//	반납상태			char(2)	check in ('0','1')		반납됐는지 여부(대출중/반납됨)
													
	//	<rbook table>						
	int rbook_num;					//	예약순서			int(2)									회원의 해당 책 예약 우선순위
	Timestamp rbook_date;		//	예약일자			date									회원이 예약한 날짜
	String rbook_check;				//	입고현황			char(2)	check in ('0','1')		예약된 책 도서관에 있는지 여부(없음/있음)
	
	//	<hbook table>						
	String hbook_subject;			//	도서명				varchar(100)						희망도서명
	String hbook_author;			//	저자					char(40)								희망도서 저자
	String hbook_check;				//	처리상태			char(10)	check in ('wait','in','not-in')	wait	희망도서 처리여부(대기/입고됨/입고불가)
	String hbook_publisher;		//	발행처				char(20)								출판사
	int hbook_isbn;					//	국제표준번호		int(18)								국제표준번호 ISBN
	String hbook_explain;			//	희망도서 설명		varchar(2000)						희망도서 설명
	
	//getter, setter 구현
	public void setBook_number(int book_number) {
		this.book_number = book_number;
	}
	public void setBook_subject(String book_subject) {
		this.book_subject = book_subject;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}
	public void setBook_pubDate(Timestamp book_pubDate) {
		this.book_pubDate = book_pubDate;
	}
	public void setBook_form(String book_form) {
		this.book_form = book_form;
	}
	public void setBook_notation(String book_notation) {
		this.book_notation = book_notation;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public void setBook_classification(String book_classification) {
		this.book_classification = book_classification;
	}
	public void setDbook_reason(String dbook_reason) {
		this.dbook_reason = dbook_reason;
	}
	public void setDbook_state(String dbook_state) {
		this.dbook_state = dbook_state;
	}
	public void setBbook_bdate(Timestamp bbook_bdate) {
		this.bbook_bdate = bbook_bdate;
	}
	public void setBbook_rdate(Timestamp bbook_rdate) {
		this.bbook_rdate = bbook_rdate;
	}
	public void setBbook_bstate(String bbook_bstate) {
		this.bbook_bstate = bbook_bstate;
	}
	public void setRbook_num(int rbook_num) {
		this.rbook_num = rbook_num;
	}
	public void setRbook_date(Timestamp rbook_date) {
		this.rbook_date = rbook_date;
	}
	public void setRbook_check(String rbook_check) {
		this.rbook_check = rbook_check;
	}
	public void setHbook_subject(String hbook_subject) {
		this.hbook_subject = hbook_subject;
	}
	public void setHbook_author(String hbook_author) {
		this.hbook_author = hbook_author;
	}
	public void setHbook_check(String hbook_check) {
		this.hbook_check = hbook_check;
	}
	public void setHbook_publisher(String hbook_publisher) {
		this.hbook_publisher = hbook_publisher;
	}
	public void setHbook_isbn(int hbook_isbn) {
		this.hbook_isbn = hbook_isbn;
	}
	public void setHbook_explain(String hbook_explain) {
		this.hbook_explain = hbook_explain;
	}
	public Timestamp getBook_date() {
		return book_date;
	}
	public void setBook_date(Timestamp book_date) {
		this.book_date = book_date;
	}
	public int getBook_number() {
		return book_number;
	}
	public String getBook_subject() {
		return book_subject;
	}
	public String getBook_author() {
		return book_author;
	}
	public String getBook_publisher() {
		return book_publisher;
	}
	public Timestamp getBook_pubDate() {
		return book_pubDate;
	}
	public String getBook_form() {
		return book_form;
	}
	public String getBook_notation() {
		return book_notation;
	}
	public String getBook_isbn() {
		return book_isbn;
	}
	public String getBook_classification() {
		return book_classification;
	}
	public String getDbook_reason() {
		return dbook_reason;
	}
	public String getDbook_state() {
		return dbook_state;
	}
	public Timestamp getBbook_bdate() {
		return bbook_bdate;
	}
	public Timestamp getBbook_rdate() {
		return bbook_rdate;
	}
	public String getBbook_bstate() {
		return bbook_bstate;
	}
	public int getRbook_num() {
		return rbook_num;
	}
	public Timestamp getRbook_date() {
		return rbook_date;
	}
	public String getRbook_check() {
		return rbook_check;
	}
	public String getHbook_subject() {
		return hbook_subject;
	}
	public String getHbook_author() {
		return hbook_author;
	}
	public String getHbook_check() {
		return hbook_check;
	}
	public String getHbook_publisher() {
		return hbook_publisher;
	}
	public int getHbook_isbn() {
		return hbook_isbn;
	}
	public String getHbook_explain() {
		return hbook_explain;
	}
	
}
