package com.kh.et.manager.model.dao;

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

import com.kh.et.manager.model.vo.Manager;
import com.kh.et.member.model.vo.Member;

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
		System.out.println(query);
		try {
			System.out.println("진입");
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

		
		return loginManager;
	}

	//전체회원수 구하기
	public int selectTotal(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int total_member = 0;
		
		String query = prop.getProperty("selectTotalMember");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				total_member = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return total_member;
	}

	//신규회원 수 
	public int selectNewMember(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int new_member = 0;
		
		String query = prop.getProperty("selectNewMember");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				new_member = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return new_member;
	}

	//탈퇴회원수
	public int selectOutMember(Connection con) {
		Statement stmt= null;
		ResultSet rset = null;
		int out_member= 0;
		
		String query = prop.getProperty("selectOutMember");
		
		try {
			stmt =con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				out_member = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return out_member;
	}

	//전체회원수 조회
	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		//전체 게시글 수 조회
		String query = prop.getProperty("memberListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1); //? 총 글의개수
				System.out.println("공지사항 list개수 : "+listCount);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return listCount;


	}
	 
	//회원리스트 배열에 담기
	public ArrayList<Member> selectAllList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("selectAllList");
				
		try {
			pstmt =con.prepareStatement(query);
			
			
			//현재페이지(목록)에서 시작하는 글번호
			int startRow = (currentPage - 1) * limit + 1;
			//현재페이지에서 마지막 글번호
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setM_no(rset.getInt("M_NO"));
				m.setM_id(rset.getString("M_ID"));
				m.setM_email(rset.getString("M_EMAIL"));
				m.setM_date(rset.getDate("M_DATE"));
				m.setM_name(rset.getString("M_NAME"));
				m.setM_black_status(rset.getString("M_BLACK_STATUS"));
				m.setM_point(rset.getInt("M_POINT"));
				m.setM_question(rset.getString("M_QUESTION"));
				m.setM_answer(rset.getString("M_ANSWER"));
				
				list.add(m);				
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}
