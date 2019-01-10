package com.kh.et.plan.model.service;

import static com.kh.et.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.et.board.model.dao.BoardDao;
import com.kh.et.member.model.vo.Member;
import com.kh.et.plan.model.dao.PlanDao;
import com.kh.et.plan.model.vo.City;
import com.kh.et.plan.model.vo.Plan;
import com.kh.et.plan.model.vo.PlanDetail;
import com.kh.et.plan.model.vo.PlanInterest;

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
		
		close(con);
		
		return resultMap;
	}

	// 플랜 상세정보 뽑아오기 
	public HashMap<String, Object> selectPlanDetail(int planNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> resultMap = new PlanDao().selectPlanDetail(con, planNo);
		
		int like = 0;
		int scrap = 0;
		if(resultMap != null) {
			Plan plan = (Plan) resultMap.get("plan");
			like = new PlanDao().getLikeNum(con, planNo);
			scrap = new PlanDao().getScrapNum(con, planNo);
			resultMap.put("like", like);
			resultMap.put("scrap", scrap);
			commit(con);
		}
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
	
	//플랜 엿보기 - 인기플랜 조회
	public HashMap<String, Object> selectBestPlan() {
		Connection con = getConnection();
		
		System.out.println("selectBestPlan의 Service인걸?");
		
		HashMap<String, Object> bestPlanMap = new PlanDao().selectBestPlan(con);
		HashMap<String, City> bestCityMap = new PlanDao().selectBestMap(con);
		
		
		
		if(bestPlanMap != null && bestCityMap != null) {
			bestPlanMap.put("bestCityMap", bestCityMap); 
			commit(con);
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		return bestPlanMap;
	}

	
	//플랜 엿보기 - 모든플랜 조회
	public HashMap<String, Object> selectnormalPlan(int currentPage, int limit) {
		Connection con = getConnection();
		
		System.out.println("normalPlan의 Service인걸?");
		
		HashMap<String, Object> normalPlanMap = new PlanDao().selectNormalPlan(con, currentPage, limit);
		System.out.println("service 의 normalPlanMap"+normalPlanMap);
		
		HashMap<String, City> normalCityMap = new PlanDao().selectNormalMap(con);
		
		
		if(normalPlanMap != null && normalCityMap != null) {
			normalPlanMap.put("normalCityMap", normalCityMap); 		
			commit(con);
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		return normalPlanMap;
	}
	
	
	public int updatePlanPrivate(int pmNo, int pFkpNo) {
		Connection con = getConnection();
		
		int result = new PlanDao().updatePlanPrivate(con, pmNo, pFkpNo);
		
		if(result>0) {
			commit(con);		
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	
	//전체 플랜 개수 조회
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new PlanDao().getListCount(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return listCount;
	}
	
	//좋아요 눌렀을때 --> 최종
	public int clickLike(PlanInterest pl, String likeStatus) {
		Connection con = getConnection();

		//int result = 0 으로 선언
		int result1 = 0;
		System.out.println("서비스에도 들어왔옹");
		
		if(likeStatus.equals("X")) { // 좋아요 누른 기록이 없음으로 insert 해줘야 함
			System.out.println("service status:"+likeStatus);
			result1 = new PlanDao().insertLike(con,pl);
			int result2 = new PlanDao().insertPlanLikePoint(con,pl);
			int result3 = new PlanDao().updataPlanClickedMember(con,pl);
			int result4 = new PlanDao().updatePlanLickeClicKMember(con,pl);
			if(result1 > 0 && result2 >0 && result3>0 && result4 > 0) {
				commit(con);
			}else {
				rollback(con);
			}	
			
		}else if(likeStatus.equals("N")) { // likeStatus == "N" 좋아요 했다가 취소한거니까 update->Y
			System.out.println("service status:"+likeStatus);
			result1 =  new PlanDao().updateLike(con,pl);
			if(result1 > 0) {commit(con);}
			else {rollback(con);}		
			
		}else {  // likeStatus == "Y" 좋아요 눌린거를 취소하는거 update->N
			System.out.println("service status:"+likeStatus);
			result1 = new PlanDao().updateUnLike(con,pl);
			if(result1 > 0) {commit(con);}
			else {rollback(con);}
		
		}
		System.out.println("service에서 변화가 있낭"+result1);
		return result1;

	}
	///포인트 합류 끝
	
	
	
	//좋아요 갯수 구하기
	public int countLike(int pno) {
		Connection con = getConnection();
		
		int like = new PlanDao().getLikeNum(con, pno);
		
		if(like>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return like;
	}
	
	

	//내가 스크랩한 플랜 가져오기
	public HashMap<String, Object> scrapPlan(int mno) {
		Connection con = getConnection();
		
		//내가 스크랩한 플랜뽑기
		HashMap<String, Object> scrapPlan = new PlanDao().scrapPlan(con, mno);
		
		//플랜에 뿌려줄 도시 뽑기
		HashMap<String, City> scrapPlanCity = new PlanDao().scrapPlanCity(con);
		
		if(scrapPlan != null && scrapPlanCity != null) {
			scrapPlan.put("scrapPlanCity", scrapPlanCity);
			System.out.println("service - 도시 정보 넣었어,,, ");
			commit(con);
		}else {
			rollback(con);
		}
		
		return scrapPlan;
	}
	
	//스크랩 클릭시 
	public int clickScrap(PlanInterest pl, String scrapStatus) {
		Connection con = getConnection();
		
		int result = 0;
		System.out.println("서비스에도 들어왔옹");
		
		if(scrapStatus.equals("X")) { // 스크랩 누른 기록이 없음으로 insert 해줘야 함
			System.out.println("service Scrapestatus:"+scrapStatus);
			result = new PlanDao().insertScrap(con,pl);			
			if(result > 0 ) {
				commit(con);
			}else {
				rollback(con);
			}					
		}else {  // Y 이면 그냥 리턴..
			result = 1;
		}
		return result;
	}
	
	//스크랩 수 구하기
	public int countScrap(int pno) {
		Connection con = getConnection();
		
		int scrap = new PlanDao().getScrapNum(con, pno);
		
		if(scrap>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return scrap;
	}
	
	
	//플랜 좋아요상태 가져오기
	public String getLikeStatus(int pno, int user) {
		Connection con = getConnection();
		
		String likeStatus = new PlanDao().getLikeStatus(con,pno,user);
		
		if(likeStatus.equals("Y")) {
			likeStatus="Y";
			commit(con);
		}else if(likeStatus.equals("N")){
			likeStatus="N";
			commit(con);
		}else {
			likeStatus="X";
			commit(con);
		}
		close(con);
		
		System.out.println("Service에서 오는 likeStatus 값:"+likeStatus);
		return likeStatus;
	}
	
	//플랜 스크랩 상태 가져오기
	public String getScrapStatus(int pno, int user) {
		Connection con = getConnection();
		
		String scrapStatus = new PlanDao().getScrapStatus(con,pno,user);
		
		if(scrapStatus.equals("Y")) { // 스크랩 했을때
			scrapStatus="Y";
			commit(con);
		}else { //스크랩  안 했을 때
			scrapStatus="X";
			commit(con);
		}
		close(con);
		
		System.out.println("Service에서 오는 likeStatus 값:"+scrapStatus);
		return scrapStatus;
	}
	

	//내가 스크랩한 플랜 전체 갯수 가져오기
	public int getScrapPlanListCount(int mno) {
		Connection con = getConnection();
		
		//전체 갯수니까
		int scrapPlanListCount = new PlanDao().getScrapPlanListCount(con, mno);
		
		if(scrapPlanListCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		return scrapPlanListCount;
	}

	//내가 스크랩한 플랜 전체 페이징 처리 후 조회
	public ArrayList<HashMap<String, Object>> scrapPlanList(int currentPage, int limit, int mno) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> scrapPlanList = new PlanDao().scrapPlanList(con, currentPage, limit, mno);
		
		if(scrapPlanList != null) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);
		
		return scrapPlanList;
	}

	//내가 스크랩한 모든 플랜보기
	public HashMap<String, Object> allScrapPlan(int mno, int currentPage, int limit) {
		Connection con = getConnection();
		
		HashMap<String, Object> allScrapPlan = new PlanDao().allScrapPlan(con, mno, currentPage, limit);
		
		HashMap<String, City> allScrapPlanCity = new PlanDao().allScrapPlanCity(con);
		
		if(allScrapPlan != null & allScrapPlanCity != null) {
			allScrapPlan.put("allScrapPlanCity", allScrapPlanCity);
			commit(con);
		}else {
			rollback(con);
		}
		return allScrapPlan;
	}

	/*//내가 스크랩한 모든 플랜보기
	public HashMap<String, Object> allScrapPlan(int mno) {
		Connection con = getConnection();
		
		HashMap<String, Object> allScrapPlan = new PlanDao().allScrapPlan(con, mno);
		
		HashMap<String, City> allScrapPlanCity = new PlanDao().allScrapPlanCity(con);
		
		if(allScrapPlan != null & allScrapPlanCity != null) {
			allScrapPlan.put("allScrapPlanCity", allScrapPlanCity);
			commit(con);
		}else {
			rollback(con);
		}
		return allScrapPlan;
	}*/
	
	

	


}
