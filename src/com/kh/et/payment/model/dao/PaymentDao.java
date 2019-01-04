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
import java.util.Properties;

import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.company.model.vo.Coupon;
import com.kh.et.payment.model.vo.Payment;

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
}
