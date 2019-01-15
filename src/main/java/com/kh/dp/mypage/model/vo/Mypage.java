package com.kh.dp.mypage.model.vo;

import java.sql.Date;

public class Mypage {

	private int mcno; // 개인 일정 번호
	private Date mcStart; // 개인 일정 시작일
	private Date mcEnd; // 개인 일정 종료일
	private String mcContent; // 개인 일정 내용
	private String mcCondition; // 개인 일정 상태 
	private int mcMno; // 개인 일정 회원 번호 
	
	public Mypage() {
		super();
	}

	public Mypage(int mcno, Date mcStart, Date mcEnd, String mcContent, String mcCondition, int mcMno) {
		super();
		this.mcno = mcno;
		this.mcStart = mcStart;
		this.mcEnd = mcEnd;
		this.mcContent = mcContent;
		this.mcCondition = mcCondition;
		this.mcMno = mcMno;
	}

	public int getMcno() {
		return mcno;
	}

	public void setMcno(int mcno) {
		this.mcno = mcno;
	}

	public Date getMcStart() {
		return mcStart;
	}

	public void setMcStart(Date mcStart) {
		this.mcStart = mcStart;
	}

	public Date getMcEnd() {
		return mcEnd;
	}

	public void setMcEnd(Date mcEnd) {
		this.mcEnd = mcEnd;
	}

	public String getMcContent() {
		return mcContent;
	}

	public void setMcContent(String mcContent) {
		this.mcContent = mcContent;
	}

	public String getMcCondition() {
		return mcCondition;
	}

	public void setMcCondition(String mcCondition) {
		this.mcCondition = mcCondition;
	}

	public int getMcMno() {
		return mcMno;
	}

	public void setMcMno(int mcMno) {
		this.mcMno = mcMno;
	}

	@Override
	public String toString() {
		return "Mypage [mcno=" + mcno + ", mcStart=" + mcStart + ", mcEnd=" + mcEnd + ", mcContent=" + mcContent
				+ ", mcCondition=" + mcCondition + ", mcMno=" + mcMno + "]";
	}
	
	
	
	
}
