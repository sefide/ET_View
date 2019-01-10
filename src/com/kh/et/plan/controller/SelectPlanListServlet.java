package com.kh.et.plan.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.vo.Member;
import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.City;
import com.kh.et.plan.model.vo.Plan;

/**
 * Servlet implementation class SelectPlanListServlet
 */
@WebServlet("/selectPlanList.pl")
public class SelectPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPlanListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = ((Member)request.getSession().getAttribute("loginUser")).getM_no();
		
		HashMap<String,City> cityMap = new PlanService().selectCityMap();
		ArrayList<Plan> planList = new PlanService().selectPlanList(mno);
		
		
		String page ="";
		if(planList != null && cityMap != null) {
			page = "views/normal/myPage/myPage_main.jsp";
			request.setAttribute("planList", planList);
			request.setAttribute("cityMap", cityMap);
		}else {
			page = "index.jsp";
			request.setAttribute("msg", "일시적인 오류로 마이페이지 접근이 불가능합니다");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
