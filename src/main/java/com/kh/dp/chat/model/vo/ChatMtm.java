package com.kh.dp.chat.model.vo;

import java.util.Date;

public class ChatMtm {

	private int cmmNo;
	private String cmmContent;
	private Date cmmDate;
	private String cmmCondition;
	private int cmmRoomnum;

	public ChatMtm() {
		super();
	}

	public ChatMtm(int cmmNo, String cmmContent, Date cmmDate, String cmmCondition, int cmmRoomnum) {
		super();
		this.cmmNo = cmmNo;
		this.cmmContent = cmmContent;
		this.cmmDate = cmmDate;
		this.cmmCondition = cmmCondition;
		this.cmmRoomnum = cmmRoomnum;
	}

	public int getCmmNo() {
		return cmmNo;
	}

	public void setCmmNo(int cmmNo) {
		this.cmmNo = cmmNo;
	}

	public String getCmmContent() {
		return cmmContent;
	}

	public void setCmmContent(String cmmContent) {
		this.cmmContent = cmmContent;
	}

	public Date getCmmDate() {
		return cmmDate;
	}

	public void setCmmDate(Date cmmDate) {
		this.cmmDate = cmmDate;
	}

	public String getCmmCondition() {
		return cmmCondition;
	}

	public void setCmmCondition(String cmmCondition) {
		this.cmmCondition = cmmCondition;
	}

	public int getCmmRoomnum() {
		return cmmRoomnum;
	}

	public void setCmmRoomnum(int cmmRoomnum) {
		this.cmmRoomnum = cmmRoomnum;
	}

	@Override
	public String toString() {
		return "ChatMtm [cmmNo=" + cmmNo + ", cmmContent=" + cmmContent + ", cmmDate=" + cmmDate + ", cmmCondition="
				+ cmmCondition + ", cmmRoomnum=" + cmmRoomnum + "]";
	}

}
