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
		
		// ---------------- 페이징처리 추가 -------------------
		int currentPage; // 현재 페이지를 표시할 변수
		int limit; // 한 페이지에 플랜이 몇 개가 보여질 것인지 표시
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시될 페이지가 끝나는 페이지
		
		//현재 페이지 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 플랜 6개씩 보여줄것이다
		limit = 6;
		
	//스크랩한 전체 플랜 수 조회
		int listCount = new PlanService().getScrapPlanListCount(mno);
		
		//총 페이지 수 계산
		//예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int)((double)listCount / limit + 0.9);
		
		// 현재 페이지에 보여줄 시작페이지 수
		// 1, 11, 21, 31,...
		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		// 목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
		endPage = startPage + 6 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo scrapPlanPi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		//내가 스크랩한 전체 플랜 뽑아 오기(지도 뽑아서 플랜위에 뿌리고)
		HashMap<String, Object> allScrapPlan = new PlanService().allScrapPlan(mno, currentPage, limit);
		
		String page = "";
		if(allScrapPlan != null) {
			request.setAttribute("allScrapPlan", allScrapPlan);
			request.setAttribute("scrapPlanPi", scrapPlanPi);
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
