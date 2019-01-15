package com.kh.dp.member.model.vo;

public class Attachment {
	private int imgNo;
	private String originalFileName;
	private String renamedFileName;
	private String imgPath;
	private String status;
	private int imgMno;
	
	public Attachment() {}

	public Attachment(int imgNo, String originalFileName, String renamedFileName, String imgPath, String status,
			int imgMno) {
		super();
		this.imgNo = imgNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.imgPath = imgPath;
		this.status = status;
		this.imgMno = imgMno;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getImgMno() {
		return imgMno;
	}

	public void setImgMno(int imgMno) {
		this.imgMno = imgMno;
	}

	@Override
	public String toString() {
		return "Attachment [imgNo=" + imgNo + ", originalFileName=" + originalFileName + ", renamedFileName="
				+ renamedFileName + ", imgPath=" + imgPath + ", status=" + status + ", imgMno=" + imgMno + "]";
	}

	

}
