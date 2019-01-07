package com.kh.et.tourBoard.model.vo;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.Date;

import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.company.model.vo.Company;
import com.kh.et.tourBoard.model.dao.TourBoardDao;

public class TourBoard implements java.io.Serializable{
	private int tno;
	private int tcno;
	private int tctno;
	private String tTitle;
	private String tConcept;
	private String tInfo;
	private int tPrice;
	private String tLink;
	private String tGrade;
	private String tStatus;
	private Date tDate;
	private Date tEndDate;
	private String tctName;
	
	public TourBoard() {}

	public TourBoard(int tno, int tcno, int tctno, String tTitle, String tConcept, String tInfo, int tPrice,
			String tLink, String tGrade, String tStatus, Date tDate, Date tEndDate, String tctName) {
		super();
		this.tno = tno;
		this.tcno = tcno;
		this.tctno = tctno;
		this.tTitle = tTitle;
		this.tConcept = tConcept;
		this.tInfo = tInfo;
		this.tPrice = tPrice;
		this.tLink = tLink;
		this.tGrade = tGrade;
		this.tStatus = tStatus;
		this.tDate = tDate;
		this.tEndDate = tEndDate;
		this.tctName = tctName;
	}


	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public int getTcno() {
		return tcno;
	}

	public void setTcno(int tcno) {
		this.tcno = tcno;
	}

	public int getTctno() {
		return tctno;
	}

	public void setTctno(int tctno) {
		this.tctno = tctno;
	}

	public String gettTitle() {
		return tTitle;
	}

	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}

	public String gettConcept() {
		return tConcept;
	}

	public void settConcept(String tConcept) {
		this.tConcept = tConcept;
	}

	public String gettInfo() {
		return tInfo;
	}

	public void settInfo(String tInfo) {
		this.tInfo = tInfo;
	}

	public int gettPrice() {
		return tPrice;
	}

	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}

	public String gettLink() {
		return tLink;
	}

	public void settLink(String tLink) {
		this.tLink = tLink;
	}

	public String gettGrade() {
		return tGrade;
	}

	public void settGrade(String tGrade) {
		this.tGrade = tGrade;
	}

	public String gettStatus() {
		return tStatus;
	}

	public void settStatus(String tStatus) {
		this.tStatus = tStatus;
	}

	public Date gettDate() {
		return tDate;
	}

	public void settDate(Date tDate) {
		this.tDate = tDate;
	}

	public Date gettEndDate() {
		return tEndDate;
	}

	public void settEndDate(Date tEndDate) {
		this.tEndDate = tEndDate;
	}

	public String getTctName() {
		return tctName;
	}

	public void setTctName(String tctName) {
		this.tctName = tctName;
	}

	@Override
	public String toString() {
		return "TourBoard [tno=" + tno + ", tcno=" + tcno + ", tctno=" + tctno + ", tTitle=" + tTitle + ", tConcept="
				+ tConcept + ", tInfo=" + tInfo + ", tPrice=" + tPrice + ", tLink=" + tLink + ", tGrade=" + tGrade
				+ ", tStatus=" + tStatus + ", tDate=" + tDate + ", tEndDate=" + tEndDate + ", tctName=" + tctName + "]";
	}

	
	
	
}
