package com.kh.et.company.model.service;

import static com.kh.et.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.company.model.vo.Company;

public class CompanyService {
	
	//제휴사 로그인 메소드
		public Company companyLogin(Company reqMember) {
			Connection con = getConnection();
			
			Company loginCompany = new CompanyDao().companyLogin(con, reqMember);
			
			close(con);
			
			return loginCompany;
		}

}
