package kr.co.mt.chat;

public class ChatDTO {
	private String chat_no;
	private String chat_roomno;
	private String recv_mno;
	private String send_no;
	private int chat_yn;
	private String chat_date;
	private String chat_contents;
	
	private String other_no;
	private String other_name;
	private String mem_no;
	private int unread;
	
	public String toString() {
		return getChat_no() + " : " + getChat_roomno() + " : " + 
			   getRecv_mem_no() + " : " + getSend_mem_no() + " : " + 
			   getChat_yn() + " : " + getChat_date() + " : " + 
			   getOther_no() + " : " + getOther_name() + " : " + getMem_no();
	}
	
	public String getChat_no() {
		return chat_no;
	}
	public void setChat_no(String chat_no) {
		this.chat_no = chat_no;
	}
	public String getChat_roomno() {
		return chat_roomno;
	}
	public void setChat_roomno(String chat_roomno) {
		this.chat_roomno = chat_roomno;
	}
	public String getRecv_mem_no() {
		return recv_mno;
	}
	public void setRecv_mem_no(String recv_mno) {
		this.recv_mno = recv_mno;
	}
	public String getSend_mem_no() {
		return send_no;
	}
	public void setSend_mem_no(String send_no) {
		this.send_no = send_no;
	}
	public int getChat_yn() {
		return chat_yn;
	}
	public void setChat_yn(int chat_yn) {
		this.chat_yn = chat_yn;
	}
	public String getChat_date() {
		return chat_date;
	}
	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}
	public String getChat_contents() {
		return chat_contents;
	}
	public void setChat_contents(String chat_contents) {
		this.chat_contents = chat_contents;
	}
	public String getOther_no() {
		return other_no;
	}
	public void setOther_no(String other_no) {
		this.other_no = other_no;
	}
	public String getOther_name() {
		return other_name;
	}
	public void setOther_name(String other_name) {
		this.other_name = other_name;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}

}
