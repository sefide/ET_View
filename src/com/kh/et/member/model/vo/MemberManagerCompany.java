package com.kh.et.member.model.vo;

import java.sql.Date;

public class MemberManagerCompany {
	private int m_no;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_email;
	private Date m_date;
	private String m_status;
	
	private String c_name;
	private String c_category;
	private String c_biss_num;
	private String c_biss_address;
	private Date c_end_date;
	
	public MemberManagerCompany() {}

	public MemberManagerCompany(int m_no, String m_id, String m_pwd, String m_name, String m_email, Date m_date,
			String m_status, String c_name, String c_category, String c_biss_num, String c_biss_address,
			Date c_end_date) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_date = m_date;
		this.m_status = m_status;
		this.c_name = c_name;
		this.c_category = c_category;
		this.c_biss_num = c_biss_num;
		this.c_biss_address = c_biss_address;
		this.c_end_date = c_end_date;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_category() {
		return c_category;
	}

	public void setC_category(String c_category) {
		this.c_category = c_category;
	}

	public String getC_biss_num() {
		return c_biss_num;
	}

	public void setC_biss_num(String c_biss_num) {
		this.c_biss_num = c_biss_num;
	}

	public String getC_biss_address() {
		return c_biss_address;
	}

	public void setC_biss_address(String c_biss_address) {
		this.c_biss_address = c_biss_address;
	}

	public Date getC_end_date() {
		return c_end_date;
	}

	public void setC_end_date(Date c_end_date) {
		this.c_end_date = c_end_date;
	}

	@Override
	public String toString() {
		return "MemberManager [m_no=" + m_no + ", m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_name=" + m_name
				+ ", m_email=" + m_email + ", m_date=" + m_date + ", m_status=" + m_status + ", c_name=" + c_name
				+ ", c_category=" + c_category + ", c_biss_num=" + c_biss_num + ", c_biss_address=" + c_biss_address
				+ ", c_end_date=" + c_end_date + "]";
	}
	
	
}
