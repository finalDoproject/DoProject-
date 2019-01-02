package com.kh.dp.side.model.vo;

import java.io.Serializable;

public class Join implements Serializable{

	
	private int sjmno;       // 스케줄참여 회원 번호
	private int sjsm;        // 스케줄참여 요청 번호
	private int sjdtno;      // 스케줄참여 날짜/요일 번호
	
	public Join(int sjmno, int sjsm, int sjdtno) {
		super();
		this.sjmno = sjmno;
		this.sjsm = sjsm;
		this.sjdtno = sjdtno;
	}

	public Join(int sjmno, int sjsm) {
		super();
		this.sjmno = sjmno;
		this.sjsm = sjsm;
	}


	public int getSjmno() {
		return sjmno;
	}

	public void setSjmno(int sjmno) {
		this.sjmno = sjmno;
	}

	public int getSjsm() {
		return sjsm;
	}

	public void setSjsm(int sjsm) {
		this.sjsm = sjsm;
	}

	public int getSjdtno() {
		return sjdtno;
	}

	public void setSjdtno(int sjdtno) {
		this.sjdtno = sjdtno;
	}
	
	
	
	
}
