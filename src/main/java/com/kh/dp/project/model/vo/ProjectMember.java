package com.kh.dp.project.model.vo;

public class ProjectMember {

	private int pmpno;
	private int pmmno;
	private String pmtype;
	@Override
	public String toString() {
		return "ProjectMember [pmpno=" + pmpno + ", pmmno=" + pmmno + ", pmtype=" + pmtype + "]";
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
	public ProjectMember(int pmpno, int pmmno, String pmtype) {
		super();
		this.pmpno = pmpno;
		this.pmmno = pmmno;
		this.pmtype = pmtype;
	}
	public ProjectMember() {
		super();
	}
	
}
