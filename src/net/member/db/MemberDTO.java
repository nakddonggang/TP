package net.member.db;

import java.sql.Date;

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
	
	//	BlackList table
	int bl_count;						 //	연체 횟수				int(3)								해당 회원 연체 횟수
	int bl_date; 						 //	연체 총일수			int(5)								해당 회원 연체 총 일수
	String bl_check;					 //	 블랙리스트 상태		char(2)	check in ('0','1')	블랙리스트인지 여부(블랙리스트o/블랙리스트x)
	
	//	Basket table
	int book_number;				 //		책 고유번호		int(5)	FK							책 고유번호
	int basket_number;				 //	바구니 예약 번호		int(5)	NOT NULL				책바구니 리스트 순서 번호
	
	//	good_Member table
	int borrow_count;				 //	대출 횟수				int(5)								해당 회원의 책 대출 횟수
	String gm_check;					 //	우수회원 체크			char(2)	check in ('0','1')	우수회원인지 여부
	
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
}
