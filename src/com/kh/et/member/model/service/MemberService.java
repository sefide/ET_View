package com.kh.et.member.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.commit;
import static com.kh.et.common.JDBCTemplate.getConnection;
import static com.kh.et.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

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
			if(profile != null) {
				loginUser.setA_change_Name("/et/profileUpload/"+profile.getA_change_Name());
			} else {
				loginUser.setA_change_Name("/et/image/common/logo_c.png");
			}
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

	// 회원 기본 사진 불러오기..
//	public HashMap<String, Object> updateSetProfile(int mno) {
//		Connection con = getConnection();
//		HashMap<String, Object> hmap = null;
//		
//		// 이전에 저장한 회원의 프로필을 지우고 
//		int deleteOldAttachment = new MemberDao().deleteProfileAttach(con, mno);
//		
//		// 잘 지워졌으면 추가 및 삭제한당 .
//		if(deleteOldAttachment > 0) {
//			hmap = new MemberDao().updateSetProfile(con, mno);
//		}
//		
//		
//		return hmap;
//	}

	
	public Member updateProfile(Member m, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		// 1. 멤버 테이블에서 프로필 소개글을 수정하고 
		int updateOldProfile = new MemberDao().updateOldProfile(con,m);
		
		if(updateOldProfile > 0) {
			for(int i = 0; i <fileList.size(); i++) {
				fileList.get(i).setAnno(m.getM_no()); 
			}
		}
		
		// 2. 이전에 저장한 회원의 프로필을 지우고 
		int deleteOldAttachment = new MemberDao().deleteOldAttach(con, fileList);
				
		// 잘 지워졌으면 
		// 3. Attachment에 새로운 프로필 사진 추가.
		int insertNewAttachment = new MemberDao().insertNewAttachment(con, fileList);
		
		// 수정하자 ******************************************************************************
		// 4. 추가 후 바뀐 회원 정보 가져오기 
		Member loginUser = null;
		if(deleteOldAttachment > 0 && insertNewAttachment > 0) {
			loginUser = new MemberDao().selectLoginUser(con, m);
			if(loginUser != null) {
				commit(con);
				Member profile = new MemberDao().profileChcek(con, m);
				if(profile != null) {
					loginUser.setA_change_Name("/et/profileUpload/"+profile.getA_change_Name());
				} else {
					loginUser.setA_change_Name("/et/image/common/logo_c.png");
				}
			}
		}
		
		close(con);
		return loginUser;
	}


	public int userDelete(int m_no) {
		Connection con = getConnection();
		
		int result = new MemberDao().userDelete(con, m_no);
		
		close(con);
		
		return result;
	}



}
