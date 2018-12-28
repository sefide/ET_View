package com.kh.et.plan.model.vo;

import java.sql.Date;

public class Plan implements java.io.Serializable{
	private int pNo; 
	private int pWriter;    //p_n_no
	private String pTitle;
	private Date pDate;
	private Date pStartDate;
	private Date pEndDate;
	private String pCites;
	private String pPrivate;
	private String pStatus;
	
	public Plan() {}

	public Plan(int pNo, int pWriter, String pTitle, Date pDate, Date pStartDate, Date pEndDate, String pCites,
			String pPrivate, String pStatus) {
		super();
		this.pNo = pNo;
		this.pWriter = pWriter;
		this.pTitle = pTitle;
		this.pDate = pDate;
		this.pStartDate = pStartDate;
		this.pEndDate = pEndDate;
		this.pCites = pCites;
		this.pPrivate = pPrivate;
		this.pStatus = pStatus;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getpWriter() {
		return pWriter;
	}

	public void setpWriter(int pWriter) {
		this.pWriter = pWriter;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public Date getpStartDate() {
		return pStartDate;
	}

	public void setpStartDate(Date pStartDate) {
		this.pStartDate = pStartDate;
	}

	public Date getpEndDate() {
		return pEndDate;
	}

	public void setpEndDate(Date pEndDate) {
		this.pEndDate = pEndDate;
	}

	public String getpCites() {
		return pCites;
	}

	public void setpCites(String pCites) {
		this.pCites = pCites;
	}

	public String getpPrivate() {
		return pPrivate;
	}

	public void setpPrivate(String pPrivate) {
		this.pPrivate = pPrivate;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	@Override
	public String toString() {
		return "Plan [pNo=" + pNo + ", pWriter=" + pWriter + ", pTitle=" + pTitle + ", pDate=" + pDate + ", pStartDate="
				+ pStartDate + ", pEndDate=" + pEndDate + ", pCites=" + pCites + ", pPrivate=" + pPrivate + ", pStatus="
				+ pStatus + "]";
	}
	
	
	
	
}
