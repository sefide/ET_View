package com.kh.et.manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;


@WebServlet("/select01.mng")
public class Manager_Select01_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Manager_Select01_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		int[] select=new int[3];
		
		select = new ManagerService().selectTotal();
		
		String page ="";
		if(select != null) {
			page = "views/manager/normalMember/manager_main.jsp";
			request.setAttribute("select", select);
		}else {
			page="views/common/errorPage";
			request.setAttribute("msg", "관리자화면으로 이동실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		
		view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
