package com.kh.et.payment.model.dao;

import static com.kh.et.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.company.model.vo.Company;
import com.kh.et.company.model.vo.Coupon;
import com.kh.et.payment.model.vo.Payment;
import com.kh.et.tourBoard.model.vo.TourBoard;

public class PaymentDao {
	
	private Properties prop = new Properties();

	public PaymentDao() {
		String fileName = CompanyDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPayment(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query=prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getPayCno());
			pstmt.setString(2, p.getPayCardNum());
			pstmt.setInt(3, p.getPrice());
			pstmt.setString(4, "standard");
			
			result = pstmt.executeUpdate();
			System.out.println("insertPayment:"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectCurrval(Connection con, Payment p) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int tno = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				tno = rset.getInt("CURRVAL");
				System.out.println("tno:"+tno);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		
		return tno;
	}

	public int insertCoupon(Connection con, Coupon c, Payment p) {
		PreparedStatement pstmt = null;
		int result=0;
		
		String query = prop.getProperty("insertCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getPayCno());
			pstmt.setString(2, "standard");
			pstmt.setString(3, "구입");
			pstmt.setInt(4, p.getPayNo());
			
			result = pstmt.executeUpdate();
			System.out.println("insertCoupon:"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int updateCompanyCoupon(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCompanyCouponStd");
		
		try {
			pstmt = con.prepareStatement(query);
			int count = p.getPrice()/2;
			pstmt.setInt(1, count);
			pstmt.setInt(2, p.getPayCno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	public int insertPremiumPayment(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query=prop.getProperty("insertPremiumPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getPayCno());
			pstmt.setString(2, p.getPayCardNum());
			pstmt.setInt(3, p.getPrice());
			pstmt.setString(4, "premium");
			
			result = pstmt.executeUpdate();
			System.out.println("insertPremiumPayment:"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPremiumCoupon(Connection con, Coupon c, Payment p) {
		PreparedStatement pstmt = null;
		int result=0;
		
		String query = prop.getProperty("insertPremiumCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getPayCno());
			pstmt.setString(2, "premium");
			pstmt.setString(3, "구입");
			pstmt.setInt(4, p.getPayNo());
			
			result = pstmt.executeUpdate();
			System.out.println("insertCoupon:"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int updateCompanyPremiumCoupon(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCompanyCouponPre");
		
		try {
			pstmt = con.prepareStatement(query);
			int count = p.getPrice()/2;
			pstmt.setInt(1, count);
			pstmt.setInt(2, p.getPayCno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	public ArrayList<Payment> selectPayList(Connection con, int currentPage, int limit, Company loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Payment> list = null;
		
		String query = prop.getProperty("selectPayList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) * limit +1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, loginUser.getC_no());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Payment>();
			
			while(rset.next()) {
				Payment pm = new Payment();
				
				pm.setPayNo(rset.getInt("RNUM"));
				pm.setPayCT(rset.getString("PAY_COUPON_TYPE"));
				pm.setPrice(rset.getInt("PAY_PRICE"));
				pm.setPayDate(rset.getDate("PAY_DATE"));
				
				list.add(pm);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListpayCoupon(Connection con, Company loginUser) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getListpayCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,loginUser.getC_no());
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
