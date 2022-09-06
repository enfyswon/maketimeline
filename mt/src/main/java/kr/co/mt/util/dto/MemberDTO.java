package kr.co.mt.util.dto;

public class MemberDTO {

	private String mem_no;
	private String mem_nick;
	private String mem_email;
	private String mem_pwd;
	private String pnum;
	private String mem_photo;
	private String mem_photopath;
	private String mem_desc;
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}
	public String getMem_photopath() {
		return mem_photopath;
	}
	public void setMem_photopath(String mem_photopath) {
		this.mem_photopath = mem_photopath;
	}
	public String getMem_desc() {
		return mem_desc;
	}
	public void setMem_desc(String mem_desc) {
		this.mem_desc = mem_desc;
	}
	
}//class

/*
 * DTO의 종류
 * 1. Table DTO : 테이블 컬럼과 동일한 변수를 갖는 DTO
 * 2. View DTO : 화면 요소와 동일한 변수를 갖는 DTO
 * 3. Composite DTO : 복합적인 변수를 갖는 DTO
 * -> 결론은 개발자 맘대로 만드시면 되요.
 */
