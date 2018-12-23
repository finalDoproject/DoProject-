package com.kh.dp.intro.board.model.vo;

import java.sql.Date;

public class Board {

	private int bno;
	private String btitle;
	private String bcontent;
	private String bcondition;
	private Date bdate;
	private int bmno;
	private int btype;
	private int bpno;
	
	
	public Board() {
		super();
	} 


	public Board(int bno, String btitle, String bcontent, String bcondition, Date bdate, int bmno, int btype,
			int bpno) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bcondition = bcondition;
		this.bdate = bdate;
		this.bmno = bmno;
		this.btype = btype;
		this.bpno = bpno;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public String getBcondition() {
		return bcondition;
	}


	public void setBcondition(String bcondition) {
		this.bcondition = bcondition;
	}


	public Date getBdate() {
		return bdate;
	}


	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}


	public int getBmno() {
		return bmno;
	}


	public void setBmno(int bmno) {
		this.bmno = bmno;
	}


	public int getBtype() {
		return btype;
	}


	public void setBtype(int btype) {
		this.btype = btype;
	}


	public int getBpno() {
		return bpno;
	}


	public void setBpno(int bpno) {
		this.bpno = bpno;
	}


	@Override
	public String toString() {
		return "Board [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bcondition=" + bcondition
				+ ", bdate=" + bdate + ", bmno=" + bmno + ", btype=" + btype + ", bpno=" + bpno + "]";
	}
	
	

}
