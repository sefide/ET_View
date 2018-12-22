package com.kh.et.member.model.service;

import static com.kh.et.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.et.member.model.dao.MemberDao;
import com.kh.et.member.model.vo.MemberNormal;

public class MemberService {

	public MemberNormal loginCheck(MemberNormal reqMember) {
		Connection con = getConnection();
		
		MemberNormal loginUser = new MemberDao().loginCheck(con, reqMember);
		
		close(con);
		
		return loginUser;
		
	}

	public int insertMember(MemberNormal reqMember) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con, reqMember);
		
		int finalResult = 0;
		
		if(result > 0) {
			commit(con);
			int mNo = new MemberDao().selectMemberNo(con,reqMember);
			finalResult = new MemberDao().insertMemberPlus(con, reqMember, mNo);
		}
		
		close(con);
		
		return finalResult;
	}

	

}
