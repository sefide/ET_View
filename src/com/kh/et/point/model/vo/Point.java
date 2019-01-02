package com.kh.et.point.model.vo;

import java.sql.Date;

public class Point implements java.io.Serializable{
	private int pno;
	private int pnNo;
	private int pValue;
	private Date pDate;
	private String pReason;
	private int pFkbno;
	private int pFkpno;
	private int pbino;
	private int ppino;
	
	public Point() {}

	public Point(int pno, int pnNo, int pValue, Date pDate, String pReason, int pFkbno, int pFkpno, int pbino,
			int ppino) {
		super();
		this.pno = pno;
		this.pnNo = pnNo;
		this.pValue = pValue;
		this.pDate = pDate;
		this.pReason = pReason;
		this.pFkbno = pFkbno;
		this.pFkpno = pFkpno;
		this.pbino = pbino;
		this.ppino = ppino;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPnNo() {
		return pnNo;
	}

	public void setPnNo(int pnNo) {
		this.pnNo = pnNo;
	}

	public int getpValue() {
		return pValue;
	}

	public void setpValue(int pValue) {
		this.pValue = pValue;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getpReason() {
		return pReason;
	}

	public void setpReason(String pReason) {
		this.pReason = pReason;
	}

	public int getpFkbno() {
		return pFkbno;
	}

	public void setpFkbno(int pFkbno) {
		this.pFkbno = pFkbno;
	}

	public int getpFkpno() {
		return pFkpno;
	}

	public void setpFkpno(int pFkpno) {
		this.pFkpno = pFkpno;
	}

	public int getPbino() {
		return pbino;
	}

	public void setPbino(int pbino) {
		this.pbino = pbino;
	}

	public int getPpino() {
		return ppino;
	}

	public void setPpino(int ppino) {
		this.ppino = ppino;
	}

	@Override
	public String toString() {
		return "Point [pno=" + pno + ", pnNo=" + pnNo + ", pValue=" + pValue + ", pDate=" + pDate + ", pReason="
				+ pReason + ", pFkbno=" + pFkbno + ", pFkpno=" + pFkpno + ", pbino=" + pbino + ", ppino=" + ppino + "]";
	}
	
	
}
