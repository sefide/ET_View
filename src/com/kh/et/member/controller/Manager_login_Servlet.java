package com.kh.et.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.service.MemberService;
import com.kh.et.member.model.vo.MemberManagerCompany;

/**
 * Servlet implementation class Manager_login_Servlet
 */
@WebServlet("/login.manager")
public class Manager_login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manager_login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String managerId = request.getParameter("managerId");		//정보 받아오고
		String managerPwd = request.getParameter("managerPwd");
		
		/*System.out.println("매니저 아이디 : " + managerId);
		System.out.println("매니저 비번 : " + managerPwd);*/
		
		MemberManagerCompany reqMember = new MemberManagerCompany();		//관리자&제휴사 멤버 객체에 넣어주고
		reqMember.setM_id(managerId);	
		reqMember.setM_pwd(managerPwd);
		
		MemberManagerCompany loginManager = new MemberService().managerLogin(reqMember);
		
		if(loginManager != null) {//정보가 있으면
			request.getSession().setAttribute("loginManager", loginManager);
			
			response.sendRedirect("views/manager/normalMember/manager_main.jsp");	
		}else {
			request.setAttribute("msg1", "관리자님이 로그인에 실패하시면 어떡합니까..!!!!");
			request.getRequestDispatcher("views/common/manager/manager_login.jsp").forward(request, response);
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