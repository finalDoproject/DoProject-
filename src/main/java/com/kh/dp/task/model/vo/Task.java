package com.kh.dp.task.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Task {
	
	private int tno; // 업무 번호
	private int tlevel; // 업무 상태
	private int tmno; // 업무 담당자
	private String tenddate; 
	private int ttpriority; // 우선 순위
	private int tbno; // 업무 게시글 번호
	private String ttitle; //업무명
	private String tcontent; // 업무내용
	private String tstartdate; // 업무 시작일
	private String twriter;
	//첨부파일
	private List<Attachment> taskFiles = new ArrayList<Attachment>();
	
	public Task() {}
	
	public Task(int tno, int tlevel, int tmno, String tenddate, int ttpriority, int tbno, String ttitle, String tcontent,
			String tstartdate, String twriter) {
		super();
		this.tno = tno;
		this.tlevel = tlevel;
		this.tmno = tmno;
		this.tenddate = tenddate;
		this.ttpriority = ttpriority;
		this.tbno = tbno;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tstartdate = tstartdate;
		this.twriter = twriter;
	}

	// 첨부파일 있는 생성자
	public Task(int tno, int tlevel, int tmno, String tenddate, int ttpriority, int tbno, String ttitle, String tcontent,
			String tstartdate, String twriter, List<Attachment> taskFiles) {
		super();
		this.tno = tno;
		this.tlevel = tlevel;
		this.tmno = tmno;
		this.tenddate = tenddate;
		this.ttpriority = ttpriority;
		this.tbno = tbno;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tstartdate = tstartdate;
		this.twriter = twriter;
		this.taskFiles = taskFiles;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public int getTlevel() {
		return tlevel;
	}

	public void setTlevel(int tlevel) {
		this.tlevel = tlevel;
	}

	public int getTmno() {
		return tmno;
	}

	public void setTmno(int tmno) {
		this.tmno = tmno;
	}

	public String getTenddate() {
		return tenddate;
	}

	public void setTenddate(String tenddate) {
		this.tenddate = tenddate;
	}

	public int getTtpriority() {
		return ttpriority;
	}

	public void setTtpriority(int ttpriority) {
		this.ttpriority = ttpriority;
	}

	public int getTbno() {
		return tbno;
	}

	public void setTbno(int tbno) {
		this.tbno = tbno;
	}

	public String getTtitle() {
		return ttitle;
	}

	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getTstartdate() {
		return tstartdate;
	}

	public void setTstartdate(String tstartdate) {
		this.tstartdate = tstartdate;
	}

	public String getTwriter() {
		return twriter;
	}

	public void setTwriter(String twriter) {
		this.twriter = twriter;
	}

	public List<Attachment> getTaskFiles() {
		return taskFiles;
	}

	public void setTaskFiles(List<Attachment> taskFiles) {
		this.taskFiles = taskFiles;
	}

	@Override
	public String toString() {
		return "Task [tno=" + tno + ", tlevel=" + tlevel + ", tmno=" + tmno + ", tenddate=" + tenddate + ", ttpriority="
				+ ttpriority + ", tbno=" + tbno + ", ttitle=" + ttitle + ", tcontent=" + tcontent + ", tstartdate="
				+ tstartdate + ", twriter=" + twriter + ", taskFiles=" + taskFiles + "]";
	}
	
}
