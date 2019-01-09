package com.kh.et.plan.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.board.model.vo.PageInfo;
import com.kh.et.plan.model.service.PlanService;

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
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage  = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 9;
		
		PlanService ps = new PlanService();
		
		// 전체 게시글 조회
		int listCount = ps.getListCount();
		System.out.println("servlet PlanlistCount : " + listCount);
		
		// 총 페이지 수 계산
		maxPage = (int)((double)listCount / limit + 0.9); 
		System.out.println("servlet maxPage : " + maxPage);  // 2
		
		// 현재 페이지에 보여 줄 시작페이지 수 
		startPage = ((int)((double)currentPage / limit + 0.9) -1) * limit + 1;
		
		// 목록 아래쪽에 보여질 마지막 페이지 수 
		endPage = startPage + 3 -1;
		System.out.println("servlet startPage : " + startPage);
		System.out.println("servlet EndPage : " + endPage);
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		System.out.println("servlet pi EndPage : " + pi.getEndPage());
		
		// bestplanMap- (인기순위, 해당 플랜) , bestCityMap
		HashMap<String, Object> bestPlanMap = new PlanService().selectBestPlan(); 		
		System.out.println("servlet에서 bestplanMap" + bestPlanMap);
		
		System.out.println("currentPage : " + currentPage);
		// normalplanMap - (날짜(시간), 해당시간) , normalCityMap
		HashMap<String, Object> normalPlanMap = new PlanService().selectnormalPlan(currentPage, limit); 		
		System.out.println("servlet에서 normalplanMap" + normalPlanMap);
		
		
		
		String page = "";
		if(bestPlanMap != null && normalPlanMap != null) {
			page = "views/normal/plan/seePlan_main.jsp";
			request.setAttribute("bestplanMap", bestPlanMap);
			request.setAttribute("normalPlanMap", normalPlanMap);
			request.setAttribute("pi", pi);
			
			System.out.println("돌아오기전 bestPlanMap:"+bestPlanMap);
			System.out.println("돌아오기전 normalPlanMap:"+normalPlanMap);
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
