package com.kh.et.manager.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.getConnection;
import static com.kh.et.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.et.manager.model.dao.ManagerDao;
import com.kh.et.manager.model.vo.Manager;
import com.kh.et.member.model.vo.Member;


public class ManagerService {

	// 관리자 로그인 메소드
	public Manager managerLogin(Manager reqMember) {
		Connection con = getConnection();
		Manager loginManager = new ManagerDao().managerLogin(con, reqMember);

		close(con);


		return loginManager;

	}

	//전체멤버수 구하기
	public int[] selectTotal() {
		Connection con = getConnection();
		
		int[] select = new int[3];
		
		int total_member = new ManagerDao().selectTotal(con); //전체회원수
		int new_member = new ManagerDao().selectNewMember(con);
		int out_member = new ManagerDao().selectOutMember(con);
		
	/*	System.out.println("total_member : "+total_member);
		System.out.println("new_member : "+new_member);
		System.out.println("out_member : "+out_member);*/
		
		select[0] = total_member;
		select[1] = new_member;
		select[2] = out_member;
		/*System.out.println("select[0] : "+select[0]);
		System.out.println("select[1] : "+select[1]);
		System.out.println("select[2] : "+select[2]);*/
		
		close(con);
		
		return select;
	}

	//전체회원수 조회
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getListCount(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return listCount;
	}

	//회원리스트 배열에 담기
	public ArrayList<Member> selectAllList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list= new ManagerDao().selectAllList(con,currentPage,limit);
		
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);
		
		return list;
	}

	public int[] total() {
		Connection con = getConnection();
		
		int[] total = new int[3];
		
		int totalBoard = new ManagerDao().totalBoard(con); 
		int todayBoard = new ManagerDao().todayBoard(con);
		int avgBoard = new ManagerDao().avgBoard(con);
		
	
		
		total[0] = totalBoard;
		total[1] = todayBoard;
		total[2] = avgBoard;
	
		
		close(con);
		
		return total;
	}

	public ArrayList<HashMap<String, Object>> selectPlan(int currentPage, int limit) {
		
		Connection con=getConnection();
		ArrayList<HashMap<String,Object>> list=new ManagerDao().selectPlan(con,currentPage,limit);
		
		close(con);
		
		
		return list;
	}

	public int getListCount1() {
		Connection con = getConnection();
		int listCount = new ManagerDao().getListCount1(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return listCount;
	}

}
