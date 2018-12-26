package com.kh.et.plan.model.service;

import static com.kh.et.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.et.plan.model.dao.PlanDao;
import com.kh.et.plan.model.vo.City;

public class PlanService {

	public ArrayList<City> selectCityList() {
		Connection con = getConnection();
		
		ArrayList<City> cityList = new PlanDao().selectCityList(con);	
		
		if(cityList != null) commit(con);
		else rollback(con);
		
		close(con);
		
		return cityList;
	}

}
