package com.kh.dp.side.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MatchingInfo implements Serializable {
	
	private int SMNO;                             // 스케줄매칭요청 번호
	private String SMCONTENT;                     // 스케줄매칭요청 제목(내용)
	private Date SMDATE;                          // 스케줄매칭요청 요청일
	private Date SMENDDATE;                       // 스케줄매칭요청 종료일
	private int SSNO;                             // 스케줄매칭상태 번호
	
	
	public MatchingInfo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MatchingInfo(int sMNO, String sMCONTENT, Date sMDATE, Date sMENDDATE, int sSNO) {
		super();
		SMNO = sMNO;
		SMCONTENT = sMCONTENT;
		SMDATE = sMDATE;
		SMENDDATE = sMENDDATE;
		SSNO = sSNO;
	}


	public MatchingInfo(String sMCONTENT, Date sMDATE, Date sMENDDATE, int sSNO) {
		super();
		SMCONTENT = sMCONTENT;
		SMDATE = sMDATE;
		SMENDDATE = sMENDDATE;
		SSNO = sSNO;
	}


	public MatchingInfo(String sMCONTENT, Date sMDATE, Date sMENDDATE) {
		super();
		SMCONTENT = sMCONTENT;
		SMDATE = sMDATE;
		SMENDDATE = sMENDDATE;
	}


	public int getSMNO() {
		return SMNO;
	}


	public void setSMNO(int sMNO) {
		SMNO = sMNO;
	}


	public String getSMCONTENT() {
		return SMCONTENT;
	}


	public void setSMCONTENT(String sMCONTENT) {
		SMCONTENT = sMCONTENT;
	}


	public Date getSMDATE() {
		return SMDATE;
	}


	public void setSMDATE(Date sMDATE) {
		SMDATE = sMDATE;
	}


	public Date getSMENDDATE() {
		return SMENDDATE;
	}


	public void setSMENDDATE(Date sMENDDATE) {
		SMENDDATE = sMENDDATE;
	}


	public int getSSNO() {
		return SSNO;
	}


	public void setSSNO(int sSNO) {
		SSNO = sSNO;
	}
	
	
	
	
	
	
	
	}