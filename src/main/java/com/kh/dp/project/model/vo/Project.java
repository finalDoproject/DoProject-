package com.kh.dp.project.model.vo;

public class Project {
	private int pno; //프로젝트 번호
	private String ptitle; //프로젝트 이름
	private String psummary; //프로젝트 개요
	private int plevel; //프로젝트 단계
	private int pmno; //프로젝트 최초 회원 번호 (프로젝트 팀장 번호)
	private int pmpno; //프로젝트 번호
	private int pmmno; //회원 번호
	private String pmtype; //프로젝트/회원 팀장 여부
	private int plno; //프로젝트 단계 번호
	private String plname; //프로젝트 단계 이름
	
	public Project() {
		super();
	}

	public Project(int pmmno) {
		super();
		this.pmmno = pmmno;
	}

	public Project(int pno, String ptitle, String psummary, int plevel, int pmno) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.psummary = psummary;
		this.plevel = plevel;
		this.pmno = pmno;
	}

	public Project(int pno, String ptitle, String psummary, int plevel, int pmno, int pmpno, int pmmno, String pmtype) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.psummary = psummary;
		this.plevel = plevel;
		this.pmno = pmno;
		this.pmpno = pmpno;
		this.pmmno = pmmno;
		this.pmtype = pmtype;
	}

	public Project(int pno, String ptitle, String psummary, int plevel, int pmno, int pmpno, int pmmno, String pmtype,
			int plno, String plname) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.psummary = psummary;
		this.plevel = plevel;
		this.pmno = pmno;
		this.pmpno = pmpno;
		this.pmmno = pmmno;
		this.pmtype = pmtype;
		this.plno = plno;
		this.plname = plname;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPsummary() {
		return psummary;
	}

	public void setPsummary(String psummary) {
		this.psummary = psummary;
	}

	public int getPlevel() {
		return plevel;
	}

	public void setPlevel(int plevel) {
		this.plevel = plevel;
	}

	public int getPmno() {
		return pmno;
	}

	public void setPmno(int pmno) {
		this.pmno = pmno;
	}

	public int getPmpno() {
		return pmpno;
	}

	public void setPmpno(int pmpno) {
		this.pmpno = pmpno;
	}

	public int getPmmno() {
		return pmmno;
	}

	public void setPmmno(int pmmno) {
		this.pmmno = pmmno;
	}

	public String getPmtype() {
		return pmtype;
	}

	public void setPmtype(String pmtype) {
		this.pmtype = pmtype;
	}

	public int getPlno() {
		return plno;
	}

	public void setPlno(int plno) {
		this.plno = plno;
	}

	public String getPlname() {
		return plname;
	}

	public void setPlname(String plname) {
		this.plname = plname;
	}

	@Override
	public String toString() {
		return "Project [pno=" + pno + ", ptitle=" + ptitle + ", psummary=" + psummary + ", plevel=" + plevel
				+ ", pmno=" + pmno + ", pmpno=" + pmpno + ", pmmno=" + pmmno + ", pmtype=" + pmtype + ", plno=" + plno
				+ ", plname=" + plname + "]";
	}
	
	
	
}
