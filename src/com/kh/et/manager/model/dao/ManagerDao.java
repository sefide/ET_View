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
import java.util.HashMap;
import java.util.Properties;

import javax.swing.plaf.synth.SynthSpinnerUI;

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
				listCount = rset.getInt(1); // 총 글의개수
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

	public int totalBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int totalBoard = 0;
		
		String query = prop.getProperty("boardListCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				totalBoard = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return totalBoard;
	}

	public int todayBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int todayBoard = 0;
		
		String query = prop.getProperty("todayBoard");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				todayBoard = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return todayBoard;
	}

	public int avgBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int avgBoard = 0;
		
		String query = prop.getProperty("avgBoard");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				avgBoard = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return avgBoard;
	}

	//최대포인트
	public int selectMaxPoint(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int max_point=0;
		
		String query = prop.getProperty("maxPoint");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				max_point = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return max_point;
	}

	//200포인트 이상 보유한 회원수
	public int selectCountMember(Connection con) {
		Statement stmt= null;
		ResultSet rset = null;
		int max_count_member = 0;
		
		String query = prop.getProperty("maxCountMember");
		
		try {
			stmt= con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				max_count_member = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		
		return max_count_member;
	}

	//블랙회원조회
	public ArrayList<Member> selectBlackList(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		Member m = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("selectBlackList");
		
		list = new ArrayList<Member>();
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			//현재페이지(목록)에서 시작하는 글번호
			int startRow = (currentPage - 1) * limit + 1;
			//현재페이지에서 마지막 글번호
			int endRow = startRow + limit - 1;
			/*System.out.println("endRow : "+endRow);*/
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m = new Member();
				
				m.setM_no(rset.getInt("M_NO"));
				m.setM_id(rset.getString("M_ID"));
				m.setM_email(rset.getString("M_EMAIL"));
				m.setM_point(rset.getInt("CNT"));
				
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

	//정지회원조회
	public ArrayList<HashMap<String, Object>> selectStopList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		Member m = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectStopList");
		
		list = new ArrayList<HashMap<String, Object>>();
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			//현재페이지(목록)에서 시작하는 글번호
			int startRow = (currentPage - 1) * limit + 1;
			//현재페이지에서 마지막 글번호
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap=new HashMap<String,Object>();
				
				hmap.put("m_no",rset.getInt("M_NO"));
				hmap.put("m_id",rset.getString("M_ID"));
				hmap.put("m_email",rset.getString("M_EMAIL"));
				hmap.put("m_date",rset.getString("M_DATE"));
				hmap.put("m_name",rset.getString("M_NAME"));//뽑아오는것은 숫자
				hmap.put("s_start_date",rset.getString("BK_START_DATE"));
				hmap.put("s_end_date",rset.getString("BK_END_DATE"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectPlan(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt=null;
		ArrayList<HashMap<String,Object>> list=null;
		HashMap<String, Object> hmap=null;
		ResultSet rset=null;
		
		String query=prop.getProperty("selectPlan");
		System.out.println("hashmap1dao");
		try {
			pstmt=con.prepareStatement(query);
			
			int startRow=(currentPage-1)*limit+1;
			int endRow = startRow + limit - 1;	//한 페이지에서의 글 목록 끝 번호
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, "좋아요");
			rset = pstmt.executeQuery();
			
			list=new ArrayList<HashMap<String,Object>>();
			
			System.out.println("hashmap2dao");
			while(rset.next()) {
				hmap=new HashMap<String,Object>();
				
				hmap.put("pNo",rset.getInt("P_NO"));
				hmap.put("pTitle",rset.getString("P_TITLE"));
				hmap.put("m_name",rset.getString("M_NAME"));
				hmap.put("pPrivate",rset.getString("P_PRIVATE"));
				hmap.put("PI_type",rset.getString("CNT"));//뽑아오는 것은 숫자
				list.add(hmap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int getListCount1(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		//전체 게시글 수 조회
		String query = prop.getProperty("planListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1); //? 총 글의개수
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return listCount;

	}

	public ArrayList<HashMap<String, Object>> boardList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt=null;
		ArrayList<HashMap<String,Object>> list=null;
		HashMap<String, Object> hmap=null;
		ResultSet rset=null;
		
		String query=prop.getProperty("boardList");
		//SELECT ROWNUM RNUM,B_NO,B_TITLE,M_NAME,B_CONTENT,B_DATE,CNTA,CNTB 
		/*		FROM(SELECT B.B_NO,B.B_TITLE,M_NAME,B_CONTENT,B_DATE,COUNT(BI_TYPE)AS CNTA ,COUNT(B_TYPE) AS CNTB 
				FROM BOARDINTEREST BI JOIN BOARD B ON(B.B_NO=BI.BI_B_NO)JOIN MEMBER M ON(B.B_NO=M.M_NO)
				WHERE BI_TYPE='?' AND B.B_TYPE='0' AND B.B_STATUS='Y' 
				GROUP BY B.B_NO,B.B_TITLE,M.M_NAME,B.B_CONTENT,B.B_DATE,BI.BI_TYPE,B.B_TYPE)
				WHERE ROWNUM BETWEEN ? AND ?
				GROUP BY ROWNUM,B_NO,B_TITLE,M_NAME,B_CONTENT,B_DATE,CNTA,CNTB 
				ORDER BY B_NO*/
		
		
		
		
		
		
		try {
			pstmt=con.prepareStatement(query);
		
			int startRow=(currentPage-1)*limit+1;
			int endRow = startRow + limit - 1;	//한 페이지에서의 글 목록 끝 번호
			
			
			pstmt.setString(1, "좋아요");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			list=new ArrayList<HashMap<String,Object>>();
			
			System.out.println("hashmap2dao");
			while(rset.next()) {
				hmap=new HashMap<String,Object>();
				
				hmap.put("bNo",rset.getInt("B_NO"));
				hmap.put("bTitle",rset.getString("B_TITLE"));
				hmap.put("mName",rset.getString("M_NAME"));
				hmap.put("bContent",rset.getString("B_CONTENT"));
				hmap.put("bDate",rset.getDate("B_DATE"));
				hmap.put("like",rset.getString("CNTA"));
				hmap.put("reply",rset.getString("CNTB"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		return list;
	}

	public int getListCount2(Connection con) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		//전체 게시글 수 조회
		String query = prop.getProperty("boardListCount1");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "좋아요");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount++;
				//listCount = rset.getInt(1); //? 총 글의개수
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}

	//블랙리스트 회원조회 리스트 개수
	public int getBlackListCount(Connection con) {
		Statement stmt = null;
		int BlackListCount = 0;
		ResultSet rset = null;
		
		//전체 게시글 수 조회
		String query = prop.getProperty("BlackMemberListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				BlackListCount = rset.getInt(1); // 총 글의개수
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return BlackListCount;
	}

	//정지회원 회원조회 리스트 개수
	public int getStopListCount(Connection con) {
		Statement stmt = null;
		int StopListCount = 0;
		ResultSet rset = null;
		
		//전체 게시글 수 조회
		String query = prop.getProperty("StopMemberListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				StopListCount = rset.getInt(1); // 총 글의개수
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return StopListCount;
	}

	//탈퇴회원 회원조회 리스트 개수
	public int getOutListCount(Connection con) {
		Statement stmt = null;
		int OutListCount = 0;
		ResultSet rset = null;
		
		//전체 게시글 수 조회
		String query = prop.getProperty("OutMemberListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				OutListCount = rset.getInt(1); // 총 글의개수
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return OutListCount;
	}

	//탈퇴회원 조회
	public ArrayList<Member> selectOutList(Connection con, int currentPage2, int limit2) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		Member m = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("selectOutList");
		
		list = new ArrayList<Member>();
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			//현재페이지(목록)에서 시작하는 글번호
			int startRow = (currentPage2 - 1) * limit2 + 1;
			//현재페이지에서 마지막 글번호
			int endRow = startRow + limit2 - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				m = new Member();
				
				m.setM_no(rset.getInt("M_NO"));
				m.setM_id(rset.getString("M_ID"));
				m.setM_email(rset.getString("M_EMAIL"));
				m.setM_date(rset.getDate("M_DATE"));
				m.setM_name(rset.getString("M_NAME"));
				m.setM_out_date(rset.getDate("M_OUT_DATE"));
				
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

	public ArrayList<HashMap<String, Object>> tourboardList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt=null;
		ArrayList<HashMap<String,Object>> list=null;
		HashMap<String, Object> hmap=null;
		ResultSet rset=null;
		
		String query=prop.getProperty("tourBoardList");
		/*SELECT RNUM,T_TITLE,C_NAME,CT_NAME,CT_COUNTRY,T_CONCEPT,T_DATE,T_LINK,T_PRICE
		FROM(SELECT ROWNUM RNUM,T_TITLE,C_NAME,CT_NAME,CT_COUNTRY,T_CONCEPT,T_DATE,T_LINK,T_PRICE
		FROM(SELECT T_TITLE,C_NAME,CT_NAME,CT_COUNTRY,T_CONCEPT,T_DATE,T_LINK ,T_PRICE
		FROM TOURBOARD T JOIN TRAVELCITY TC ON(T.T_CT_NO=TC.CT_NO)
		JOIN COMPANY C ON(T.T_C_NO=C.C_NO)
		WHERE T_STATUS='Y'))
		WHERE RNUM BETWEEN ? AND ?;*/
		
		try {
			pstmt=con.prepareStatement(query);
		
			int startRow=(currentPage-1)*limit+1;
			int endRow = startRow + limit - 1;	//한 페이지에서의 글 목록 끝 번호
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			list=new ArrayList<HashMap<String,Object>>();
		
			while(rset.next()) {
				
				
				hmap=new HashMap<String,Object>();
				hmap.put("tTitle",rset.getString("T_TITLE"));
				hmap.put("cName",rset.getString("C_NAME"));
				hmap.put("ctCountry",rset.getString("CT_COUNTRY"));
				hmap.put("ctName",rset.getString("CT_NAME"));
				hmap.put("tConcept",rset.getString("T_CONCEPT"));
				hmap.put("tPrice",rset.getInt("T_PRICE"));
				hmap.put("tDate",rset.getDate("T_DATE"));
				hmap.put("tLink", rset.getString("T_LINK"));
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		return list;
	}

	public int getListCount3(Connection con) {
		Statement stmt = null;
		int tourCount = 0;
		ResultSet rset = null;
		
		//전체 게시글 수 조회
		String query = prop.getProperty("tourBoardCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				tourCount= rset.getInt(1); // 총 글의개수
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return tourCount;
	}
}
