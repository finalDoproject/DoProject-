package com.kh.dp.side.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Matching implements Serializable {
	
	 private int smno;                     // 스케줄매칭요청 번호
	 private String smcontent;                  // 스케줄매칭요청 제목(내용)
	 private Date smdate;              // 스케줄매칭요청 요청일
	 private Date smenddate;                // 스케줄매칭요청 종료일
	 private int smmno;                    // 스케줄매칭요청 작성자
	 private int ssno;               // 스케줄매칭상태 번호
	
	 
	 public Matching(int smno, String smcontent, Date smdate, Date smenddate, int smmno, int ssno) {
		super();
		this.smno = smno;
		this.smcontent = smcontent;
		this.smdate = smdate;
		this.smenddate = smenddate;
		this.smmno = smmno;
		this.ssno = ssno;
	}


	public Matching(String smcontent, Date smdate, Date smenddate, int smmno) {
		super();
		this.smcontent = smcontent;
		this.smdate = smdate;
		this.smenddate = smenddate;
		this.smmno = smmno;
	}


	public int getSmno() {
		return smno;
	}


	public void setSmno(int smno) {
		this.smno = smno;
	}


	public String getSmcontent() {
		return smcontent;
	}


	public void setSmcontent(String smcontent) {
		this.smcontent = smcontent;
	}


	public Date getSmdate() {
		return smdate;
	}


	public void setSmdate(Date smdate) {
		this.smdate = smdate;
	}


	public Date getSmenddate() {
		return smenddate;
	}


	public void setSmenddate(Date smenddate) {
		this.smenddate = smenddate;
	}


	public int getSmmno() {
		return smmno;
	}


	public void setSmmno(int smmno) {
		this.smmno = smmno;
	}


	public int getSsno() {
		return ssno;
	}


	public void setSsno(int ssno) {
		this.ssno = ssno;
	}
	
	 
	
	 
	 
}
