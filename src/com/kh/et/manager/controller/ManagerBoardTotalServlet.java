package com.kh.et.manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;

/**
 * Servlet implementation class ManagerBoardTotalServlet
 */
@WebServlet("/total.mng")
public class ManagerBoardTotalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerBoardTotalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int[] total=new int[3];
		
		total= new ManagerService().total();
		
		String page ="";
		if(total != null) {
			page = "views/manager/board/manager_total_community.jsp";
			request.setAttribute("total", total);
		}else {
			page="views/common/errorPage";
			request.setAttribute("msg", "관리자화면으로 이동실패");
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
