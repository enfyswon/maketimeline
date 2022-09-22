package kr.co.mt.travel.timeline;

import org.springframework.web.multipart.MultipartFile;

public class TimelineDTO {
	private String timeline_no;
	private String cate_no;
	private String timeline_name;
	private String timeline_desc;
	private String timeline_startdate;
	private String timeline_enddate;
	private int timeline_amount;
	private String timeline_loc;
	private MultipartFile timeline_photo;
	private String timeline_photoname;
	private String timeline_photopath;
	private String money_no;
	private String timeline_allDay;
	
	private String mno;
	private String mni;
	private String mpho_path;
	
	public String getTimeline_no() {
		return timeline_no;
	}
	public void setTimeline_no(String timeline_no) {
		this.timeline_no = timeline_no;
	}
	public String getCate_no() {
		return cate_no;
	}
	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}
	public String getTimeline_name() {
		return timeline_name;
	}
	public void setTimeline_name(String timeline_name) {
		this.timeline_name = timeline_name;
	}
	public String getTimeline_desc() {
		return timeline_desc;
	}
	public void setTimeline_desc(String timeline_desc) {
		this.timeline_desc = timeline_desc;
	}
	public String getTimeline_startdate() {
		return timeline_startdate;
	}
	public void setTimeline_startdate(String timeline_startdate) {
		this.timeline_startdate = timeline_startdate;
	}
	public String getTimeline_enddate() {
		return timeline_enddate;
	}
	public void setTimeline_enddate(String timeline_enddate) {
		this.timeline_enddate = timeline_enddate;
	}
	public int getTimeline_amount() {
		return timeline_amount;
	}
	public void setTimeline_amount(int timeline_amount) {
		this.timeline_amount = timeline_amount;
	}
	public String getTimeline_loc() {
		return timeline_loc;
	}
	public void setTimeline_loc(String timeline_loc) {
		this.timeline_loc = timeline_loc;
	}
	public MultipartFile getTimeline_photo() {
		return timeline_photo;
	}
	public void setTimeline_photo(MultipartFile timeline_photo) {
		this.timeline_photo = timeline_photo;
	}
	public String getTimeline_photoname() {
		return timeline_photoname;
	}
	public void setTimeline_photoname(String timeline_photoname) {
		this.timeline_photoname = timeline_photoname;
	}
	public String getTimeline_photopath() {
		return timeline_photopath;
	}
	public void setTimeline_photopath(String timeline_photopath) {
		this.timeline_photopath = timeline_photopath;
	}
	public String getMoney_no() {
		return money_no;
	}
	public void setMoney_no(String money_no) {
		this.money_no = money_no;
	}
	public String getTimeline_allDay() {
		return timeline_allDay;
	}
	public void setTimeline_allDay(String timeline_allDay) {
		this.timeline_allDay = timeline_allDay;
	}
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
	public String getMpho_path() {
		return mpho_path;
	}
	public void setMpho_path(String mpho_path) {
		this.mpho_path = mpho_path;
	}
}
