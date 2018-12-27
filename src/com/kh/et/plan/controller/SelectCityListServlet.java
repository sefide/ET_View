package com.kh.et.plan.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.City;

/**
 * Servlet implementation class SelectCityListServlet
 */
@WebServlet("/selectCityList.pl")
public class SelectCityListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCityListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i = 0;
		ArrayList<City> cityList = new PlanService().selectCityList();
		
		String page = "";
		if(cityList != null) {
			request.setAttribute("cityList", cityList);
			System.out.println("뭐냐");
			page = "/views/normal/plan/create_plan.jsp";
		}else {
			request.setAttribute("msg", "플랜짜기를 나중에 시도해주세요. 죄송합니다. ");
			page = "/et/index.jsp";
			System.out.println("에러");
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
