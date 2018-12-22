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

import com.kh.et.member.model.vo.MemberManagerCompany;
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

	//일반회원 로그인 체크용 메소드
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

	//일반회원 회원가입용 메소드
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
	
	//일반 회원 회원가입을 위해 전체 회원 테이블이에서 회원번호 가져오기
	public int selectMemberNo(Connection con, MemberNormal reqMember) {
		int mNo = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberNo");	//회원아이디를 이용해서 회원번호 가져오기
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_id());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mNo = rset.getInt("M_NO");
				System.out.println(mNo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return mNo;
	}

	//일반 회원 회원가입을 위
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

	//관리자 로그인 메소드
	public MemberManagerCompany managerLogin(Connection con, MemberManagerCompany reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberManagerCompany loginManager = null;
		
		String query = prop.getProperty("managerLogin");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_id());
			pstmt.setString(2, reqMember.getM_pwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginManager = new MemberManagerCompany();
				
				loginManager.setM_id(rset.getString("M_ID"));
				loginManager.setM_pwd(rset.getString("M_PWD"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return loginManager;
	}

	//제휴사 로그인 메소드
	public MemberManagerCompany companyLogin(Connection con, MemberManagerCompany reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberManagerCompany loginCompany = null;
		
		String query = prop.getProperty("companyLogin");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_id());
			pstmt.setString(2, reqMember.getM_pwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginCompany = new MemberManagerCompany();
				
				loginCompany.setM_id(rset.getString("M_ID"));
				loginCompany.setM_pwd(rset.getString("M_PWD"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con);
			close(rset);
		}
		
		return loginCompany;
	}



	

}
