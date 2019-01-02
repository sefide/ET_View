package com.kh.et.point.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.et.point.model.vo.Point;
import com.kh.et.tourBoard.model.dao.TourBoardDao;
import static com.kh.et.common.JDBCTemplate.*;

public class PointDao {
	private Properties prop = new Properties();
	
	public PointDao() {
		String fileName= TourBoardDao.class.getResource("/sql/point/point-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertPoint(Connection con, int pmNo, int pFkpNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertPoint");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pmNo);
			pstmt.setString(2, "플랜비공개");
			pstmt.setInt(3, pFkpNo);
			
			result = pstmt.executeUpdate();
			System.out.println("insertPoint");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMemberPoint(Connection con, int pmNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pmNo);
			System.out.println("updateMemberPoint");
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePlanPrivate(Connection con, int pFkpNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePlanPrivate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pFkpNo);
			
			result = pstmt.executeUpdate();
			System.out.println("updatePlanPrivate");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



	

}
