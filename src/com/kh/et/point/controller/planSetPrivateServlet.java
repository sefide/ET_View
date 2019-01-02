package com.kh.et.point.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.point.model.service.PointService;
import com.kh.et.point.model.vo.Point;

/**
 * Servlet implementation class planSetPrivateServlet
 */
@WebServlet("/planSetPrivate.po")
public class planSetPrivateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public planSetPrivateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pmNo = Integer.parseInt(request.getParameter("mNo"));
		int pFkpNo = Integer.parseInt(request.getParameter("pNo"));
		
		/*Point p  = new Point();*/
		
		int result = new PointService().insertPoint(pmNo,pFkpNo);
		System.out.println("servlet");
		
		String page="";
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/selectPlanList.pl?mno="+pmNo);
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
