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
		
		String test = request.getParameter("chkValue");
		System.out.println(test);
		
		String[] testChk = test.split(",");
		int comNo = 0;
		
		for(String msg : testChk) {
			System.out.println("테스트 체크!!! :" + msg);
			comNo = Integer.parseInt(msg);
		}

		
		Company c=new CompanyService().deleteCompany(testChk);
		
		String page="";
		
		if(c!=null) {
			page="/et/selectList.co";
			response.sendRedirect(page);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패!");
		}
		
		RequestDispatcher view=request.getRequestDispatcher(page);
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
