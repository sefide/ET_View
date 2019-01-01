package com.kh.et.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private int m_no;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_email;
	private String m_profile;
	private int m_point;
	private int m_storage;
	private String m_question;
	private String m_answer;
	private Date m_date;
	private String m_black_status;
	private String m_stop_status;
	private String m_out_status;
	private Date m_out_date;
	//attachment
	private String a_change_Name;
	
	public Member() {}

	public Member(int m_no, String m_id, String m_pwd, String m_name, String m_email, String m_profile, int m_point,
			int m_storage, String m_question, String m_answer, Date m_date, String m_black_status, String m_stop_status,
			String m_out_status, Date m_out_date, String a_change_Name) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_profile = m_profile;
		this.m_point = m_point;
		this.m_storage = m_storage;
		this.m_question = m_question;
		this.m_answer = m_answer;
		this.m_date = m_date;
		this.m_black_status = m_black_status;
		this.m_stop_status = m_stop_status;
		this.m_out_status = m_out_status;
		this.m_out_date = m_out_date;
		this.a_change_Name = a_change_Name;
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

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	public int getM_storage() {
		return m_storage;
	}

	public void setM_storage(int m_storage) {
		this.m_storage = m_storage;
	}

	public String getM_question() {
		return m_question;
	}

	public void setM_question(String m_question) {
		this.m_question = m_question;
	}

	public String getM_answer() {
		return m_answer;
	}

	public void setM_answer(String m_answer) {
		this.m_answer = m_answer;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	public String getM_black_status() {
		return m_black_status;
	}

	public void setM_black_status(String m_black_status) {
		this.m_black_status = m_black_status;
	}

	public String getM_stop_status() {
		return m_stop_status;
	}

	public void setM_stop_status(String m_stop_status) {
		this.m_stop_status = m_stop_status;
	}

	public String getM_out_status() {
		return m_out_status;
	}

	public void setM_out_status(String m_out_status) {
		this.m_out_status = m_out_status;
	}

	public Date getM_out_date() {
		return m_out_date;
	}

	public void setM_out_date(Date m_out_date) {
		this.m_out_date = m_out_date;
	}
	
	public String getA_change_Name() {
		return a_change_Name;
	}
	
	public void setA_change_Name(String a_change_Name) {
		this.a_change_Name = a_change_Name;
	}

	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_name=" + m_name + ", m_email="
				+ m_email + ", m_profile=" + m_profile + ", m_point=" + m_point + ", m_storage=" + m_storage
				+ ", m_question=" + m_question + ", m_answer=" + m_answer + ", m_date=" + m_date + ", m_black_status="
				+ m_black_status + ", m_stop_status=" + m_stop_status + ", m_out_status=" + m_out_status
				+ ", m_out_date=" + m_out_date + a_change_Name + "]";
	}

	
}
