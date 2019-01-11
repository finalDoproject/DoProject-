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
	private String ttitle; //업무명
	private String tcontent; // 업무내용
	private String tstartdate; // 업무 시작일
	private String twriter;
	private int tpno;
	private String twritedate; 
	// 가상 컬럼에 대한 필드 추가
	private int fno;
	private String foldName;
	private String fnewName;

	
	//첨부파일
	private List<Attachment> taskFiles = new ArrayList<Attachment>();
	
	private int count;
	
	public Task() {}
	
	// 가상 변수 필드 생성자 추가
	
		public Task(int tno, String ttitle, String tcontent, String twriter, String twritedate, int fno, String foldName, String fnewName) {
			super();
			this.tno = tno;
			this.ttitle = ttitle;
			this.tcontent = tcontent;
			this.twriter = twriter;
			this.twritedate = twritedate;
			this.fno = fno;
			this.foldName = foldName;
			this.fnewName = fnewName;
		}
		
	public Task(int tno, int tlevel, int tmno, String tenddate, int ttpriority, int tbno, String ttitle, String tcontent,
			String tstartdate, String twriter, int tpno, int count, String twritedate) {
		super();
		this.tno = tno;
		this.tlevel = tlevel;
		this.tmno = tmno;
		this.tenddate = tenddate;
		this.ttpriority = ttpriority;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tstartdate = tstartdate;
		this.twriter = twriter;
		this.tpno = tpno;
		this.count = count;
	}

	// 첨부파일 있는 생성자
	public Task(int tno, int tlevel, int tmno, String tenddate, int ttpriority, int tbno, String ttitle, String tcontent,
			String tstartdate, String twriter, int tpno, List<Attachment> taskFiles, int count, String twritedate) {
		super();
		this.tno = tno;
		this.tlevel = tlevel;
		this.tmno = tmno;
		this.tenddate = tenddate;
		this.ttpriority = ttpriority;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tstartdate = tstartdate;
		this.twriter = twriter;
		this.tpno = tpno;
		this.taskFiles = taskFiles;
		this.count = count;
	}
	
	
	public String getFnewName() {
		return fnewName;
	}

	public void setFnewName(String fnewName) {
		this.fnewName = fnewName;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFoldName() {
		return foldName;
	}

	public void setFoldName(String foldName) {
		this.foldName = foldName;
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

	public int getTpno() {
		return tpno;
	}

	public void setTpno(int tpno) {
		this.tpno = tpno;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public String getTwritedate() {
		return twritedate;
	}

	public void setTwritedate(String twritedate) {
		this.twritedate = twritedate;
	}

	@Override
	public String toString() {
		return "Task [tno=" + tno + ", tlevel=" + tlevel + ", tmno=" + tmno + ", tenddate=" + tenddate + ", ttpriority="
				+ ttpriority +  ", ttitle=" + ttitle + ", tcontent=" + tcontent + ", tstartdate="
				+ tstartdate + ", twriter=" + twriter + ", tpno=" + tpno + ", twritedate=" + twritedate + ", fno=" + fno
				+ ", foldName=" + foldName + ", fnewName=" + fnewName + ", taskFiles=" + taskFiles + ", count=" + count
				+ "]";

	}

	


	
}
