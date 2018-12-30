package com.kh.et.manager.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.getConnection;
import static com.kh.et.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	//최대포인트회원, 200포인트이상회원
	public int[] selectPoint() {
		Connection con = getConnection();
		
		int[] arr = new int[2];
		int max_point = new ManagerDao().selectMaxPoint(con);
		int max_count_member = new ManagerDao().selectCountMember(con);
		
		arr[0] = max_point;
		arr[1] = max_count_member;
		
		close(con);
		
		return arr;
	}

	//블랙회원 조회
	public ArrayList<Member> selectBlackList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list= new ManagerDao().selectBlackList(con,currentPage,limit);
		
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);
		
		return list;
	}

	//정지회원조회
	public ArrayList<Member> selectStopList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list= new ManagerDao().selectStopList(con,currentPage,limit);
		
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);
		
		return list;
	}

}
