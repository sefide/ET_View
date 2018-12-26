package com.kh.et.company.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.company.model.service.CompanyService;
import com.kh.et.company.model.vo.Company;

/**
 * Servlet implementation class Company_login_Servlet
 */
@WebServlet("/login.company")
public class Company_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Company_Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String companyId = request.getParameter("companyId");
		String companyPwd = request.getParameter("companyPwd");
		
		System.out.println("제휴사 아이디 : " + companyId);
		System.out.println("제휴사 비번 : " + companyPwd);
		
		Company reqMember = new Company();
		reqMember.setC_id(companyId);
		reqMember.setC_pwd(companyPwd);
		
		Company loginCompany = new CompanyService().companyLogin(reqMember);
		
		if(loginCompany != null) {
			request.getSession().setAttribute("loginCompany", loginCompany);	//세션불러와서 정보넣어주고
			
			response.sendRedirect("views/company/tourBoard/com_main.jsp");	//여기로 이동하라
		}else {
			request.setAttribute("msg2", "로그인을 다시 해주시길 바랍니다!");	//로그인 실패 메세지를 보내고
			request.getRequestDispatcher("views/common/manager/manager_login.jsp").forward(request, response);	//실패 메세지를 띄워줄 페이지로 경로 설정을 해준다.
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
