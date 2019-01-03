package com.kh.et.tourBoard.model.service;

import java.sql.Connection;
import static com.kh.et.common.JDBCTemplate.*;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.et.board.model.dao.BoardDao;
import com.kh.et.company.model.vo.Company;
import com.kh.et.tourBoard.model.dao.TourBoardDao;
import com.kh.et.tourBoard.model.vo.Attachment;
import com.kh.et.tourBoard.model.vo.TourBoard;

public class TourBoardService {

	public int insertTourBoard(TourBoard tb, ArrayList<Attachment> fileList, Company loginUser) {
		
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new TourBoardDao().insertTourBoard(con, tb,loginUser);
		
		if(result1 > 0) {
			int tno  = new TourBoardDao().selectCurrval(con);
			
			for(int i=0; i < fileList.size();i++) {
				fileList.get(i).setAtno(tno);;
			}
		}
		int result2 = new TourBoardDao().insertAttachment(con, fileList);
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}


	public ArrayList<HashMap<String, Object>> selectList(int currentPage, int limit, Company loginUser) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new TourBoardDao().selectList(con, currentPage, limit,loginUser);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return list;
	}
	public int getListCount(Company loginUser) {
		Connection con = getConnection();
		
		int listCount = new TourBoardDao().getListCount(con,loginUser);
		if(listCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return listCount;
	}


	public ArrayList<HashMap<String, Object>> selectList2(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new TourBoardDao().selectList2(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	public int getListCount2() {
		Connection con = getConnection();
		
		int listCount = new TourBoardDao().getListCount2(con);
		close(con);
		
		return listCount;
	}

	// 인기 투어 select (시작페이지)
	public ArrayList<HashMap<String, Object>> selectTopTour() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> tourList = new TourBoardDao().selectTopTour(con);
		
		if(tourList != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return tourList;
	}
	
	// 도시별 관련 투어 select (플랜짜기)
	public ArrayList<HashMap<String, Object>> selectCityTourList(int cityNum) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> tourList = new TourBoardDao().selectCityTourList(con, cityNum);
		
		if(tourList != null) {
			commit(con);
			System.out.println("헹 service 성공 ");
		}else {
			rollback(con);
		}
		
		close(con);
		return tourList;
	}
	

}
