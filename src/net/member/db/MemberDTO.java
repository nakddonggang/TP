package net.member.db;

import java.util.Date;

public class MemberDTO {
	//	Member table
	String member_id; 				// 아이디					varchar(20)	PK					회원 아이디
	String member_pass; 			//	비밀번호				varchar(20)	NOT NULL		비밀번호
	String member_name; 			//	이름						char(10)	NOT NULL			회원 이름(한글 5글자)
	String member_post; 			//	우편번호				char(6)							회원 우편번호(구 우편번호 6자, 신 우편번호 5자)
	String member_address1; 		//	기본주소				varchar(60)						회원 기본주소
	String member_address2; 		//	상세주소				varchar(60)						회원 상세주소
	String member_phone; 		//	전화번호				char(14)							회원 전화번호
	String member_email; 			//	E-mail					varchar(320)					회원 E-mail
	Date member_date;		// 가입일					date								회원 가입일
	String member_level;
	
	//	BlackList table
	int bl_count;						 //	연체 횟수				int(3)								해당 회원 연체 횟수
	int bl_date; 						 //	연체 총일수			int(5)								해당 회원 연체 총 일수
	String bl_check;					 //	 블랙리스트 상태		char(2)	check in ('0','1')	블랙리스트인지 여부(블랙리스트o/블랙리스트x)
	
	//	Basket table
	int book_number;				 //		책 고유번호		int(5)	FK							책 고유번호
	int basket_number;				 //	바구니 예약 번호		int(5)	NOT NULL				책바구니 리스트 순서 번호
	String book_subject;			//	표제					varchar(100)						책 제목
	String book_author;				//	저자					char(40)								책 저자
	String book_publisher;			//	발행처				char(20)								출판사
	String book_isbn;				//	국제표준번호		int(18)								국제표준번호 ISBN
	Date book_pubDate;				//	발행일				date									책 발행일
	String book_file;				// 	책 사진 넣기			file
	
	//	good_Member table
	int borrow_count;				 //	대출 횟수				int(5)								해당 회원의 책 대출 횟수
	String gm_check;					 //	우수회원 체크			char(2)	check in ('0','1')	우수회원인지 여부
	
	// bbook, rbook 상태
	String bbook_bstate;			//	반납상태			char(2)	check in ('0','1')		반납됐는지 여부(대출중/반납됨)
	String rbook_check;				//	예약가능현황		char(2)	check in ('0','1')		예약가능한지 여부(불가/가능)
	
	//getter, setter 구현
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_post() {
		return member_post;
	}
	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}
	public String getMember_address1() {
		return member_address1;
	}
	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}
	public String getMember_address2() {
		return member_address2;
	}
	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
	public int getBl_count() {
		return bl_count;
	}
	public void setBl_count(int bl_count) {
		this.bl_count = bl_count;
	}
	public int getBl_date() {
		return bl_date;
	}
	public void setBl_date(int bl_date) {
		this.bl_date = bl_date;
	}
	public String getBl_check() {
		return bl_check;
	}
	public void setBl_check(String bl_check) {
		this.bl_check = bl_check;
	}
	public int getBook_number() {
		return book_number;
	}
	public void setBook_number(int book_number) {
		this.book_number = book_number;
	}
	public int getBasket_number() {
		return basket_number;
	}
	public void setBasket_number(int basket_number) {
		this.basket_number = basket_number;
	}
	public int getBorrow_count() {
		return borrow_count;
	}
	public void setBorrow_count(int borrow_count) {
		this.borrow_count = borrow_count;
	}
	public String getGm_check() {
		return gm_check;
	}
	public void setGm_check(String gm_check) {
		this.gm_check = gm_check;
	}
	public String getBook_subject() {
		return book_subject;
	}
	public void setBook_subject(String book_subject) {
		this.book_subject = book_subject;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public Date getBook_pubDate() {
		return book_pubDate;
	}
	public void setBook_pubDate(Date book_pubDate) {
		this.book_pubDate = book_pubDate;
	}
	public String getBook_publisher() {
		return book_publisher;
	}
	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}
	public String getBook_file() {
		return book_file;
	}
	public void setBook_file(String book_file) {
		this.book_file = book_file;
	}
	public String getBbook_bstate() {
		return bbook_bstate;
	}
	public void setBbook_bstate(String bbook_bstate) {
		this.bbook_bstate = bbook_bstate;
	}
	public String getRbook_check() {
		return rbook_check;
	}
	public void setRbook_check(String rbook_check) {
		this.rbook_check = rbook_check;
	}
}
