package com.kh.et.company.model.service;

import static com.kh.et.common.JDBCTemplate.commit;
import static com.kh.et.common.JDBCTemplate.getConnection;
import static com.kh.et.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.company.model.vo.Company;
import com.kh.et.member.model.dao.MemberDao;

public class CompanyService {

	public int insertCompany(Company reqCompany) {
Connection con=getConnection();
		
		int result= new CompanyDao().insertCompany(con,reqCompany);
		
		if(result>0) {
			commit(con);
			
		}else {
			rollback(con);
		}
		return result;
	}

}
