package com.kh.et.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.service.MemberService;

/**
 * Servlet implementation class Member_KaKao_Login_Servlet
 */
@WebServlet("/kakaoLogin.me")
public class Member_KaKao_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_KaKao_Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userId");
		String userEmail = request.getParameter("userEmail");
		String password = request.getParameter("password");

		System.out.println("id : " + userName	); 
		System.out.println("kaccount_email : " + userEmail	); 
		System.out.println("password : " + password	); 
		
		int result = new MemberService().insertKakaoUser(userName,userEmail,password);
		
		if(result > 0) {
			request.setAttribute("userId", userEmail);
			request.setAttribute("userPwd", password);
			request.getRequestDispatcher("/snsLogin.me").forward(request, response);
		}else {
			request.setAttribute("userId", userEmail);
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
