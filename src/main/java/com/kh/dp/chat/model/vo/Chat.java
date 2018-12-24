package com.kh.dp.chat.model.vo;

import java.util.Date;

public class Chat {

	private int chNo;
	private String chContent;
	private Date chDate;
	private String chCondition;
	private int chRoomnum;

	public Chat() {
		super();
	}

	public Chat(int chNo, String chContent, Date chDate, String chCondition, int chRoomnum) {
		super();
		this.chNo = chNo;
		this.chContent = chContent;
		this.chDate = chDate;
		this.chCondition = chCondition;
		this.chRoomnum = chRoomnum;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public String getChContent() {
		return chContent;
	}

	public void setChContent(String chContent) {
		this.chContent = chContent;
	}

	public Date getChDate() {
		return chDate;
	}

	public void setChDate(Date chDate) {
		this.chDate = chDate;
	}

	public String getChCondition() {
		return chCondition;
	}

	public void setChCondition(String chCondition) {
		this.chCondition = chCondition;
	}

	public int getChRoomnum() {
		return chRoomnum;
	}

	public void setChRoomnum(int chRoomnum) {
		this.chRoomnum = chRoomnum;
	}

	@Override
	public String toString() {
		return "Chat [chNo=" + chNo + ", chContent=" + chContent + ", chDate=" + chDate + ", chCondition=" + chCondition
				+ ", chRoomnum=" + chRoomnum + "]";
	}

}
