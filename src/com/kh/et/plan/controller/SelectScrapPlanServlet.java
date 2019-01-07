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
 * Servlet implementation class SelectScrapPlanServlet
 */
@WebServlet("/scrapplan.pl")
public class SelectScrapPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectScrapPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));	//세션에 담긴 로그인 정보에서 회원번호 빼오기
		
		//최근 스크랩 플랜 3개 가져오기(플랜과 플랜에 뿌려줄 도시를 뽑아와야한다 -> Service에서 두개 메소드 사용)
		HashMap<String, Object> scrapPlan = new PlanService().scrapPlan(mno);
		
		String page = "";
		if(scrapPlan != null) {
			page = "views/normal/myPage/myPage_activity_history.jsp";
			request.setAttribute("scrapPlan", scrapPlan);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "스크랩한 플랜 조회 실패!");
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
