package com.kh.et.plan.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.plan.model.service.PlanService;

/**
 * Servlet implementation class SelectAllScrapPlanServlet
 */
@WebServlet("/allscrapplan.pl")
public class SelectAllScrapPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllScrapPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		//내가 스크랩한 전체 플랜 뽑아 오기(지도 뽑아서 플랜위에 뿌리고)
		HashMap<String, Object> allScrapPlan = new PlanService().allScrapPlan(mno);
		
		String page = "";
		if(allScrapPlan != null) {
			request.setAttribute("allScrapPlan", allScrapPlan);
			page = "views/normal/myPage/myPage_activity_plan.jsp";
		}else {
			request.setAttribute("msg", "실패!");
			page = "views/common/errorPage.jsp";
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
