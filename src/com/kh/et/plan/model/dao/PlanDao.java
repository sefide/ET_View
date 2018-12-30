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

	
	public ArrayList<City> selectCityList(Connection con) {
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


	public HashMap<String, City> selectCityMap(Connection con) {
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
	

}
