package com.kh.et.plan.model.vo;

import java.sql.Date;

public class Plan implements java.io.Serializable{
	private int pNo; 
	private int pWriter;   //p_n_no
	private String pId;
	private String pTitle;
	private Date pDate;
	private Date pStartDate;
	private Date pEndDate;
	private String pCites;
	private String pPrivate;
	private String pStatus;
	private int pLike;
	private int Scrap;
	
	public Plan() {}

	


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

	public int getpLike() {
		return pLike;
	}

	public void setpLike(int pLike) {
		this.pLike = pLike;
	}




	public String getpId() {
		return pId;
	}




	









	@Override
	public String toString() {
		return "Plan [pNo=" + pNo + ", pWriter=" + pWriter + ", pId=" + pId + ", pTitle=" + pTitle + ", pDate=" + pDate
				+ ", pStartDate=" + pStartDate + ", pEndDate=" + pEndDate + ", pCites=" + pCites + ", pPrivate="
				+ pPrivate + ", pStatus=" + pStatus + ", pLike=" + pLike + ", Scrap=" + Scrap + "]";
	}




	public Plan(int pNo, int pWriter, String pId, String pTitle, Date pDate, Date pStartDate, Date pEndDate,
			String pCites, String pPrivate, String pStatus, int pLike, int scrap) {
		super();
		this.pNo = pNo;
		this.pWriter = pWriter;
		this.pId = pId;
		this.pTitle = pTitle;
		this.pDate = pDate;
		this.pStartDate = pStartDate;
		this.pEndDate = pEndDate;
		this.pCites = pCites;
		this.pPrivate = pPrivate;
		this.pStatus = pStatus;
		this.pLike = pLike;
		Scrap = scrap;
	}




	public void setpId(String pId) {
		this.pId = pId;
	}




	public int getScrap() {
		return Scrap;
	}




	public void setScrap(int scrap) {
		Scrap = scrap;
	}

	

	
}
