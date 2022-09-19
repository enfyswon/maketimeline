package kr.co.mt.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {

	private String mno;
	private String mni;
	private String email;
	private String mpwd;
	private String tel;
	
	private String mpho;
	private String mpho_path;
	private String mdes;
	private MultipartFile profile;
	
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getMni() {
		return mni;
	}
	public void setMni(String mni) {
		this.mni = mni;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMpho() {
		return mpho;
	}
	public void setMpho(String mpho) {
		this.mpho = mpho;
	}
	public String getMpho_path() {
		return mpho_path;
	}
	public void setMpho_path(String mpho_path) {
		this.mpho_path = mpho_path;
	}
	public String getMdes() {
		return mdes;
	}
	public void setMdes(String mdes) {
		this.mdes = mdes;
	}
	public MultipartFile getProfile() {
		return profile;
	}
	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}
	

	
}//class
