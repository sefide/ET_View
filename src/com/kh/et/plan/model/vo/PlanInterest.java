package com.kh.et.plan.model.vo;

public class PlanInterest {
	private int plNo; //관심번호
	private int writer; //플랜 작성자
	private int pno; //플랜번호
	private int user; //관심을 표하는 사람
	private String plType;
	
	public PlanInterest() {}

	public PlanInterest(int plNo, int writer, int pno, int user, String plType) {
		super();
		this.plNo = plNo;
		this.writer = writer;
		this.pno = pno;
		this.user = user;
		this.plType = plType;
	}

	public int getPlNo() {
		return plNo;
	}

	public void setPlNo(int plNo) {
		this.plNo = plNo;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public String getPlType() {
		return plType;
	}

	public void setPlType(String plType) {
		this.plType = plType;
	}

	@Override
	public String toString() {
		return "PlanInterest [plNo=" + plNo + ", writer=" + writer + ", pno=" + pno + ", user=" + user + ", plType="
				+ plType + "]";
	}
	
	
	
	

}
