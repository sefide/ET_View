package com.kh.et.company.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.et.company.model.vo.Company;
import static com.kh.et.common.JDBCTemplate.*;


public class CompanyDao {
	
	private Properties prop=new Properties();
	
	public CompanyDao() {
		
	String fileName=CompanyDao.class.getResource("/sql/company/company-query.properties").getPath();
	try {
		prop.load(new FileReader(fileName));
	} catch (IOException e) {
		
		e.printStackTrace();
	}
	
	
	
	}
	public int insertCompany(Connection con, Company reqCompany) {
		PreparedStatement pstmt=null;
		int result=0;
		String query=prop.getProperty("insertCompany");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, reqCompany.getC_name());
			pstmt.setString(2, reqCompany.getC_biss_num());
			pstmt.setString(3, reqCompany.getC_represent());
			pstmt.setDate(4, reqCompany.getC_date());
			pstmt.setDate(5, reqCompany.getC_end_date());
			pstmt.setString(6, reqCompany.getC_phone());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
