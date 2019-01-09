package com.kh.et.plan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Synthesizer;

import com.google.gson.Gson;
import com.kh.et.member.model.vo.Member;
import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.PlanInterest;

/**
 * Servlet implementation class ClickLikePlanServlet
 */
@WebServlet("/clickLike.pl")
public class ClickLikePlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClickLikePlanServlet() {
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
				
				System.out.println("클릭 좋아요에 들어왔당@");
				System.out.println(pno);
				System.out.println(writer);
				System.out.println(user);
				System.out.println(likeStatus);
				
				PlanInterest pl = new PlanInterest();
				pl.setPno(pno);
				pl.setWriter(writer);
				pl.setUser(user);
						
				int result = new PlanService().clickLike(pl,likeStatus);
	
				String page = "";
				if(result > 0) {
					response.sendRedirect("/et/views/normal/plan/see_plan_detail.jsp");
					
				} else {
					request.setAttribute("msg", "좋아요에 실패하였습니다.");
					RequestDispatcher view = request.getRequestDispatcher(page);
					view.forward(request, response);
				}
				
				
				
			
			}
			
		
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
