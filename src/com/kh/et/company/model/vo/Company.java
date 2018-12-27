package com.kh.et.company.model.vo;

import java.sql.Date;

public class Company implements java.io.Serializable{
	private int c_no;
	private String c_name;
	private String c_biss_num;
	private String c_id;
	private String c_pwd;
	private String c_phone;
	private String c_email;
	private String c_category;
	private String c_biss_address;
	private Date c_date;
	private Date c_end_date;
	private String c_status;
	
	public Company() {}

	public Company(int c_no, String c_name, String c_biss_num, String c_id, String c_pwd, String c_phone,
			String c_email, String c_category, String c_biss_address, Date c_date, Date c_end_date, String c_status) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
		this.c_biss_num = c_biss_num;
		this.c_id = c_id;
		this.c_pwd = c_pwd;
		this.c_phone = c_phone;
		this.c_email = c_email;
		this.c_category = c_category;
		this.c_biss_address = c_biss_address;
		this.c_date = c_date;
		this.c_end_date = c_end_date;
		this.c_status = c_status;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_biss_num() {
		return c_biss_num;
	}

	public void setC_biss_num(String c_biss_num) {
		this.c_biss_num = c_biss_num;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_pwd() {
		return c_pwd;
	}

	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public String getC_email() {
		return c_email;
	}

	public void setC_email(String c_email) {
		this.c_email = c_email;
	}

	public String getC_category() {
		return c_category;
	}

	public void setC_category(String c_category) {
		this.c_category = c_category;
	}

	public String getC_biss_address() {
		return c_biss_address;
	}

	public void setC_biss_address(String c_biss_address) {
		this.c_biss_address = c_biss_address;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public Date getC_end_date() {
		return c_end_date;
	}

	public void setC_end_date(Date c_end_date) {
		this.c_end_date = c_end_date;
	}

	public String getC_status() {
		return c_status;
	}

	public void setC_status(String c_status) {
		this.c_status = c_status;
	}

	@Override
	public String toString() {
		return "Company [c_no=" + c_no + ", c_name=" + c_name + ", c_biss_num=" + c_biss_num + ", c_id=" + c_id
				+ ", c_pwd=" + c_pwd + ", c_phone=" + c_phone + ", c_email=" + c_email + ", c_category=" + c_category
				+ ", c_biss_address=" + c_biss_address + ", c_date=" + c_date + ", c_end_date=" + c_end_date
				+ ", c_status=" + c_status + "]";
	}
	
	
}
