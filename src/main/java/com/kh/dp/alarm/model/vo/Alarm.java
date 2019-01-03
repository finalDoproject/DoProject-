package com.kh.dp.alarm.model.vo;

public class Alarm {

	private int ano;
	private String acontent; 
	private String acondition;	 
	private int atype;
	private int amno;	 
	private int apno;	 
	private int atno;
	
	public Alarm() {
		super();
	}
	public Alarm(int ano, String acontent, String acondition, int atype, int amno, int apno, int atno) {
		super();
		this.ano = ano;
		this.acontent = acontent;
		this.acondition = acondition;
		this.atype = atype;
		this.amno = amno;
		this.apno = apno;
		this.atno = atno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getAcondition() {
		return acondition;
	}
	public void setAcondition(String acondition) {
		this.acondition = acondition;
	}
	public int getAtype() {
		return atype;
	}
	public void setAtype(int atype) {
		this.atype = atype;
	}
	public int getAmno() {
		return amno;
	}
	public void setAmno(int amno) {
		this.amno = amno;
	}
	public int getApno() {
		return apno;
	}
	public void setApno(int apno) {
		this.apno = apno;
	}
	public int getAtno() {
		return atno;
	}
	public void setAtno(int atno) {
		this.atno = atno;
	}
	@Override
	public String toString() {
		return "Alarm [ano=" + ano + ", acontent=" + acontent + ", acondition=" + acondition + ", atype=" + atype
				+ ", amno=" + amno + ", apno=" + apno + ", atno=" + atno + "]";
	}
	
}
