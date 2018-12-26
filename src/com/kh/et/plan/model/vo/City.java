package com.kh.et.plan.model.vo;

public class City implements java.io.Serializable{
	private int ctNo;
	private String ctName;
	private String ctCountry;
	private String ctInfo;
	
	public City() {}

	public City(int ctNo, String ctName, String ctCountry, String ctInfo) {
		super();
		this.ctNo = ctNo;
		this.ctName = ctName;
		this.ctCountry = ctCountry;
		this.ctInfo = ctInfo;
	}

	public int getCtNo() {
		return ctNo;
	}

	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	public String getCtCountry() {
		return ctCountry;
	}

	public void setCtCountry(String ctCountry) {
		this.ctCountry = ctCountry;
	}

	public String getCtInfo() {
		return ctInfo;
	}

	public void setCtInfo(String ctInfo) {
		this.ctInfo = ctInfo;
	}

	@Override
	public String toString() {
		return "City [ctNo=" + ctNo + ", ctName=" + ctName + ", ctCountry=" + ctCountry + ", ctInfo=" + ctInfo + "]";
	}
	
	
	
}
