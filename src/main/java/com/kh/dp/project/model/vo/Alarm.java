package com.kh.dp.project.model.vo;

public class Alarm {

	private int ano;
	private String acontent; 
	private String acondition;	 
	private int atype;
	private int amno;	 
	private int apno;	 
	private int atno;
	private int asmno;
	
	private String ptitle;
	private String ttitle;
	private String smcontent;
	
	public Alarm() {
		super();
	}
	public Alarm(int ano, String acontent, String acondition, int atype, int amno, int apno, int atno, int asmno,
			String ptitle, String ttitle, String smcontent) {
		super();
		this.ano = ano;
		this.acontent = acontent;
		this.acondition = acondition;
		this.atype = atype;
		this.amno = amno;
		this.apno = apno;
		this.atno = atno;
		this.asmno = asmno;
		this.ptitle = ptitle;
		this.ttitle = ttitle;
		this.smcontent = smcontent;
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
	public int getAsmno() {
		return asmno;
	}
	public void setAsmno(int asmno) {
		this.asmno = asmno;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public String getSmcontent() {
		return smcontent;
	}
	public void setSmcontent(String smcontent) {
		this.smcontent = smcontent;
	}
	@Override
	public String toString() {
		return "Alarm [ano=" + ano + ", acontent=" + acontent + ", acondition=" + acondition + ", atype=" + atype
				+ ", amno=" + amno + ", apno=" + apno + ", atno=" + atno + ", asmno=" + asmno + ", ptitle=" + ptitle
				+ ", ttitle=" + ttitle + ", smcontent=" + smcontent + "]";
	}
	
}