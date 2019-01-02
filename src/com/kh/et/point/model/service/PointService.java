package com.kh.et.point.model.service;

import static com.kh.et.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.et.point.model.dao.PointDao;
import com.kh.et.point.model.vo.Point;
import com.kh.et.tourBoard.model.dao.TourBoardDao;
import static com.kh.et.common.JDBCTemplate.*;

public class PointService {

	public int insertPoint(int pmNo, int pFkpNo) {
		Connection con = getConnection();
		int result=0;
		

		int result1 = new PointDao().insertPoint(con, pmNo, pFkpNo);
		System.out.println("service1");

		int result2 = new PointDao().updatePlanPrivate(con,pFkpNo);
		System.out.println("service2");
	
		int result3 = new PointDao().updateMemberPoint(con,pmNo);
		System.out.println("service3");
	
		if(result1>0 && result2>0 && result3>0) {
			commit(con);
			result=1;
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}


}
