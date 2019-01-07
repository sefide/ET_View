package com.kh.et.plan.controller;

import java.io.IOException;
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

/**
 * Servlet implementation class SelectPlanDetailServlet
 */
@WebServlet("/selectPlanDetail.pl")
public class SelectPlanDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPlanDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String planNo = request.getParameter("pno");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		HashMap<String, Object> planMap = new PlanService().selectPlanDetail(Integer.parseInt(planNo));
		HashMap<String,City> cityMap = new PlanService().selectCityMap();
		
		String page = "";
		if(planMap != null && cityMap != null) {
			page = "/views/normal/myPage/myPage_planDetail.jsp";
			request.setAttribute("planMap", planMap);
			request.setAttribute("cityMap", cityMap);
		}else {
			page = "selectPlanList.pl?mno="+loginUser.getM_no();
			request.setAttribute("msg", "일시적인 오류입니다. 조금 뒤에 다시 시도해주세요. ");
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
