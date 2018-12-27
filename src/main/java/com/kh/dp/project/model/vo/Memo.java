package com.kh.dp.project.model.vo;

public class Memo {
	private int mmpno;
	private int mmmno;
	private String mmcontent;
	
	public Memo() {
		super();
	}

	public Memo(int mmpno, int mmmno, String mmcontent) {
		super();
		this.mmpno = mmpno;
		this.mmmno = mmmno;
		this.mmcontent = mmcontent;
	}

	public int getMmpno() {
		return mmpno;
	}

	public void setMmpno(int mmpno) {
		this.mmpno = mmpno;
	}

	public int getMmmno() {
		return mmmno;
	}

	public void setMmmno(int mmmno) {
		this.mmmno = mmmno;
	}

	public String getMmcontent() {
		return mmcontent;
	}

	public void setMmcontent(String mmcontent) {
		this.mmcontent = mmcontent;
	}

	@Override
	public String toString() {
		return "Memo [mmpno=" + mmpno + ", mmmno=" + mmmno + ", mmcontent=" + mmcontent + "]";
	}
	
	
}
