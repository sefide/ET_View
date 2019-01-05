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

import com.kh.et.board.model.service.BoardService;
import com.kh.et.board.model.vo.PageInfo;
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
		
		// bestplanMap- (인기순위, 해당 플랜) , bestCityMap
		HashMap<String, Object> bestPlanMap = new PlanService().selectBestPlan(); 		
		System.out.println("servlet에서 bestplanMap" + bestPlanMap);
		
		//---------------- 페이징처리 추가 -------------------
		int currentPage; // 현재 페이지를 표시할 변수
		int limit; // 한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시될 페이지가 끝나는 페이지

		// 현재 페이지 처리
		currentPage = 1;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));}

		// 한 페이지에 보여질 목록 갯수
		limit = 4;

		PlanService ps = new PlanService();
		// 전체 플랜 수 조회
		int listCount = ps.getListCount();

		// 총 페이지 수 계산
		// 예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int) ((double) listCount / limit + 0.9);

		// 현재 페이지에 보여줄 시작페이지 수
		// 1, 11, 21, 31,...
		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		// 목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
		endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		
		// normalplanMap - (날짜(시간), 해당시간) , normalCityMap
		HashMap<String, Object> normalPlanMap = new PlanService().selectnormalPlan(); 		
		System.out.println("servlet에서 normalplanMap" + normalPlanMap);
		
		
		
		String page = "";
		if(bestPlanMap != null && normalPlanMap != null) {
			page = "views/normal/plan/seePlan_main.jsp";
			request.setAttribute("bestplanMap", bestPlanMap);
			request.setAttribute("normalPlanMap", normalPlanMap);
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
