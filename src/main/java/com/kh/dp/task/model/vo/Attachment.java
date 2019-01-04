package com.kh.dp.task.model.vo;

import java.sql.Date;

public class Attachment {
	private int fno; // 파일 번호
	private String foldname;
	private String fnewname;
	private String fpath;
	private int ftno; // 파일 업무 번호
	
	public Attachment() {
		
	}

	public Attachment(int fno, String foldname, String fnewname, String fpath, int ftno) {
		super();
		this.fno = fno;
		this.foldname = foldname;
		this.fnewname = fnewname;
		this.fpath = fpath;
		this.ftno = ftno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFoldname() {
		return foldname;
	}

	public void setFoldname(String foldname) {
		this.foldname = foldname;
	}

	public String getFnewname() {
		return fnewname;
	}

	public void setFnewname(String fnewname) {
		this.fnewname = fnewname;
	}

	public String getFpath() {
		return fpath;
	}

	public void setFpath(String fpath) {
		this.fpath = fpath;
	}

	public int getFtno() {
		return ftno;
	}

	public void setFtno(int ftno) {
		this.ftno = ftno;
	}

	@Override
	public String toString() {
		return "Attachment [fno=" + fno + ", foldname=" + foldname + ", fnewname=" + fnewname + ", fpath=" + fpath
				+ ", ftno=" + ftno + "]";
	}
	
}
