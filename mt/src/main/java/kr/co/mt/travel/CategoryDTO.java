package kr.co.mt.travel;

import org.springframework.web.multipart.MultipartFile;

public class CategoryDTO {
	private String cate_no;
	private String cate_name;
	private String mno;
	private String region_no;
	private String cate_startdate;
	private String cate_enddate;
	private MultipartFile cate_photo;
	private String cate_photoname;
	private String cate_photopath;
	
	public String toString() {
		return cate_name + " : " + mno + " : " + region_no 
				+ " : " + cate_startdate + " : " + cate_enddate
				+ " : " + cate_photoname + " : " + cate_photopath;
	}
	
	public String getCate_no() {
		return cate_no;
	}
	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getRegion_no() {
		return region_no;
	}
	public void setRegion_no(String region_no) {
		this.region_no = region_no;
	}
	public String getCate_startdate() {
		return cate_startdate;
	}
	public void setCate_startdate(String cate_startdate) {
		this.cate_startdate = cate_startdate;
	}
	public String getCate_enddate() {
		return cate_enddate;
	}
	public void setCate_enddate(String cate_enddate) {
		this.cate_enddate = cate_enddate;
	}
	public MultipartFile getCate_photo() {
		return cate_photo;
	}
	public void setCate_photo(MultipartFile cate_photo) {
		this.cate_photo = cate_photo;
	}
	public String getCate_photoname() {
		return cate_photoname;
	}
	public void setCate_photoname(String cate_photoname) {
		this.cate_photoname = cate_photoname;
	}
	public String getCate_photopath() {
		return cate_photopath;
	}
	public void setCate_photopath(String cate_photopath) {
		this.cate_photopath = cate_photopath;
	}
}
