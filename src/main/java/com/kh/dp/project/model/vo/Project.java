package com.kh.dp.project.model.vo;

public class Project {

	private int pNo;
	private String pTitle;
	private String pSummary;
	private int pLevel;
	private int pMno;
	
	public Project() {
		super();
	}
	public Project(int pNo, String pTitle, String pSummary, int pLevel, int pMno) {
		super();
		this.pNo = pNo;
		this.pTitle = pTitle;
		this.pSummary = pSummary;
		this.pLevel = pLevel;
		this.pMno = pMno;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpSummary() {
		return pSummary;
	}
	public void setpSummary(String pSummary) {
		this.pSummary = pSummary;
	}
	public int getpLevel() {
		return pLevel;
	}
	public void setpLevel(int pLevel) {
		this.pLevel = pLevel;
	}
	public int getpMno() {
		return pMno;
	}
	public void setpMno(int pMno) {
		this.pMno = pMno;
	}
	@Override
	public String toString() {
		return "Project [pNo=" + pNo + ", pTitle=" + pTitle + ", pSummary=" + pSummary + ", pLevel=" + pLevel
				+ ", pMno=" + pMno + "]";
	}
	
}
