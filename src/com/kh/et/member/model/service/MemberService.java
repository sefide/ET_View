package com.kh.et.member.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.commit;
import static com.kh.et.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.et.member.model.dao.MemberDao;
import com.kh.et.member.model.vo.MemberManagerCompany;
import com.kh.et.member.model.vo.MemberNormal;

public class MemberService {

	//일반 회원 로그인 체크용 메소드
	public MemberNormal loginCheck(MemberNormal reqMember) {
		Connection con = getConnection();
		
		MemberNormal loginUser = new MemberDao().loginCheck(con, reqMember);
		
		close(con);
		
		return loginUser;
		
	}

	//일반 회원 회원가입용 메소드
	public int insertMember(MemberNormal reqMember) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con, reqMember);
		
		int finalResult = 0;
		
		if(result > 0) {//성공하면
			commit(con);		//커밋하고
			int mNo = new MemberDao().selectMemberNo(con,reqMember);	//회원아이디를 통해 회원번호를 가져와라
			finalResult = new MemberDao().insertMemberPlus(con, reqMember, mNo);	//가져온 회원번호를 이용해 회원가입 마무리하기
		}
		
		close(con);
		
		return finalResult;
	}

	//관리자 로그인 메소드
	public MemberManagerCompany managerLogin(MemberManagerCompany reqMember) {
		Connection con = getConnection();
		
		MemberManagerCompany loginManager = new MemberDao().managerLogin(con, reqMember);
		
		close(con);
		
		
		return loginManager;
	}

	//제휴사 로그인 메소드
	public MemberManagerCompany companyLogin(MemberManagerCompany reqMember) {
		Connection con = getConnection();
		
		MemberManagerCompany loginCompany = new MemberDao().companyLogin(con, reqMember);
		
		close(con);
		
		return loginCompany;
	}

	

}
