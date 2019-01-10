package com.kh.dp.chat.model.vo;

import java.util.Date;

public class ChatPtm {

	private int chNo;
	private String chContent;
	private Date chDate;
	private String chCondition;
	private int chWriter;
	private int chPno;
	
	private String renamedFileName;
	
	public ChatPtm() {
		super();
	}
	public ChatPtm(int chNo, String chContent, Date chDate, String chCondition, int chWriter, int chPno) {
		super();
		this.chNo = chNo;
		this.chContent = chContent;
		this.chDate = chDate;
		this.chCondition = chCondition;
		this.chWriter = chWriter;
		this.chPno = chPno;
	}
	public ChatPtm(int chNo, String chContent, Date chDate, String chCondition, int chWriter, int chPno,
			String renamedFileName) {
		super();
		this.chNo = chNo;
		this.chContent = chContent;
		this.chDate = chDate;
		this.chCondition = chCondition;
		this.chWriter = chWriter;
		this.chPno = chPno;
		this.renamedFileName = renamedFileName;
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
	public int getChWriter() {
		return chWriter;
	}
	public void setChWriter(int chWriter) {
		this.chWriter = chWriter;
	}
	public int getChPno() {
		return chPno;
	}
	public void setChPno(int chPno) {
		this.chPno = chPno;
	}
	public String getRenamedFileName() {
		return renamedFileName;
	}
	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}
	@Override
	public String toString() {
		return "ChatPtm [chNo=" + chNo + ", chContent=" + chContent + ", chDate=" + chDate + ", chCondition="
				+ chCondition + ", chWriter=" + chWriter + ", chPno=" + chPno + ", renamedFileName=" + renamedFileName
				+ "]";
	}

}
