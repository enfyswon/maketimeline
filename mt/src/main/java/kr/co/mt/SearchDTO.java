package kr.co.mt;

public class SearchDTO {

	private String searchOption;
	private String searchWord;
	private int limitNum;
	private String mno;
	private String cate_no;

	public String getCate_no() {
		return cate_no;
	}

	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}

	@Override
	public String toString() {
		return searchOption + " : " + searchWord;
	}

	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getLimitNum() {
		return limitNum;
	}
	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}

}//class
