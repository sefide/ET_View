package com.kh.et.manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;
import com.kh.et.plan.model.vo.City;

/**
 * Servlet implementation class ManagerUpdateTravelServlet
 */
@WebServlet("/updateCity.mng")
public class ManagerUpdateTravelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerUpdateTravelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String info=request.getParameter("content");
		int cno=Integer.parseInt(request.getParameter("comNo"));
		
		City reqCity=new City();
		
		reqCity.setCtInfo(info);
		reqCity.setCtNo(cno);
		
		int result=new ManagerService().updatetc(reqCity);
		
		String page="";
		if(result>0) {
			page="/et/selectCity.mng";
			response.sendRedirect(page);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "수정하기실패!");
			RequestDispatcher view=request.getRequestDispatcher(page);
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
