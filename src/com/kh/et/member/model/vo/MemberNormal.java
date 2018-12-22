package com.kh.et.member.model.vo;

import java.sql.Date;

public class MemberNormal implements java.io.Serializable{
	private int m_no;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_email;
	private Date m_date;
	private String m_status;
	
	private String n_quetion;
	private String n_answer;
	private int storage;	//플랜 저장공간
	private String profile;
	private int n_point;
	private String n_black;
	
	public MemberNormal() {}

	public MemberNormal(int m_no, String m_id, String m_pwd, String m_name, String m_email, Date m_date,
			String m_status, String n_quetion, String n_answer, int storage, String profile, int n_point,
			String n_black) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_date = m_date;
		this.m_status = m_status;
		this.n_quetion = n_quetion;
		this.n_answer = n_answer;
		this.storage = storage;
		this.profile = profile;
		this.n_point = n_point;
		this.n_black = n_black;
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

	public String getN_quetion() {
		return n_quetion;
	}

	public void setN_quetion(String n_quetion) {
		this.n_quetion = n_quetion;
	}

	public String getN_answer() {
		return n_answer;
	}

	public void setN_answer(String n_answer) {
		this.n_answer = n_answer;
	}

	public int getStorage() {
		return storage;
	}

	public void setStorage(int storage) {
		this.storage = storage;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getN_point() {
		return n_point;
	}

	public void setN_point(int n_point) {
		this.n_point = n_point;
	}

	public String getN_black() {
		return n_black;
	}

	public void setN_black(String n_black) {
		this.n_black = n_black;
	}

	@Override
	public String toString() {
		return "MemberNormal [m_no=" + m_no + ", m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_name=" + m_name
				+ ", m_email=" + m_email + ", m_date=" + m_date + ", m_status=" + m_status + ", n_quetion=" + n_quetion
				+ ", n_answer=" + n_answer + ", storage=" + storage + ", profile=" + profile + ", n_point=" + n_point
				+ ", n_black=" + n_black + "]";
	}
	
	
	
}
	
	
	
	

	
	