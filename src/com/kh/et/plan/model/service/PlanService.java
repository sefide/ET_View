package com.kh.et.plan.model.service;

import static com.kh.et.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.et.plan.model.dao.PlanDao;
import com.kh.et.plan.model.vo.City;
import com.kh.et.plan.model.vo.Plan;
import com.kh.et.plan.model.vo.PlanDetail;

public class PlanService {

	// 도시 리스트 가져오기 
	public ArrayList<City> selectCityList() {
		Connection con = getConnection();
		
		ArrayList<City> cityList = new PlanDao().selectCityList(con);	
		
		if(cityList != null) commit(con);
		else rollback(con);
		
		close(con);
		int i = 0;
		return cityList;
	}

	// 플랜 저장하기 
	public int insertPlan(Plan reqPlan, ArrayList<PlanDetail> planDetailList) {
		Connection con = getConnection();
		// 1. 플랜 저장하고 
		int resultPlanInsert = new PlanDao().insertPlan(con, reqPlan);
		int result = 0;
		
		// 2. 성공하면 플랜 번호 가져오고
		if(resultPlanInsert > 0) {
			int PlanNo = new PlanDao().selectPlanCurrval(con);
			System.out.println("플랜번호 : " + PlanNo);
		
			// 3. 번호 가져다가 플랜 디테일 객체에 넣어두고
			for(int i = 0; i < planDetailList.size(); i++) {
				planDetailList.get(i).setPdpNo(PlanNo);
			}
			
		}
		
		// 4. 플랜디테일을 저장한다. 얍 
		int resultPlanDetailInsert = new PlanDao().insertPlanDetail(con, planDetailList);
		
		if(resultPlanInsert > 0 && resultPlanDetailInsert > 0) {
			System.out.println("둘다 성공했어 ");
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		
		close(con);

		return result;
	}

	// 특정 회원 플랜 리스트 뽑아오기 
	public ArrayList<Plan> selectPlanList(int mno) {
		Connection con = getConnection();
		ArrayList<Plan> list = new PlanDao().selectPlanList(con, mno);
		
		if(list != null) commit(con);
		else rollback(con);
		
		close(con);
		
		return list;
	}

	// 도시 정보 뽑아오기 
	public HashMap<String, City> selectCityMap() {
		Connection con = getConnection();
		
		HashMap<String, City> resultMap = new PlanDao().selectCityMap(con);
		
		if(resultMap != null) commit(con);
		else rollback(con);
		
		commit(con);
		
		return resultMap;
	}

	// 플랜 상세정보 뽑아오기 
	public HashMap<String, Object> selectPlanDetail(int planNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> resultMap = new PlanDao().selectPlanDetail(con, planNo);
		
		if(resultMap != null) commit(con);
		else rollback(con);
		
		commit(con);
		
		return resultMap;
	}

	// 플랜 수정하기 
	public int updatePlan(Plan reqPlan, ArrayList<PlanDetail> planDetailList) {
		Connection con = getConnection();
		// 1. 플랜 수정하고
		int resultPlanUpdate = new PlanDao().updatePlan(con, reqPlan);
		int result = 0;
		
		// 2. 그 전에 저장 되었던 플랜 디테일 상태 N로 바꾸고
		int resultPlanDetailStatusN = new PlanDao().updatePlanDetailStatusN(con, reqPlan);
		
		for(int i = 0; i < planDetailList.size(); i++) {
			planDetailList.get(i).setPdpNo(reqPlan.getpNo());
		}
		// 3. 새로운 플랜 디테일을 추가한다. 
		int resultPlanDetailInsert = new PlanDao().insertPlanDetail(con, planDetailList);
		
		if(resultPlanUpdate > 0 && resultPlanDetailStatusN> 0 && resultPlanDetailInsert > 0) {
			System.out.println("셋 다 성공했어 ");
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	// 플랜 삭제하기 
	public int deletePlan(int planNo) {
		Connection con = getConnection();
		
		int result = new PlanDao().deletePlan(con, planNo);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	// 시작페이지 인기 플랜 가져오기 
	public HashMap<String, Object> selectTopPlan() {
		Connection con = getConnection();
		
		HashMap<String, Object> planMap = new PlanDao().selectTopPlan(con);
		
		HashMap<String, City> cityMap = new PlanDao().selectCityMap(con);
		
		
		if(planMap != null && cityMap != null) {
			planMap.put("cityMap", cityMap); 
			commit(con);
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		return planMap;
	}
	
	// 인기 도시 리스트 뽑아오기 (메인페이지)
	public ArrayList<City> selectTopCity() {
		Connection con = getConnection();
		
		ArrayList<City> cityList = new PlanDao().selectTopCity(con);
		
		if(cityList != null) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return cityList;
	}

}
