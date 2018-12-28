package com.kh.et.plan.model.service;

import static com.kh.et.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.et.plan.model.dao.PlanDao;
import com.kh.et.plan.model.vo.City;
import com.kh.et.plan.model.vo.Plan;
import com.kh.et.plan.model.vo.PlanDetail;

public class PlanService {

	public ArrayList<City> selectCityList() {
		Connection con = getConnection();
		
		ArrayList<City> cityList = new PlanDao().selectCityList(con);	
		
		if(cityList != null) commit(con);
		else rollback(con);
		
		close(con);
		int i = 0;
		return cityList;
	}

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

	public ArrayList<Plan> selectPlanList(int mno) {
		Connection con = getConnection();
		ArrayList<Plan> list = new PlanDao().selectPlanList(con, mno);
		
		if(list != null) commit(con);
		else rollback(con);
		
		close(con);
		
		return list;
	}

}
