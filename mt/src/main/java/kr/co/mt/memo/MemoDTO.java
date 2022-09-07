package kr.co.mt.memo;

public class MemoDTO {

	private String room_no;
	private String mno_from;
	private String mid_from;
	private String mno_to;
	private String mid_to;
	private String chat_no;
	private String mno_ins;
	private String mid_ins;
	private String mno_read;
	private String mid_read;
	private String chat;
	private String chat_date;
	private String read_yn;

	@Override
	public String toString() {
		return "room_no : " + room_no
				+ ", mno_from : " + mno_from
				+ ", mid_from : " + mid_from
				+ ", mno_to : " + mno_to
				+ ", mid_to : " + mid_to
				+ ", chat_no : " + chat_no
				+ ", mno_ins : " + mno_ins
				+ ", mid_ins : " + mid_ins
				+ ", mno_read : " + mno_read
				+ ", mid_read : " + mid_read
				+ ", chat : " + chat
				+ ", chat_date : " + chat_date
				+ ", read_yn : " + read_yn;
	}
	public String getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public String getMno_from() {
		return mno_from;
	}
	public void setMno_from(String mno_from) {
		this.mno_from = mno_from;
	}
	public String getMid_from() {
		return mid_from;
	}
	public void setMid_from(String mid_from) {
		this.mid_from = mid_from;
	}
	public String getMno_to() {
		return mno_to;
	}
	public void setMno_to(String mno_to) {
		this.mno_to = mno_to;
	}
	public String getMid_to() {
		return mid_to;
	}
	public void setMid_to(String mid_to) {
		this.mid_to = mid_to;
	}
	public String getChat_no() {
		return chat_no;
	}
	public void setChat_no(String chat_no) {
		this.chat_no = chat_no;
	}
	public String getMno_ins() {
		return mno_ins;
	}
	public void setMno_ins(String mno_ins) {
		this.mno_ins = mno_ins;
	}
	public String getMid_ins() {
		return mid_ins;
	}
	public void setMid_ins(String mid_ins) {
		this.mid_ins = mid_ins;
	}
	public String getMno_read() {
		return mno_read;
	}
	public void setMno_read(String mno_read) {
		this.mno_read = mno_read;
	}
	public String getMid_read() {
		return mid_read;
	}
	public void setMid_read(String mid_read) {
		this.mid_read = mid_read;
	}
	public String getChat() {
		return chat;
	}
	public void setChat(String chat) {
		this.chat = chat;
	}
	public String getChat_date() {
		return chat_date;
	}
	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}
	public String getRead_yn() {
		return read_yn;
	}
	public void setRead_yn(String read_yn) {
		this.read_yn = read_yn;
	}

}//class
