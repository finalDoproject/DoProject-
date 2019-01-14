package com.kh.dp.project.model.vo;

public class Project {
	private int pno; //프로젝트 번호
	private String ptitle; //프로젝트 이름
	private String psummary; //프로젝트 개요
	private int plevel; //프로젝트 단계
	private int plevelck; // 프로젝트레벨 체크 여부
	private int pmno; //프로젝트 최초 회원 번호 (프로젝트 팀장 번호)
	private int pmpno; //프로젝트 번호
	private int pmmno; //회원 번호
	private String pmtype; //프로젝트/회원 팀장 여부
	private int lpno; // level 프로젝트 번호
	private int lno; // 프로젝트 단계 번호
	private String lname; //프로젝트 단계별 이름
	private String lcheck; // 프젝 단계 체크여부
	private String nickname; // 이름
	private int mnocnt; // 프로젝트 별 회원수
	
	public Project() {
		super();
	}

	public Project(int pmmno) {
		super();
		this.pmmno = pmmno;
	}

	
	public Project(int pno, int pmmno) {
		super();
		this.pno = pno;
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
			int lpno,int lno, String lname) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.psummary = psummary;
		this.plevel = plevel;
		this.pmno = pmno;
		this.pmpno = pmpno;
		this.pmmno = pmmno;
		this.pmtype = pmtype;
		this.lpno = lpno;
		this.lno = lno;
		this.lname = lname;
	}
	
	
	public Project(int pno, String ptitle, String psummary, int plevel, int plevelck, int pmno, int pmpno, int pmmno,
			String pmtype, int lpno, int lno, String lname, String lcheck, String nickname, int mnocnt) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.psummary = psummary;
		this.plevel = plevel;
		this.plevelck = plevelck;
		this.pmno = pmno;
		this.pmpno = pmpno;
		this.pmmno = pmmno;
		this.pmtype = pmtype;
		this.lpno = lpno;
		this.lno = lno;
		this.lname = lname;
		this.lcheck = lcheck;
		this.nickname = nickname;
		this.mnocnt = mnocnt;
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

	

	public int getLpno() {
		return lpno;
	}

	public void setLpno(int lpno) {
		this.lpno = lpno;
	}

	public int getLno() {
		return lno;
	}

	public void setLno(int lno) {
		this.lno = lno;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	
	

	public String getLcheck() {
		return lcheck;
	}

	public void setLcheck(String lcheck) {
		this.lcheck = lcheck;
	}

	public int getPlevelck() {
		return plevelck;
	}

	public void setPlevelck(int plevelck) {
		this.plevelck = plevelck;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	public int getMnocnt() {
		return mnocnt;
	}

	public void setMnocnt(int mnocnt) {
		this.mnocnt = mnocnt;
	}

	@Override
	public String toString() {
		return "Project [pno=" + pno + ", ptitle=" + ptitle + ", psummary=" + psummary + ", plevel=" + plevel
				+ ", plevelck=" + plevelck + ", pmno=" + pmno + ", pmpno=" + pmpno + ", pmmno=" + pmmno + ", pmtype="
				+ pmtype + ", lpno=" + lpno + ", lno=" + lno + ", lname=" + lname + ", lcheck=" + lcheck + ", nickname="
				+ nickname + ", mnocnt=" + mnocnt + "]";
	}

	
	
	
	
}
