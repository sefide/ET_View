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
 * Servlet implementation class ClickUnLikePlanServlet
 */
@WebServlet("/clickUnLike.pl")
public class ClickUnLikePlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClickUnLikePlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		int writer = Integer.parseInt(request.getParameter("writer"));
		int user = Integer.parseInt(request.getParameter("user"));
		
		
		String likeStatus = request.getParameter("status");
		
		PlanInterest pl = new PlanInterest();
		pl.setPno(pno);
		pl.setWriter(writer);
		pl.setUser(user);
		
		/*int result = new PlanService().clickUnLike(pl,likeStatus);
		
		int result = new PlanService().clickUnLike(pl);*/
		/*System.out.println("delete:"+result);*/
		response.setContentType("application/json");
		new Gson().toJson(pl, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
