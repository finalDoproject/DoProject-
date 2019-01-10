package com.kh.dp.chat.model.vo;

import java.util.Date;

public class ChatMtm {

	private int chNo;
	private String chContent;
	private Date chDate;
	private String chCondition;
	private int chWriter;
	private int chReader;
	private int chPno;
	
	private String renamedfilename;
	
	public ChatMtm() {
		super();
	}
	public ChatMtm(int chNo, String chContent, Date chDate, String chCondition, int chWriter, int chReader, int chPno) {
		super();
		this.chNo = chNo;
		this.chContent = chContent;
		this.chDate = chDate;
		this.chCondition = chCondition;
		this.chWriter = chWriter;
		this.chReader = chReader;
		this.chPno = chPno;
	}
	public ChatMtm(int chNo, String chContent, Date chDate, String chCondition, int chWriter, int chReader, int chPno,
			String renamedfilename) {
		super();
		this.chNo = chNo;
		this.chContent = chContent;
		this.chDate = chDate;
		this.chCondition = chCondition;
		this.chWriter = chWriter;
		this.chReader = chReader;
		this.chPno = chPno;
		this.renamedfilename = renamedfilename;
	}
	public String getRenamedfilename() {
		return renamedfilename;
	}
	public void setRenamedfilename(String renamedfilename) {
		this.renamedfilename = renamedfilename;
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
	public int getChReader() {
		return chReader;
	}
	public void setChReader(int chReader) {
		this.chReader = chReader;
	}
	public int getChPno() {
		return chPno;
	}
	public void setChPno(int chPno) {
		this.chPno = chPno;
	}
	@Override
	public String toString() {
		return "ChatMtm [chNo=" + chNo + ", chContent=" + chContent + ", chDate=" + chDate + ", chCondition="
				+ chCondition + ", chWriter=" + chWriter + ", chReader=" + chReader + ", chPno=" + chPno
				+ ", renamedfilename=" + renamedfilename + "]";
	}
		
}
