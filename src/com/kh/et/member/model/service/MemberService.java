package com.kh.et.member.model.service;

import static com.kh.et.common.JDBCTemplate.*;



import java.sql.Connection;

import com.kh.et.member.model.dao.MemberDao;
import com.kh.et.member.model.vo.Member;


public class MemberService {

	//회원 로그인 체크용 메소드
	public Member loginCheck(Member reqMember) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, reqMember);
		
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



}
