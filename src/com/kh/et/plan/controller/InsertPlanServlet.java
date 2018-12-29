package com.kh.et.plan.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.Plan;
import com.kh.et.plan.model.vo.PlanDetail;

/**
 * Servlet implementation class InsertPlanServlet
 */
@WebServlet("/insertPlan.pl")
public class InsertPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pTitle = request.getParameter("title");
		String pWriter = request.getParameter("writerNo");
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		String[] cityNoArr = request.getParameterValues("cityNo");
		String[] cityNameArr = request.getParameterValues("cityName");
		String[] nights = request.getParameterValues("selectNight");
		String[] transform = request.getParameterValues("transform");
		String citiesName = String.join(", ", cityNameArr);
		
		java.sql.Date startDate = java.sql.Date.valueOf(sDate); // sql 여행 시작 날짜 
		java.sql.Date endDate = java.sql.Date.valueOf(eDate); // sql 여행 종료 날짜 
		
		Plan reqPlan = new Plan();
		reqPlan.setpTitle(pTitle);
		reqPlan.setpWriter(Integer.parseInt(pWriter));
		reqPlan.setpCites(citiesName);
		reqPlan.setpStartDate(startDate);
		reqPlan.setpEndDate(endDate);
		
		System.out.println("여행 도시 개수 " + cityNoArr.length);
		System.out.println("도시별 숙박 개수 " + nights.length);
		System.out.println("여행수단 개수 " + transform.length);
		
		// 여행 시작 날짜는 night[i]를 몇 번 더한 값 
		// 여행 시작 날짜를 기준으로 night[i]일 뒤의 값이 여행 종료날
		java.sql.Date cityStartDate;
		java.sql.Date cityEndDate;
		// 이를 java.sql.Date변수에 담아서 변수에 저장한다. 
		
		Calendar startCalendar = Calendar.getInstance();
		startCalendar.setTime(startDate); // 도시여행 첫 시작날짜 
		Calendar endCalendar = Calendar.getInstance();
		endCalendar.setTime(startDate); // 도시여행 종료날짜 
		
		ArrayList<PlanDetail> planDetailList = new ArrayList<PlanDetail>();
		for(int i = 0; i <  transform.length; i++) {
			PlanDetail reqPlanDetail = new PlanDetail();
			reqPlanDetail.setPdStartcity(cityNoArr[i]);
			reqPlanDetail.setPdEndCity(cityNoArr[i+1]);
			reqPlanDetail.setPdTrasnfer(transform[i]);
			
			// 도시 여행 시작/종료 날짜 지정 
			// 시작 날짜 
	        cityStartDate = new Date(startCalendar.getTimeInMillis());
	        
	        // 종료날짜 : 일단 더하고 시작 
	        endCalendar.add(Calendar.DATE, Integer.parseInt(nights[i])); 
	        cityEndDate = new Date(endCalendar.getTimeInMillis());
	        System.out.println(i + "번째 도시 여행 시작날짜 : " + cityStartDate.toString() +  "/ 종료날짜 : " + cityEndDate.toString());
	        
			reqPlanDetail.setPdStartDate(cityStartDate);
			reqPlanDetail.setPdEndDate(cityEndDate);
			
			planDetailList.add(reqPlanDetail);
			
			// startCalendar + nights[i]
	        startCalendar.add(Calendar.DATE, Integer.parseInt(nights[i])); 
		}
		
		int result = new PlanService().insertPlan(reqPlan, planDetailList);
		
		HashMap<String, Object> plan = new HashMap<String, Object>(); 
		plan.put("plan", reqPlan);
		plan.put("planDetail", planDetailList);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect("/et/selectPlanList.pl?mno="+Integer.parseInt(pWriter));
			
		} else {
			request.setAttribute("msg", "플랜저장에 실패하였습니다.");
			page = "selectCityList.pl";
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
//		RequestDispatcher view = request.getRequestDispatcher(page);
//		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
