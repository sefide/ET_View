package com.kh.et.member.model.dao;

import static com.kh.et.common.JDBCTemplate.close;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;


import com.kh.et.member.model.vo.Member;
import com.kh.et.tourBoard.model.vo.Attachment;

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

	//로그인 체크용 메소드
	public Member loginCheck(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginCheck");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_id());
			pstmt.setString(2, reqMember.getM_pwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				
				loginUser.setM_no(rset.getInt("M_NO"));
				loginUser.setM_id(rset.getString("M_ID"));
				loginUser.setM_pwd(rset.getString("M_PWD"));
				loginUser.setM_name(rset.getString("M_NAME"));
				loginUser.setM_email(rset.getString("M_EMAIL"));
				loginUser.setM_profile(rset.getString("M_PROFILE"));
				loginUser.setM_point(rset.getInt("M_POINT"));
				loginUser.setM_storage(rset.getInt("M_STORAGE"));
				loginUser.setM_question(rset.getString("M_QUESTION"));
				loginUser.setM_answer(rset.getString("M_ANSWER"));
				loginUser.setM_date(rset.getDate("M_DATE"));
				loginUser.setM_black_status(rset.getString("M_BLACK_STATUS"));
				loginUser.setM_stop_status(rset.getString("M_STOP_STATUS"));
				loginUser.setM_out_status(rset.getString("M_OUT_STATUS"));
				loginUser.setM_out_date(rset.getDate("M_OUT_DATE"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginUser;
	}
	
	
	//로그인 했을 시 프로필 사진 select
	public Member profileChcek(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member profile = null;
		
		String query = prop.getProperty("profileChcek"); 
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqMember.getM_no());
			
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				while(rset.next()) {
					profile = new Member();
					
					profile.setA_change_Name(rset.getString("A_CHANGE_NAME"));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return profile;
	}

	//회원 가입용 메소드
	public int insertMember(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_id());
			pstmt.setString(2, reqMember.getM_pwd());
			pstmt.setString(3, reqMember.getM_name());
			pstmt.setString(4, reqMember.getM_email());
			pstmt.setString(5, "즐거운 유럽여행 되세요 ^0^");
			pstmt.setString(6, reqMember.getM_question());
			pstmt.setString(7, reqMember.getM_answer());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	
	//회원정보 수정용 메소드
	public int updateMember(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_pwd());
			pstmt.setString(2, reqMember.getM_email());
			pstmt.setString(3, reqMember.getM_name());
			pstmt.setString(4, reqMember.getM_id());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//회원 가입 시 아이디 중복확인 메소드
	public int idCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		try {
			pstmt = con.prepareStatement(query);//내가 입력한 아이디가 DB에 몇개 있는지 수를 세는 쿼리문
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();	//쿼리문의 결과를 rset에 넣어주고
			
			if(rset.next()) {
				result = rset.getInt(1);	//???
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);		
			close(rset);
		}
		
		
		return result;
	}

	//회원 아이디 찾기
	public Member memberIdSearch(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("memberIdSearch");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getM_question());
			pstmt.setString(2, reqMember.getM_answer());
			pstmt.setString(3, reqMember.getM_email());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
		
				loginUser.setM_id(rset.getString("M_ID"));
				loginUser.setM_question(rset.getString("M_QUESTION"));
				loginUser.setM_answer(rset.getString("M_ANSWER"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return loginUser;
	}

	//임시비밀번호 발급 후 DB에서 바꿔주기
	public int newpass(Connection con, String randomCode, String userId, String userEmailPass) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("newPass");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, randomCode);
			pstmt.setString(2, userId);
			pstmt.setString(3, userEmailPass);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	public HashMap<String, Object> updateSetProfile(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Attachment a = null;
		Member m = null;
		
		
		return hmap;
	}
		
	
	// 회원 소개글 수정 update 
	public int updateOldProfile(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateOldProfile");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getM_profile());
			pstmt.setInt(2, m.getM_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 회원 이전 프로필 사진 delete
	public int deleteOldAttach(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		Attachment at = fileList.get(0);
		int result = 0;
		
		String query = prop.getProperty("deleteOldAttach");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, at.getAnno());
			pstmt.setString(2, at.getaType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 새로운 회원 프로필 사진 insert 
	public int insertNewAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		Attachment at = fileList.get(0);
		int result = 0;
		
		String query = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, at.getaType());
			pstmt.setInt(5, at.getAnno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 회원번호로 회원 정보 가져오기 
	public Member selectLoginUser(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member resultM = null;
		
		String query = prop.getProperty("selectLoginUser");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getM_no());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				resultM = new Member();
				
				resultM.setM_no(rset.getInt("M_NO"));
				resultM.setM_id(rset.getString("M_ID"));
				resultM.setM_pwd(rset.getString("M_PWD"));
				resultM.setM_name(rset.getString("M_NAME"));
				resultM.setM_email(rset.getString("M_EMAIL"));
				resultM.setM_profile(rset.getString("M_PROFILE"));
				resultM.setM_point(rset.getInt("M_POINT"));
				resultM.setM_storage(rset.getInt("M_STORAGE"));
				resultM.setM_question(rset.getString("M_QUESTION"));
				resultM.setM_answer(rset.getString("M_ANSWER"));
				resultM.setM_date(rset.getDate("M_DATE"));
				resultM.setM_black_status(rset.getString("M_BLACK_STATUS"));
				resultM.setM_stop_status(rset.getString("M_STOP_STATUS"));
				resultM.setM_out_status(rset.getString("M_OUT_STATUS"));
				resultM.setM_out_date(rset.getDate("M_OUT_DATE"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return resultM;
	}

	public int planNum(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int num = -1;

		String query = prop.getProperty("getPlanNum");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqMember.getM_no());
			
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				while(rset.next()) {
					num = rset.getInt("CNT");
				}
			}
			System.out.println("dao 플랜 개수 " + num);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return num;
	}

	//회원 스스로 탈퇴
	public int userDelete(Connection con, int m_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("userDelete");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m_no);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertSnsUser(Connection con, String name, String email, String password) {
		PreparedStatement pstmt = null;
		int result = 0;
		String user = "이름을 설정해주세요.";
		String query = prop.getProperty("insertSnsUser");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, "안녕하세요. 행복한 유럽여행 다녀올게요.");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member memberPwdSearchEmailCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
				
		String query = prop.getProperty("memberIdSearchEmailCheck");	
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				
				loginUser.setM_email(rset.getString("M_EMAIL"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginUser;
	}
	
	




	

}
