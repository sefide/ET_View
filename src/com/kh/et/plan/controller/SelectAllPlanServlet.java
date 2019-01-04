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

import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.City;

/**
 * Servlet implementation class SelectAllPlanServlet
 */
@WebServlet("/selectallPlan.pl")
public class SelectAllPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("모든 플랜보기 서블릿에 들어왔당!");
		
		// bestplanMap- (인기순위, 해당 플랜) , CityMap
		HashMap<String, Object> bestplanMap = new PlanService().selectBestPlan(); 
		
		System.out.println("servlet에서 map" + bestplanMap);
		
		String page = "";
		if(bestplanMap != null) {
			page = "views/normal/plan/seePlan_main.jsp";
			request.setAttribute("bestplanMap", bestplanMap);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
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
