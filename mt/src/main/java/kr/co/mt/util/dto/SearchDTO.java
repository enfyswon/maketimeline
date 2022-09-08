package kr.co.mt.util.dto;

public class SearchDTO {

	private String searchOption;
	private String searchWord;
	private int limitNum;
	private String mno;

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
