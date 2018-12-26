package com.kh.et.plan.model.dao;

import static com.kh.et.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import com.kh.et.plan.model.vo.City;
import com.kh.et.plan.model.dao.PlanDao;

public class PlanDao {
	private Properties prop = new Properties();
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

}
