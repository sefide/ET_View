package com.kh.et.company.model.service;

import static com.kh.et.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.company.model.vo.Company;
import com.kh.et.member.model.dao.MemberDao;



public class CompanyService {

	// 제휴사 로그인 메소드
	public Company companyLogin(Company reqMember) {
		Connection con = getConnection();

		Company loginCompany = new CompanyDao().companyLogin(con, reqMember);

		close(con);

		return loginCompany;
	}



	public ArrayList<Company> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Company> list = new CompanyDao().selectList(con, currentPage, limit);
		
		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount  = new CompanyDao().getListCount(con);
		
		close(con);
		return listCount;
	}

	public int insertCompany(Company reqCompany) {
		Connection con=getConnection();
		
		int result= new CompanyDao().insertCompany(con,reqCompany);
		
		if(result>0) {
			commit(con);

		} else {
			rollback(con);
		}
		return result;
	}



	public int updateCompany(Company reqCompany) {
		Connection con=getConnection();
		int result=new CompanyDao().updateCompany(con,reqCompany);
		if(result>0) {
			commit(con);

		} else {
			rollback(con);
		}
		return result;
	}



	public Company selectOne(String[] testChk) {
		Connection con=getConnection();
		Company c = null;
		for(String item : testChk) {
			c=new CompanyDao().selectOne(con,item);
			
		}		
		close(con);
		return c;

}



	public Company deleteCompany(String[] testChk) {
		Connection con=getConnection();
		Company c = null;
		for(String item : testChk) {
			c=new CompanyDao().deleteCompany(con,item);
			
		}		
		close(con);
		return c;
	}


	//임시비밀번호 발급 후 DB에서 비밀번호 변경해주기
	public static int newpass(String companyEmailPass, String companyId, String randomCode) {
		Connection con = getConnection();
		
		int result = new CompanyDao().newpass(con, randomCode, companyId, companyEmailPass);
		
		close(con);
		
		return result;
	}



}
