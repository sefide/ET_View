package com.kh.et.company.model.dao;

import static com.kh.et.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.et.company.model.vo.Company;

public class CompanyDao {
	private Properties prop = new Properties();

	public CompanyDao() {
		String fileName = CompanyDao.class.getResource("/sql/company/company-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 제휴사 로그인 메소드
	public Company companyLogin(Connection con, Company reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Company loginCompany = null;

		String query = prop.getProperty("companyLogin");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getC_id());
			pstmt.setString(2, reqMember.getC_pwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginCompany = new Company();

				loginCompany.setC_no(rset.getInt("C_NO"));
				loginCompany.setC_name(rset.getString("C_NAME"));
				loginCompany.setC_biss_num(rset.getString("C_BISS_NUM"));
				loginCompany.setC_id(rset.getString("C_ID"));
				loginCompany.setC_pwd(rset.getString("C_PWD"));
				loginCompany.setC_phone(rset.getString("C_PHONE"));
				loginCompany.setC_email(rset.getString("C_EMAIL"));
				loginCompany.setC_category(rset.getString("C_CATEGORY"));
				loginCompany.setC_biss_address(rset.getString("C_BISS_ADDRESS"));
				loginCompany.setC_date(rset.getDate("C_DATE"));
				loginCompany.setC_end_date(rset.getDate("C_END_DATE"));
				loginCompany.setC_status(rset.getString("C_STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
			close(rset);
		}

		return loginCompany;
	}

	/*// 관리자가 제휴사 추가하는 메소드
	public int insertCompany(Connection con, Company reqCompany) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertCompany");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqCompany.getC_name());
			pstmt.setString(2, reqCompany.getC_biss_num());
			pstmt.setString(3, reqCompany.getC_represent());
			pstmt.setDate(4, reqCompany.getC_date());
			pstmt.setDate(5, reqCompany.getC_end_date());
			pstmt.setString(6, reqCompany.getC_phone());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
*/
}
