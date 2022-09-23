package kr.co.mt.memo;

public class MemoDTO {

	private String room_no;
	private String mno_from;
	private String mni_from;
	private String mno_to;
	private String mni_to;
	private String chat_no;
	private String mno_ins;
	private String mni_ins;
	private String mno_read;
	private String mni_read;
	private String chat;
	private String chat_date;
	private String read_yn;
	private String mno;
	private String other_mno;
	private String other_mni;
	private String mpho_path;
	private int unread;

	@Override
	public String toString() {
		return "room_no : " + room_no
				+ ", mno_from : " + mno_from
				+ ", mni_from : " + mni_from
				+ ", mno_to : " + mno_to
				+ ", mni_to : " + mni_to
				+ ", chat_no : " + chat_no
				+ ", mno_ins : " + mno_ins
				+ ", mni_ins : " + mni_ins
				+ ", mno_read : " + mno_read
				+ ", mni_read : " + mni_read
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

	public String getMni_from() {
		return mni_from;
	}

	public void setMni_from(String mni_from) {
		this.mni_from = mni_from;
	}

	public String getMno_to() {
		return mno_to;
	}

	public void setMno_to(String mno_to) {
		this.mno_to = mno_to;
	}

	public String getMni_to() {
		return mni_to;
	}

	public void setMni_to(String mni_to) {
		this.mni_to = mni_to;
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

	public String getMni_ins() {
		return mni_ins;
	}

	public void setMni_ins(String mni_ins) {
		this.mni_ins = mni_ins;
	}

	public String getMno_read() {
		return mno_read;
	}

	public void setMno_read(String mno_read) {
		this.mno_read = mno_read;
	}

	public String getMni_read() {
		return mni_read;
	}

	public void setMni_read(String mni_read) {
		this.mni_read = mni_read;
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

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getOther_mno() {
		return other_mno;
	}

	public void setOther_mno(String other_mno) {
		this.other_mno = other_mno;
	}

	public String getOther_mni() {
		return other_mni;
	}

	public void setOther_mni(String other_mni) {
		this.other_mni = other_mni;
	}

	public String getMpho_path() {
		return mpho_path;
	}

	public void setMpho_path(String mpho_path) {
		this.mpho_path = mpho_path;
	}

	public int getUnread() {
		return unread;
	}

	public void setUnread(int unread) {
		this.unread = unread;
	}
}//class
