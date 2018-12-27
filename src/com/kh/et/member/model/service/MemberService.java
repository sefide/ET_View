package com.kh.et.member.model.service;

import static com.kh.et.common.JDBCTemplate.*;



import java.sql.Connection;

import com.kh.et.member.model.dao.MemberDao;
import com.kh.et.member.model.vo.Member;


public class MemberService {

	//일반 회원 로그인 체크용 메소드
	public Member loginCheck(Member reqMember) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, reqMember);
		
		close(con);
		
		return loginUser;
		
	}

	//일반회원 회원가입용 메소드
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



}
