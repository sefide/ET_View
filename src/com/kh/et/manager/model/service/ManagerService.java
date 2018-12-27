package com.kh.et.manager.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.et.manager.model.dao.ManagerDao;
import com.kh.et.manager.model.vo.Manager;

public class ManagerService {

	// 관리자 로그인 메소드
	public Manager managerLogin(Manager reqMember) {
		Connection con = getConnection();

		Manager loginManager = new ManagerDao().managerLogin(con, reqMember);

		close(con);
		
		//System.out.println("매니저 로그인 : "+loginManager);

		return loginManager;

	}

}
