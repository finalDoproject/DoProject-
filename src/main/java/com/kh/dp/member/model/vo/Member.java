package com.kh.dp.member.model.vo;

import java.sql.Date;

public class Member {
	private  int pno;                   // 프로젝트 번호
	private  int mno;                   // 회원 번호
	private  String userId;             // 회원 아이디
	private  String password;           // 회원 비밀번호
	private  String email;              // 회원 이메일
	private  String nickName;           // 회원 닉네임(이름)
	private  String mCondition;         // 회원 상태
	private  Date mDate;                // 회원 가입일
	private  int mProfile;           // 회원 프로필
	
	private String renamedFileName;		// 회원 프로필을 참조로 가져온 파일 이름
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int mno, String userId, String password, String email, String nickName, String mCondition, Date mDate,
			int mProfile, String renamedFileName) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.password = password;
		this.email = email;
		this.nickName = nickName;
		this.mCondition = mCondition;
		this.mDate = mDate;
		this.mProfile = mProfile;
		this.renamedFileName = renamedFileName;
	}

	public Member(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}

	public Member(int mno, String userId, String nickName) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.nickName = nickName;
	}
	
	
	public Member(int pno, int mno, int mProfile, String renamedFileName) {
		super();
		this.pno = pno;
		this.mno = mno;
		this.mProfile = mProfile;
		this.renamedFileName = renamedFileName;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getmCondition() {
		return mCondition;
	}

	public void setmCondition(String mCondition) {
		this.mCondition = mCondition;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public int getmProfile() {
		return mProfile;
	}

	public void setmProfile(int mProfile) {
		this.mProfile = mProfile;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	
	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	@Override
	public String toString() {
		return "Member [pno=" + pno + ", mno=" + mno + ", userId=" + userId + ", password=" + password + ", email="
				+ email + ", nickName=" + nickName + ", mCondition=" + mCondition + ", mDate=" + mDate + ", mProfile="
				+ mProfile + ", renamedFileName=" + renamedFileName + "]";
	}


	
	
	

}
