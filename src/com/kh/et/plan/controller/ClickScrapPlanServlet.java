package com.kh.et.plan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.PlanInterest;

/**
 * Servlet implementation class ClickScrapPlanServlet
 */
@WebServlet("/clickScrapPlan.pl")
public class ClickScrapPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClickScrapPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		int user = Integer.parseInt(request.getParameter("user"));
		int writer = Integer.parseInt(request.getParameter("writer"));
		
		/*System.out.println("플랜번호 = "+pno);
		System.out.println("로그인 유저 = "+user);
		System.out.println("플랜 작성자 = "+writer);*/

		PlanInterest pl = new PlanInterest();
		pl.setPno(pno);
		pl.setWriter(writer);
		pl.setUser(user);
				
		int result = new PlanService().clickScrap(pl);
		
		System.out.println(result);
		
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
