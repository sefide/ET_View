package com.kh.et.company.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.company.model.service.CompanyService;
import com.kh.et.company.model.vo.Company;

/**
 * Servlet implementation class DeleteCompanyServlet
 */
@WebServlet("/deleteOne.co")
public class DeleteCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String[]arr=request.getParameterValues("arr1[]");
		int[]arr2=new int[arr.length];
		
		for(int i=0;i<arr.length;i++) {
			System.out.println("arr[i]:"+arr[i]);
			arr2[i]=Integer.parseInt(arr[i]);
		}
		
		int result=new CompanyService().deleteCompany(arr2);

		if(result!=0) {
			response.getWriter().print("성공");
		}else {
			response.getWriter().print("실패");
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
