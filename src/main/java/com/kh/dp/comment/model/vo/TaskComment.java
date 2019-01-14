package com.kh.dp.comment.model.vo;

import java.sql.Date;

public class TaskComment {
	
	private int cno;
	private int cwriter;
	private String ccontent;
	private Date cwritedate;
	private int ctno;
	
	private String renamedFileName;	

	public TaskComment() {
		super();
	}

	public TaskComment(int cno, int cwriter, String ccontent, Date cwritedate, int ctno, String renamedFileName) {
		super();
		this.cno = cno;
		this.cwriter = cwriter;
		this.ccontent = ccontent;
		this.cwritedate = cwritedate;
		this.ctno = ctno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getCwriter() {
		return cwriter;
	}

	public void setCwriter(int cwriter) {
		this.cwriter = cwriter;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public Date getCwritedate() {
		return cwritedate;
	}

	public void setCwritedate(Date cwritedate) {
		this.cwritedate = cwritedate;
	}

	public int getCtno() {
		return ctno;
	}

	public void setCtno(int ctno) {
		this.ctno = ctno;
	}
	
	

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	@Override
	public String toString() {
		return "TaskComment [cno=" + cno + ", cwriter=" + cwriter + ", ccontent=" + ccontent + ", cwritedate="
				+ cwritedate + ", ctno=" + ctno + ", renamedFileName=" + renamedFileName + "]";
	}

	
	
	

}
