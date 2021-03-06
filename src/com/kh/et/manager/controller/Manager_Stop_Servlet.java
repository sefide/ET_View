package com.kh.et.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;


@WebServlet("/stop.mng")
public class Manager_Stop_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Manager_Stop_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		int index =0;
		int day=0;
		
		index= Integer.parseInt(request.getParameter("index"));
		day = Integer.parseInt(request.getParameter("day"));
		System.out.println("index : "+index);
		System.out.println("day : "+day);
		
		//회원정지
		int result = new ManagerService().stopMember(index,day);
		
		if(result!=0) {
			response.getWriter().print("성공");
		}else {
			response.getWriter().print("실패");
		}
		
	}


	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
