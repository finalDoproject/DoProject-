package com.kh.dp.project.model.vo;

import java.util.Date;

public class Alarm {

	private int ano;
	private String acontent;
	private String acondition;
	private Date adate;
	private int atype;
	private int amno;
	
	public Alarm() {
		super();
	}
	public Alarm(int ano, String acontent, String acondition, Date adate, int atype, int amno) {
		super();
		this.ano = ano;
		this.acontent = acontent;
		this.acondition = acondition;
		this.adate = adate;
		this.atype = atype;
		this.amno = amno;
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
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
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
	@Override
	public String toString() {
		return "Alarm [ano=" + ano + ", acontent=" + acontent + ", acondition=" + acondition + ", adate=" + adate
				+ ", atype=" + atype + ", amno=" + amno + "]";
	}

}
