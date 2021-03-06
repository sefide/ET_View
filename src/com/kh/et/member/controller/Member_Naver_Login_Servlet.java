package com.kh.et.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.service.MemberService;

/**
 * Servlet implementation class Member_Naver_Login_Servlet
 */
@WebServlet("/naverLogin.me")
public class Member_Naver_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_Naver_Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.println(email);
		System.out.println(name);
		System.out.println(password);
		
		int result = new MemberService().insertNaverUser(name,email,password);
		
		if(result > 0) {
			request.setAttribute("userId", email);
			request.setAttribute("userPwd", password);
			request.getRequestDispatcher("/snsLogin.me").forward(request, response);
		}else {
			request.setAttribute("userId", email);
			request.setAttribute("userPwd", password);
			request.getRequestDispatcher("/snsLogin.me").forward(request, response);
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
