package com.kh.et.point.model.service;

import java.sql.Connection;

import com.kh.et.member.model.dao.MemberDao;
import com.kh.et.member.model.vo.Member;
import com.kh.et.point.model.dao.PointDao;
import com.kh.et.point.model.vo.Point;
import com.kh.et.tourBoard.model.dao.TourBoardDao;
import static com.kh.et.common.JDBCTemplate.*;

public class PointService {

	public Member insertPoint(int pmNo, int pFkpNo,Member m) {
		Connection con = getConnection();
		int result=0;
		

		int result1 = new PointDao().insertPoint(con, pmNo, pFkpNo);
		System.out.println("service1");

		int result2 = new PointDao().updatePlanPrivate(con,pFkpNo);
		System.out.println("service2");
	
		int result3 = new PointDao().updateMemberPoint(con,pmNo);
		System.out.println("service3");
		
		Member loginUser = null;
		if(result1>0 && result2>0 && result3>0) {
			loginUser = new MemberDao().selectLoginUser(con, m);
			if(loginUser != null) {
				Member profile = new MemberDao().profileChcek(con, m);
				if(profile != null) {
					loginUser.setA_change_Name("/et/profileUpload/"+profile.getA_change_Name());
				} else {
					loginUser.setA_change_Name("/et/image/common/logo_c.png");
				}
			}
		}else {
			rollback(con);
		}
		close(con);
		
		return loginUser;
	}


}
