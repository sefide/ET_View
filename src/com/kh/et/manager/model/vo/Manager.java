package com.kh.et.manager.model.vo;

public class Manager {
	private String mag_id;
	private String mag_pwd;
	
	public Manager() {}

	public Manager(String mag_id, String mag_pwd) {
		super();
		this.mag_id = mag_id;
		this.mag_pwd = mag_pwd;
	}

	public String getMag_id() {
		return mag_id;
	}

	public void setMag_id(String mag_id) {
		this.mag_id = mag_id;
	}

	public String getMag_pwd() {
		return mag_pwd;
	}

	public void setMag_pwd(String mag_pwd) {
		this.mag_pwd = mag_pwd;
	}

	@Override
	public String toString() {
		return "Manager [mag_id=" + mag_id + ", mag_pwd=" + mag_pwd + "]";
	}
	
	
}
