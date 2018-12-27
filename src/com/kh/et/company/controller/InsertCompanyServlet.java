package com.kh.et.company.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.company.model.service.CompanyService;
import com.kh.et.company.model.vo.Company;

/**
 * Servlet implementation class InsertCompanyServlet
 */
@WebServlet("/insertCompany.co")
public class InsertCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String num=request.getParameter("num");
		String phone=request.getParameter("phone");
		String term=request.getParameter("term");
		String term2=request.getParameter("term2");
		String ceonum=request.getParameter("ceonum");
		
		
		java.sql.Date day=null;
		java.sql.Date day2=null;
		
		if(term !="") {
			String[] dateArr=term.split("-");
			int[] drr=new int[dateArr.length];
			
			for(int i=0; i<dateArr.length;i++) {
				drr[i]=Integer.parseInt(dateArr[i]);
				
			}
			
			day=new java.sql.Date(new GregorianCalendar(drr[0],drr[1]-1,drr[2]).getTimeInMillis());
			
			
			
			
		}else {
			day=new java.sql.Date(new GregorianCalendar().getTimeInMillis());	
			
		}
		
		
		
		
		
		if(term2 !="") {
			String[] dateArr=term2.split("-");
			int[] drr=new int[dateArr.length];
			
			for(int i=0; i<dateArr.length;i++) {
				drr[i]=Integer.parseInt(dateArr[i]);
				
			}
			
			day2=new java.sql.Date(new GregorianCalendar(drr[0],drr[1]-1,drr[2]).getTimeInMillis());
			
			
			
			
		}else {
			day2=new java.sql.Date(new GregorianCalendar().getTimeInMillis());	
			
		}
		Company reqCompany=new Company();
		reqCompany.setC_name(name);
		reqCompany.setC_biss_num(num);
		reqCompany.setC_date(day);
		reqCompany.setC_end_date(day2);
		reqCompany.setC_phone(ceonum);
		
		
		int result=new CompanyService().insertCompany(reqCompany);
		String page="";
		if(result>0) {
			page="/views/manager/tourCompany/manager_company.jsp";
			response.sendRedirect(page);
		}else {
			request.setAttribute("msg", "실패");
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
