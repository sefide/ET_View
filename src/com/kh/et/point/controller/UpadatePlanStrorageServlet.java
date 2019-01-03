package com.kh.et.point.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.vo.Member;
import com.kh.et.point.model.service.PointService;

/**
 * Servlet implementation class UpadatePlanStrorageServlet
 */
@WebServlet("/updatePlanStorage.po")
public class UpadatePlanStrorageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpadatePlanStrorageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mNo"));
		
		Member m = new Member();
		m.setM_no(mno);
		Member result = new PointService().insertPointStorage(mno,m);
		
		String page="";
		if(result != null) {
			request.getSession().setAttribute("loginUser", result);
			response.sendRedirect(request.getContextPath()+"/selectPlanList.pl?mno="+mno);
		}else {
			request.setAttribute("msg", "비공개 실패");
			page = "views/common/errorPage.jsp";
			//request.getRequestDispatcher("views/normal/member/user_join.jsp").forward(request, response);
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
