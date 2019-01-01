package com.kh.et.member.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.commit;
import static com.kh.et.common.JDBCTemplate.getConnection;
import static com.kh.et.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.et.member.model.dao.MemberDao;
import com.kh.et.member.model.vo.Member;
import com.kh.et.tourBoard.model.vo.Attachment;


public class MemberService {

	//회원 로그인 체크용 메소드
	public Member loginCheck(Member reqMember) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, reqMember);
		
		if(loginUser != null) {
			commit(con);
			Member profile = new MemberDao().profileChcek(con, reqMember);
			//loginUser.setA_change_Name(profile.getA_change_Name());
		}
		
		close(con);
		
		return loginUser;
		
	}

	//회원가입용 메소드
	public int insertMember(Member reqMember) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, reqMember);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	
	//회원 정보 수정용 메소드
	public int updateMember(Member reqMember) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateMember(con, reqMember);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	//회원가입 아이디 중복체크용 메소드
	public int idCheck(String userId) {
		Connection con = getConnection();
		
		int result = new MemberDao().idCheck(con, userId);
		
		close(con);
		
		
		return result;
	}

	//회원 아이디 찾기용 메소드
	public Member memberIdSearch(Member reqMember) {
		Connection con  = getConnection();
		
		Member loginUser = new MemberDao().memberIdSearch(con, reqMember);
		
		close(con);
		
		
		return loginUser;
	}

	//임시비밀번호 발급 후 DB에서 비밀번호 변경해주기
	public int newpass(String randomCode, String userId, String userEmailPass) {
		Connection con = getConnection();
		
		int result = new MemberDao().newpass(con, randomCode, userId, userEmailPass);
		
		close(con);
		
		return result;
	}



}
