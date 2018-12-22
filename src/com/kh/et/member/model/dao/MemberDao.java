package com.kh.et.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.et.member.model.vo.MemberNormal;

import static com.kh.et.common.JDBCTemplate.*;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public MemberNormal loginCheck(Connection con, MemberNormal reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberNormal loginUser = null;
		
		String query = prop.getProperty("loginSelect");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_id());
			pstmt.setString(2, reqMember.getM_pwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new MemberNormal();
				
				loginUser.setM_no(rset.getInt("M_NO"));
				loginUser.setM_id(rset.getString("M_ID"));
				loginUser.setM_pwd(rset.getString("M_PWD"));
				loginUser.setM_name(rset.getString("M_NAME"));
				loginUser.setM_email(rset.getString("M_EMAIL"));
				loginUser.setM_date(rset.getDate("M_DATE"));
				loginUser.setM_status(rset.getString("M_STATUS"));
				
			}
			
	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginUser;
	}

	public int insertMember(Connection con, MemberNormal reqMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_id());
			pstmt.setString(2, reqMember.getM_pwd());
			pstmt.setString(3, reqMember.getM_name());
			pstmt.setString(4, reqMember.getM_email());
			
			result = pstmt.executeUpdate();
					
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectMemberNo(Connection con, MemberNormal reqMember) {
		int Mno = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_id());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				Mno = rset.getInt("M_NO");
				System.out.println(Mno);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return Mno;
	}

	public int insertMemberPlus(Connection con, MemberNormal reqMember, int mNo) {
		PreparedStatement pstmt = null;
		int finalResult = 0;
		
		String query = prop.getProperty("insertMemberPlus");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getN_quetion());
			pstmt.setString(2, reqMember.getN_answer());
			pstmt.setInt(3, 2);
			pstmt.setString(4, "귀여운 애디니에요");
			pstmt.setInt(5, 20);
			pstmt.setInt(6, mNo);
			
			
			finalResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return finalResult;
	}



	

}
