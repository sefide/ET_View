package com.kh.et.plan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.plan.model.service.PlanService;

/**
 * Servlet implementation class UpdatePlanStatusServlet
 */
@WebServlet("/UpdateSetPrivate.pl")
public class UpdatePlanPrivateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePlanPrivateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pmNo = Integer.parseInt(request.getParameter("mNo"));
		int pFkpNo = Integer.parseInt(request.getParameter("pNo"));
		System.out.println(pmNo);
		System.out.println(pFkpNo);
		
		int result = new PlanService().updatePlanPrivate(pmNo,pFkpNo);
		
		String page="";
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/selectPlanList.pl?mno="+pmNo);
		}else {
			request.setAttribute("msg", "공개실패");
			page = "views/common/errorPage.jsp";
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
