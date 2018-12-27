package com.kh.et.manager.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.et.manager.model.vo.Manager;
import static com.kh.et.common.JDBCTemplate.close;

public class ManagerDao {
	Properties prop = new Properties();
	
	public ManagerDao() {
		String fileName = ManagerDao.class.getResource("/sql/manager/manager-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	//관리자 로그인 메소드
	public Manager managerLogin(Connection con, Manager reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Manager loginManager = null;

		String query = prop.getProperty("managerLogin");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getMag_id());
			pstmt.setString(2, reqMember.getMag_pwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginManager = new Manager();

				loginManager.setMag_id(rset.getString("MAG_ID"));
				loginManager.setMag_pwd(rset.getString("MAG_PWD"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		System.out.println("매니저 로그인 gg: " + loginManager);
		
		return loginManager;
	}

}
