package com.kh.et.plan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.vo.Member;
import com.kh.et.plan.model.service.PlanService;

/**
 * Servlet implementation class DeletePlanServlet
 */
@WebServlet("/deletePlan.pl")
public class DeletePlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int planNo = Integer.parseInt(request.getParameter("pno"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int result = new PlanService().deletePlan(planNo);
		
		String page = "";
		if(result > 0) {
			// 회원 플랜개수 수정 
			Member oldUser = (Member) request.getSession().getAttribute("loginUser");
			int newPlanNum = oldUser.getM_plan_num() -1;
			oldUser.setM_plan_num(newPlanNum);
			request.getSession().setAttribute("loginUser", oldUser);
			
			page ="selectPlanList.pl?mno="+loginUser.getM_no();
			request.setAttribute("msg", "플랜이 삭제되었습니다.");
		}else {
			page ="selectPlanList.pl?mno="+loginUser.getM_no();
			request.setAttribute("msg", "일시적인 오류로 삭제되지 않았습니다. 나중에 다시 시도해주세요.");
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
