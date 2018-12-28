package com.kh.et.plan.model.vo;

import java.sql.Date;

public class PlanDetail {
	private int pdNo;
	private int pdpNo; // pd_p_no - 참조하는 플랜 번
	private String pdStartcity;
	private String pdEndCity;
	private Date pdStartDate;
	private Date pdEndDate;
	private String pdTrasnfer;
	private String pdStatus;
	
	public PlanDetail() {}

	public PlanDetail(int pdNo, int pdpNo, String pdStartcity, String pdEndCity, Date pdStartDate, Date pdEndDate,
			String pdTrasnfer, String pdStatus) {
		super();
		this.pdNo = pdNo;
		this.pdpNo = pdpNo;
		this.pdStartcity = pdStartcity;
		this.pdEndCity = pdEndCity;
		this.pdStartDate = pdStartDate;
		this.pdEndDate = pdEndDate;
		this.pdTrasnfer = pdTrasnfer;
		this.pdStatus = pdStatus;
	}

	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}

	public int getPdpNo() {
		return pdpNo;
	}

	public void setPdpNo(int pdpNo) {
		this.pdpNo = pdpNo;
	}

	public String getPdStartcity() {
		return pdStartcity;
	}

	public void setPdStartcity(String pdStartcity) {
		this.pdStartcity = pdStartcity;
	}

	public String getPdEndCity() {
		return pdEndCity;
	}

	public void setPdEndCity(String pdEndCity) {
		this.pdEndCity = pdEndCity;
	}

	public Date getPdStartDate() {
		return pdStartDate;
	}

	public void setPdStartDate(Date pdStartDate) {
		this.pdStartDate = pdStartDate;
	}

	public Date getPdEndDate() {
		return pdEndDate;
	}

	public void setPdEndDate(Date pdEndDate) {
		this.pdEndDate = pdEndDate;
	}

	public String getPdTrasnfer() {
		return pdTrasnfer;
	}

	public void setPdTrasnfer(String pdTrasnfer) {
		this.pdTrasnfer = pdTrasnfer;
	}

	public String getPdStatus() {
		return pdStatus;
	}

	public void setPdStatus(String pdStatus) {
		this.pdStatus = pdStatus;
	}

	@Override
	public String toString() {
		return "PlanDetail [pdNo=" + pdNo + ", pdpNo=" + pdpNo + ", pdStartcity=" + pdStartcity + ", pdEndCity="
				+ pdEndCity + ", pdStartDate=" + pdStartDate + ", pdEndDate=" + pdEndDate + ", pdTrasnfer=" + pdTrasnfer
				+ ", pdStatus=" + pdStatus + "]";
	}
	

}
