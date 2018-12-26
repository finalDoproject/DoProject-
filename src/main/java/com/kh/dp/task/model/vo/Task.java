package com.kh.dp.task.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Task {
	private int tNo; //업무 번호
	private String tWriter; // 작성자
	private String tTitle; // 업무명
	private String tLevel; // 업무상태
	private String tManager; // 담당자
	private Date tStartDate; // 시작일
	private Date tEndDate; // 종료일
	private String tPriority; // 우선순위
	private String tContent; // 업무 내용
	//첨부파일
	private List<Attachment> tFiles = new ArrayList<Attachment>();
	
	public Task() {}

	public Task(int tNo, String tWriter, String tTitle, String tLevel, String tManager, Date tStartDate,
			Date tEndDate, String tPriority, String tContent) {
		super();
		this.tNo = tNo;
		this.tWriter = tWriter;
		this.tTitle = tTitle;
		this.tLevel = tLevel;
		this.tManager = tManager;
		this.tStartDate = tStartDate;
		this.tEndDate = tEndDate;
		this.tPriority = tPriority;
		this.tContent = tContent;
	}


	// 첨부파일 있는 생성자
	public Task(int tNo, String tWriter, String tTitle, String tLevel, String tManager, Date tStartDate,
			Date tEndDate, String tPriority, List<Attachment> tFiles) {
		super();
		this.tNo = tNo;
		this.tWriter = tWriter;
		this.tTitle = tTitle;
		this.tLevel = tLevel;
		this.tManager = tManager;
		this.tStartDate = tStartDate;
		this.tEndDate = tEndDate;
		this.tPriority = tPriority;
		this.tFiles = tFiles;
	}


	public int gettNo() {
		return tNo;
	}


	public void settNo(int tNo) {
		this.tNo = tNo;
	}


	public String gettWriter() {
		return tWriter;
	}


	public void settWriter(String tWriter) {
		this.tWriter = tWriter;
	}


	public String gettTitle() {
		return tTitle;
	}


	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}


	public String gettLevel() {
		return tLevel;
	}


	public void settLevel(String tLevel) {
		this.tLevel = tLevel;
	}


	public String gettManager() {
		return tManager;
	}
	
	public String gettContent() {
		return tContent;
	}


	public void settManager(String tManager) {
		this.tManager = tManager;
	}


	public Date gettStartDate() {
		return tStartDate;
	}


	public void settStartDate(Date tStartDate) {
		this.tStartDate = tStartDate;
	}


	public Date gettEndDate() {
		return tEndDate;
	}


	public void settEndDate(Date tEndDate) {
		this.tEndDate = tEndDate;
	}


	public String gettPriority() {
		return tPriority;
	}


	public void settPriority(String tPriority) {
		this.tPriority = tPriority;
	}


	public List<Attachment> gettFiles() {
		return tFiles;
	}


	public void settFiles(List<Attachment> tFiles) {
		this.tFiles = tFiles;
	}
	
	public String settContent() {
		return tContent;
	}


	@Override
	public String toString() {
		return "Task [tNo=" + tNo + ", tWriter=" + tWriter + ", tTitle=" + tTitle + ", tLevel=" + tLevel
				+ ", tManager=" + tManager + ", tStartDate=" + tStartDate + ", tEndDate=" + tEndDate + ", tPriority="
				+ tPriority + ", tFiles=" + tFiles + "]";
	}
	
	
}
