package com.kh.et.plan.model.dao;

import static com.kh.et.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import com.kh.et.plan.model.vo.City;
import com.kh.et.plan.model.vo.Plan;
import com.kh.et.plan.model.vo.PlanDetail;
import com.kh.et.member.model.vo.News;
import com.kh.et.plan.model.dao.PlanDao;

public class PlanDao {
	private Properties prop = new Properties();
	int i = 0;
	public PlanDao() {
		String fileName = PlanDao.class.getResource("/sql/plan/plan-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 도시 정보 뽑아오기 
	public ArrayList<City> selectCityList(Connection con) { // 순서지켜서 정보(City) 뽑기 
		ArrayList<City> cityList = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCityList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			cityList = new ArrayList<City>();
			
			while(rset.next()) {
				City ct = new City();
				
				ct.setCtNo(rset.getInt("CT_NO"));
				ct.setCtName(rset.getString("CT_NAME"));
				ct.setCtCountry(rset.getString("CT_COUNTRY"));
				ct.setCtInfo(rset.getString("CT_INFO"));
				ct.setCtLat(rset.getFloat("CT_LAT"));
				ct.setCtLng(rset.getFloat("CT_LNG"));
				
				cityList.add(ct);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return cityList;
	}

	// 플랜 테이블에 저장 
	public int insertPlan(Connection con, Plan reqPlan) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPlan");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqPlan.getpWriter());
			pstmt.setString(2, reqPlan.getpTitle());
			pstmt.setDate(3, reqPlan.getpStartDate());
			pstmt.setDate(4, reqPlan.getpEndDate());
			pstmt.setString(5, reqPlan.getpCites());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 현재 플랜테이블 시퀀스값 구하기 
	public int selectPlanCurrval(Connection con) {
		int planNo = -1;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPlanCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				planNo = rset.getInt("CURRVAL");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return planNo;
	}

	// 플랜 디테일 저장 
	public int insertPlanDetail(Connection con, ArrayList<PlanDetail> planDetailList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertPlanDetail");
		
		try {
			for(int i = 0; i < planDetailList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, planDetailList.get(i).getPdpNo());
				pstmt.setInt(2, Integer.parseInt(planDetailList.get(i).getPdStartcity()));
				pstmt.setDate(3, planDetailList.get(i).getPdStartDate());
				pstmt.setInt(4, Integer.parseInt(planDetailList.get(i).getPdEndCity()));
				pstmt.setDate(5, planDetailList.get(i).getPdEndDate());
				pstmt.setString(6, planDetailList.get(i).getPdTrasnfer());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Plan> selectPlanList(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Plan> list = null;
		
		String query = prop.getProperty("selectPlanList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Plan>();
			while(rset.next()) {
				Plan plan = new Plan();
				plan.setpNo(rset.getInt("P_NO"));
				plan.setpWriter(rset.getInt("P_N_NO"));
				plan.setpTitle(rset.getString("P_TITLE"));
				plan.setpDate(rset.getDate("P_DATE"));
				plan.setpStartDate(rset.getDate("P_START_DATE"));
				plan.setpEndDate(rset.getDate("P_END_DATE"));
				plan.setpCites(rset.getString("P_CITYS"));
				plan.setpPrivate(rset.getString("P_PRIVATE"));
				
				list.add(plan);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	// 도시 정보 뽑아오기 
	public HashMap<String, City> selectCityMap(Connection con) { //  도시이름, 도시정보(City)
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, City> resultMap = null;
		
		String query = prop.getProperty("selectCityList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			resultMap = new HashMap<String, City>();
			while(rset.next()) {
				City ct = new City();
				
				ct.setCtNo(rset.getInt("CT_NO"));
				ct.setCtName(rset.getString("CT_NAME"));
				ct.setCtCountry(rset.getString("CT_COUNTRY"));
				ct.setCtInfo(rset.getString("CT_INFO"));
				ct.setCtLat(rset.getFloat("CT_LAT"));
				ct.setCtLng(rset.getFloat("CT_LNG"));
				
				resultMap.put(String.valueOf(ct.getCtName()), ct);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return resultMap;
	}

	// 도시 상세정보 뽑아오기 
	public HashMap<String, Object> selectPlanDetail(Connection con, int planNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> resultMap = null;
		Plan p = null;
		PlanDetail pd = null;
		ArrayList<PlanDetail> pdList = null;
		
		String query = prop.getProperty("selectPlanDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, planNo);
			
			rset = pstmt.executeQuery();
			
			pdList = new ArrayList<PlanDetail>();
			
			while(rset.next()) {
				p = new Plan();
				p.setpNo(rset.getInt("P_NO"));
				p.setpWriter(rset.getInt("P_N_NO"));
				p.setpTitle(rset.getString("P_TITLE"));
				p.setpDate(rset.getDate("P_DATE"));
				p.setpStartDate(rset.getDate("P_START_DATE"));
				p.setpEndDate(rset.getDate("P_END_DATE"));
				p.setpCites(rset.getString("P_CITYS"));
				p.setpPrivate(rset.getString("P_PRIVATE"));
				
				pd = new PlanDetail();
				pd.setPdNo(rset.getInt("PD_NO"));
				pd.setPdStartcity(rset.getString("PD_START_CITY"));
				pd.setPdStartDate(rset.getDate("PD_START_DATE"));
				pd.setPdEndCity(rset.getString("PD_END_CITY"));
				pd.setPdEndDate(rset.getDate("PD_END_DATE"));
				pd.setPdTrasnfer(rset.getString("PD_TRANSFER"));
				
				pdList.add(pd);
			}
			resultMap = new HashMap<String, Object>();
			resultMap.put("plan", p);
			resultMap.put("planDetailList", pdList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return resultMap;
	}

	// 플랜 수정 
	public int updatePlan(Connection con, Plan reqPlan) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePlan");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqPlan.getpTitle());
			pstmt.setDate(2, reqPlan.getpStartDate());
			pstmt.setDate(3, reqPlan.getpEndDate());
			pstmt.setString(4, reqPlan.getpCites());
			pstmt.setInt(5, reqPlan.getpNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 플랜 수정하면서 이전에 저장된 플랜 디테일 삭제 -> 상태 N으로 update
	public int updatePlanDetailStatusN(Connection con, Plan reqPlan) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePlanDetailStatusN");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqPlan.getpNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 플랜 삭제 -> 상태 N으로 update
	public int deletePlan(Connection con, int planNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("deletePlan");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, planNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 인기 플랜 top3 select 
	public HashMap<String, Object> selectTopPlan(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> pm = null;
		ArrayList<Plan> list = null;
		
		String query = prop.getProperty("selectTopPlan");
			try {
		    String pType = "좋아요";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pType);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Plan>();
			pm = new HashMap<String, Object>();
			while(rset.next()) {
				Plan p = new Plan();
				
				p.setpNo(rset.getInt("PI_P_NO"));
				p.setpTitle(rset.getString("P_TITLE"));
				p.setpCites(rset.getString("P_CITYS"));
				p.setpLike(rset.getInt("CNT"));
				
				list.add(p);
			}
			pm.put("planList", list);
			// pm :  key - 인기 순위 order / value - 해당 플랜정보 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return pm;
	}

	// 인기 도시 top 3 select 
	public ArrayList<City> selectTopCity(Connection con) {
		ArrayList<City> cityList = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectTopCity");
		
		try {
			stmt = con.createStatement();
			
			rset  = stmt.executeQuery(query);
			
			cityList = new ArrayList<City>();
			while(rset.next()) {
				City c = new City();
				c.setCtName(rset.getString("CITY"));
				c.setCtInfo(rset.getString("CT_INFO"));
				c.setCtCountry(rset.getString("CT_COUNTRY"));
				c.setCtStar(rset.getFloat("STAR"));
				
				cityList.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
	
		return cityList;
	}

	//인기 플랜 select - 플랜 엿보기 페이지
	public HashMap<String, Object> selectBestPlan(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> pm = null;
		ArrayList<Plan> list = null;
		
		String query = prop.getProperty("selectBestPlan");
		//selectBestPlan=SELECT ROWNUM, PI_P_NO, P_TITLE, P_CITYS, CNT FROM (SELECT PI_P_NO,  P_TITLE, P_CITYS, COUNT(PI_P_NO) CNT FROM (SELECT PI.PI_P_NO, P.P_TITLE, P_CITYS FROM PLANINTEREST PI JOIN PLAN P ON (PI.PI_P_NO = P.P_NO) WHERE PI.PI_TYPE = ? AND P.P_STATUS = 'Y' AND P.P_PRIVATE = 'Y') GROUP BY PI_P_NO, P_TITLE, P_CITYS ORDER BY COUNT(PI_P_NO) DESC) WHERE ROWNUM BETWEEN 1 AND 3
		
		try {
		    String pType = "좋아요";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pType);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Plan>();
			pm = new HashMap<String, Object>();
			while(rset.next()) {
				Plan p = new Plan();
				
				p.setpNo(rset.getInt("PI_P_NO"));
				p.setpTitle(rset.getString("P_TITLE"));
				p.setpCites(rset.getString("P_CITYS"));
				p.setpLike(rset.getInt("CNT"));
				
				list.add(p);
			}
			pm.put("planList", list);
			// pm :  key - 인기 순위 order / value - 해당 플랜정보 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return pm;
	}

	public HashMap<String, City> selectBestMap(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, City> resultMap = null;
		
		String query = prop.getProperty("selectCityList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			resultMap = new HashMap<String, City>();
			while(rset.next()) {
				City ct = new City();
				
				ct.setCtNo(rset.getInt("CT_NO"));
				ct.setCtName(rset.getString("CT_NAME"));
				ct.setCtCountry(rset.getString("CT_COUNTRY"));
				ct.setCtInfo(rset.getString("CT_INFO"));
				ct.setCtLat(rset.getFloat("CT_LAT"));
				ct.setCtLng(rset.getFloat("CT_LNG"));
				
				resultMap.put(String.valueOf(ct.getCtName()), ct);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return resultMap;
	}

	//내소식 보기 플랜
	public News selectMyNewsPlan(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		News n = null;
		
		String query = prop.getProperty("selectMyNewsPlan");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new News();
				System.out.println("다오 - 풀랜있어요 ");
				n.setTitle(rset.getString("P_TITLE"));
				n.setName(rset.getString("M_NAME"));
				n.setType(rset.getString("PI_TYPE"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return n;
	}

	// 해당 플랜 좋아요 개수 
	public int getLikeNum(Connection con, int pno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		 
		String query = prop.getProperty("getLikeNum");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno);
			pstmt.setString(2, "좋아요");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("CNT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int getScrapNum(Connection con, int pno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		 
		String query = prop.getProperty("getScrapNum");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno);
			pstmt.setString(2, "스크랩");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("CNT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	

}
