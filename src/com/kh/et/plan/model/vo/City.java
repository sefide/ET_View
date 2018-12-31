package com.kh.et.plan.model.vo;

public class City implements java.io.Serializable{
	private int ctNo;
	private String ctName;
	private String ctCountry;
	private String ctInfo;
	private float ctLat;
	private float ctLng;
	private float ctStar;
	
	public City() {}

	
	public City(int ctNo, String ctName, String ctCountry, String ctInfo, float ctLat, float ctLng, float ctStar) {
		super();
		this.ctNo = ctNo;
		this.ctName = ctName;
		this.ctCountry = ctCountry;
		this.ctInfo = ctInfo;
		this.ctLat = ctLat;
		this.ctLng = ctLng;
		this.ctStar = ctStar;
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

	public float getCtLat() {
		return ctLat;
	}

	public void setCtLat(float ctLat) {
		this.ctLat = ctLat;
	}

	public float getCtLng() {
		return ctLng;
	}

	public void setCtLng(float ctLng) {
		this.ctLng = ctLng;
	}

	public float getCtStar() {
		return ctStar;
	}


	public void setCtStar(float ctStar) {
		this.ctStar = ctStar;
	}


	@Override
	public String toString() {
		return "City [ctNo=" + ctNo + ", ctName=" + ctName + ", ctCountry=" + ctCountry + ", ctInfo=" + ctInfo
				+ ", ctLat=" + ctLat + ", ctLng=" + ctLng + ", ctStar=" + ctStar + "]";
	}
	
}
