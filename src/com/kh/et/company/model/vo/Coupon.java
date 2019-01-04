package com.kh.et.company.model.vo;

import java.sql.Date;

public class Coupon {
	
	private int cpno;
	private int cpCno;
	private Date cpDate;
	private String cpType;
	private String cpReason;
	private int cpPayNo;
	private int cptno;

	public Coupon() {}

	public Coupon(int cpno, int cpCno, Date cpDate, String cpType, String cpReason, int cpPayNo, int cptno) {
		super();
		this.cpno = cpno;
		this.cpCno = cpCno;
		this.cpDate = cpDate;
		this.cpType = cpType;
		this.cpReason = cpReason;
		this.cpPayNo = cpPayNo;
		this.cptno = cptno;
	}

	public int getCpno() {
		return cpno;
	}

	public void setCpno(int cpno) {
		this.cpno = cpno;
	}

	public int getCpCno() {
		return cpCno;
	}

	public void setCpCno(int cpCno) {
		this.cpCno = cpCno;
	}

	public Date getCpDate() {
		return cpDate;
	}

	public void setCpDate(Date cpDate) {
		this.cpDate = cpDate;
	}

	public String getCpType() {
		return cpType;
	}

	public void setCpType(String cpType) {
		this.cpType = cpType;
	}

	public String getCpReason() {
		return cpReason;
	}

	public void setCpReason(String cpReason) {
		this.cpReason = cpReason;
	}

	public int getCpPayNo() {
		return cpPayNo;
	}

	public void setCpPayNo(int cpPayNo) {
		this.cpPayNo = cpPayNo;
	}

	public int getCptno() {
		return cptno;
	}

	public void setCptno(int cptno) {
		this.cptno = cptno;
	}

	@Override
	public String toString() {
		return "Coupon [cpno=" + cpno + ", cpCno=" + cpCno + ", cpDate=" + cpDate + ", cpType=" + cpType + ", cpReason="
				+ cpReason + ", cpPayNo=" + cpPayNo + ", cptno=" + cptno + "]";
	}
	
	
	
}
