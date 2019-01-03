package com.kh.et.point.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.et.member.model.vo.Member;
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

	public int insertPointStorage(Connection con, int mno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPointStorage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setString(2, "플랜저장공간확장");
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMemberPointAndStorageExd(Connection con, int mno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMemberPointAndStorageExd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Point> selectPointList(Connection con, int currentPage, int limit, Member loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Point> list = null;
		
		String query = prop.getProperty("selectPointList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) * limit +1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, loginUser.getM_no());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Point>();
			
			while(rset.next()) {
				Point p = new Point();
				
	/*			p.setPno(rset.getInt("PO_NO"));
				p.setPnNo(rset.getInt("PO_N_NO"));*/
				p.setpValue(rset.getInt("PO_VALUE"));
				p.setpDate(rset.getDate("PO_DATE"));
				p.setpReason(rset.getString("PO_REASON"));
				/*p.setpFkbno(rset.getInt("PO_FK_B_NO"));
				p.setpFkpno(rset.getInt("PO_FK_P_NO"));
				p.setPbino(rset.getInt("PO_BI_NO"));
				p.setPpino(rset.getInt("PO_PI_NO"));*/
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCount(Connection con, Member loginUser ) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount3");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,loginUser.getM_no() );
			rset =pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return listCount;
	}



	

}
